drop table if exists Hikers, Supplies, Injuries, hikes, Trails, Mountains, National_parks, Mountain_ranges, Campgrounds, Rangers CASCADE;

/*The following table contains the Mountain_ranges entity*/
create table Mountain_ranges (
	name char(32) primary key,
	country char(32),
	Tallest_peak char(32)
);

/*The following table contains the National_parks entity set*/
create table National_parks (
	name char(32),
	year_founded integer,
	park_size float,
	country char(32),
	primary key(name,year_founded)
);

/*The following table contains the Mountains entity set and the part_of and are_in relations*/
create table Mountains (
	name char(32),
	elevation float,
	coordinates char(50) primary key,
	part_of_mountain_range char(32),
	in_national_park_name char(32),
	in_national_park_year_founded integer,
	foreign key (part_of_mountain_range) references Mountain_ranges(name),
	foreign key (in_national_park_name, in_national_park_year_founded) references National_parks(name, year_founded)
);

/*The following table contains the campground entity set and the located_in relation*/
create table Campgrounds (
	name char(32),
	address char(250),
	has_tent_sites boolean,
	capacity integer,
	price float,
	located_in_park_name char(32) not null,
	located_in_park_year_founded integer not null,
	primary key(name,address),
	foreign key (located_in_park_name, located_in_park_year_founded) references National_parks(name, year_founded)
);

/*The following table contains the Hikers entity set and the camp relation*/
create table Hikers (
	name char(32),
	dob date,
	years_experience integer,
	camp_name char(32),
	camp_address char(250),
	primary key(name, dob),
	foreign key (camp_name, camp_address) references Campgrounds(name,address)
);

/*The following table contains the supplies weak entity set and its relation to Hikers*/
create table Supplies (
	name char(32),
	quantity integer,
	weight float,
	owned_by_name char(32) not null,
	owned_by_dob date not null,
	primary key(name, owned_by_name, owned_by_dob),
	foreign key (owned_by_name, owned_by_dob) references Hikers(name, dob) on delete cascade
);

/*The following table contains the trails entity set and the exist_on relation*/
create table Trails (
	name char(32),
	trailhead char(32),
	difficulty char(12),
	trail_length float,
	elevation_change float,
	mountain_coordinates char(50) not null,
	primary key(name, trailhead),
	foreign key (mountain_coordinates) references Mountains(coordinates)
);

/*The following table contains the injuries entity set and the injured ternary relationship with hikers and trails */
create table Injuries (
	name char(32),
	body_part char(32),
	severity integer,
	hiker_name char(32),
	hiker_dob date,
	on_trail_name char(32),
	on_trail_trailhead char(32),
	primary key(name, body_part, hiker_name, hiker_dob, on_trail_name, on_trail_trailhead),
	foreign key (hiker_name, hiker_dob) references Hikers(name, dob),
	foreign key (on_trail_name, on_trail_trailhead) references Trails(name, trailhead)
);

/*The following table contains the hikes relation*/
create table hikes (
	hiker_name char(32),
	hiker_dob date,
	trail_name char(32),
	trail_trailhead char(32),
	primary key(hiker_name,hiker_dob,trail_name,trail_trailhead),
	foreign key (hiker_name, hiker_dob) references Hikers(name, dob),
	foreign key (trail_name, trail_trailhead) references Trails(name, trailhead)
);

/*The following table contains the Rangers entity set and manage relation*/
create table Rangers (
	name char(32),
	dob date,
	address char(250),
	phone char(32),
	manages_park_name char(32) not null,
	manages_park_year_founded integer not null,
	primary key(name, dob),
	foreign key (manages_park_name, manages_park_year_founded) references National_parks(name, year_founded)
);

