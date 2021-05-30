import pandas as pd
import psycopg2
import streamlit as st
from configparser import ConfigParser

'# Hiking Application'


@st.cache
def get_config(filename='database.ini', section='postgresql'):
    parser = ConfigParser()
    parser.read(filename)
    return {k: v for k, v in parser.items(section)}


@st.cache
def query_db(sql: str):
    # print(f'Running query_db(): {sql}')

    db_info = get_config()

    # Connect to an existing database
    conn = psycopg2.connect(**db_info)

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    cur.execute(sql)

    # Obtain data
    data = cur.fetchall()

    column_names = [desc[0] for desc in cur.description]

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()

    df = pd.DataFrame(data=data, columns=column_names)

    return df


'## Read tables'
sql_all_table_names = "select relname from pg_class where relkind='r' and relname !~ '^(pg_|sql_)';"
all_table_names = query_db(sql_all_table_names)['relname'].tolist()
table_name = st.selectbox('Choose a table', all_table_names)
if table_name:
    f'Display the table'
    sql_table = f'select * from {table_name};'
    df = query_db(sql_table)
    st.dataframe(df)


'## Query number of supplies across all hikers'
sql_supply_name = 'select distinct s.name from supplies s;'
supply_name = query_db(sql_supply_name)['name'].tolist()
supply_name = st.selectbox('Choose a supply', supply_name)
if supply_name:
    sql_number_supplies = f"select distinct s.name, sum(s.quantity) as tot_num_supplies from supplies s where s.name = '{supply_name}' group by s.name;"
    num_supplies_info = query_db(sql_number_supplies).loc[0]
    s_name, s_num = num_supplies_info['name'], num_supplies_info['tot_num_supplies']
    st.write(f"The total number of {s_name}s across all hikers is {s_num}.")


# Display a list of hikers carrying over x lbs of supplies
'## Query hikers carrying over a given weight (lbs)'
input_weight = float(st.number_input('Enter a number'))
if input_weight:
    sql_hikers_carrying = f"select distinct s.owned_by_name, s.owned_by_dob from (select distinct s.owned_by_name, s.owned_by_dob, sum(s.weight) as tot_weight from supplies s group by s.owned_by_name, s.owned_by_dob) as s where s.tot_weight > {input_weight};"
    hikers_carrying_info = query_db(sql_hikers_carrying)
    st.dataframe(hikers_carrying_info)


'## Query injuries by trails (Trails are identified by trail name and trailhead)'
sql_trails = 'select distinct t.name, t.trailhead from trails t;'
trails = query_db(sql_trails)['name'].tolist()
trailhead = query_db(sql_trails)['trailhead'].tolist()
options = [i.strip() + ',' + str(j) for i, j in zip(trails, trailhead)]
selected_trails = st.multiselect('Choose trails', options)
if len(selected_trails) > 1:
    selected_trails = [tuple(i.split(',', 1)) for i in selected_trails]
    selected_trails = tuple(selected_trails)
    sql_injuries_on_trails = f"select t.name, t.trailhead, count(*) as num_injuries, round(avg(i.severity),2) as avg_severity from trails t, injuries i where t.name = i.on_trail_name and t.trailhead = i.on_trail_trailhead and (t.name, t.trailhead) in {selected_trails} group by t.name,t.trailhead;"
elif len(selected_trails) == 0:
    pass
else:
    selected_trails = [i.split(',', 1) for i in selected_trails]
    selected_trails = tuple(selected_trails)
    selected_trails = selected_trails[0]
    sql_injuries_on_trails = f"select t.name, t.trailhead, count(*) as num_injuries, round(avg(i.severity),2) as avg_severity from trails t, injuries i where t.name = i.on_trail_name and t.trailhead = i.on_trail_trailhead and t.name = '{selected_trails[0]}' and t.trailhead = '{selected_trails[1]}' group by t.name,t.trailhead;"
if selected_trails:
    injuries_on_trails_info = query_db(sql_injuries_on_trails)
    st.dataframe(injuries_on_trails_info)


# Display the trails at national parks (text-input for national park?)
'## Query trails at a National Park'
input_name = st.text_input('Enter a full or partial park name (case sensitive)')
if input_name:
    sql_trails_at_parks = f"select t.name, t.trailhead, t. difficulty, t.trail_length, t.elevation_change, m.name as mountain, np.name as national_park from trails t, mountains m, national_parks np where t.mountain_coordinates = m.coordinates and m.in_national_park_name = np.name and m.in_national_park_year_founded = np.year_founded and np.name like '%{input_name}%';"
    trail_in_park_info = query_db(sql_trails_at_parks)
    st.dataframe(trail_in_park_info)

'## Query hiker statistics'
sql_hikers = 'select distinct h.name,h.dob from hikers h, hikes hs where h.name = hs.hiker_name and h.dob = hs.hiker_dob;'
hikers = query_db(sql_hikers)['name'].tolist()
dob = query_db(sql_hikers)['dob'].tolist()
options = [i.strip() + ", " + str(j) for i, j in zip(hikers, dob)]
hiker = st.selectbox('Choose a hiker', options)
if hiker:
    x = hiker.split(", ")
    sql = f"""select H.name, H.dob, sum(trail_length) as total_distance
                from hikers H, hikes Hi, trails T
                where H.name = Hi.hiker_name and H.dob = Hi.hiker_dob and T.name = Hi.trail_name and T.trailhead = Hi.trail_trailhead and H.name = '{x[0]}' and H.dob = '{x[1]}'::date
                group by H.name, H.dob;"""
    hiker_info = query_db(sql).loc[0]
    h_name, h_dob, h_total_distance = hiker_info['name'], hiker_info['dob'], hiker_info['total_distance']
    st.write(f"{h_name} (born {h_dob}) has hiked a total of {h_total_distance} miles.")

'## Query mountains in National Parks'
# Display mountains by national parks
sql_parks = 'select name,year_founded from national_parks;'
parks = query_db(sql_parks)['name'].tolist()
year_founded = query_db(sql_parks)['year_founded'].tolist()
options = [i.strip() + ", " + str(j) for i, j in zip(parks, year_founded)]
park = st.multiselect('Choose one or more National Parks:', options)
if park:
    results = pd.DataFrame(columns=["name", "year_founded", "country", "mountain_name"])
    for p in park:
        x = p.split(", ")
        sql = f"""select N.name, N.year_founded, N.country, M.name as mountain_name
                    from national_parks N, mountains M
                    where N.name = M.in_national_park_name and N.year_founded = M.in_national_park_year_founded
                              and N.name = '{x[0]}' and N.year_founded={x[1]};"""
        park_info = query_db(sql)
        results = results.append(park_info)
    st.write(results)

'## Query campgrounds'
# List national parks with campgrounds under a certain price
cost = st.slider('Search for national parks with the cheapest campground prices, under a certain price per night (USD):', 0, 100, 20)
if cost:
    sql = f"""select N.name, N.year_founded, N.country, min(C.price) as lowest_campground_price
                from national_parks N, campgrounds C
                where N.name = C.located_in_park_name and N.year_founded = C.located_in_park_year_founded and C.price <= {cost}
                group by N.name, N.year_founded, N.country;
                """
    park_prices = query_db(sql)
    st.write(park_prices)
