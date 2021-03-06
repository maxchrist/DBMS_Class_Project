INSERT INTO mountain_ranges(Name,Country,Tallest_Peak) VALUES
 ('Appalachian','USA','Mount Mitchell')
,('Adirondack','USA','Mount Marcy')
,('Rocky Mountains','USA','Mount Elbert')
,('Sierra Nevada','USA','Mount Whitney')
,('Cascades','USA','Mount Rainier')
,('Panamint Range','USA','Telescope Peak')
,('Olympic','USA','Mount Olympus')
,('Sawtooth Range','USA','Thompson Peak')
,('Unita','USA','Kings Peak')
,('Teton Range','USA','Grand Teton');

INSERT INTO national_parks(Name,Year_Founded,Park_Size,Country) VALUES
 ('Acadia',1919, 49076.63,'USA')
,('Arches',1971, 76678.98,'USA')
,('Death Valley',1994, 3408406.73,'USA')
,('Everglades',1934, 1508938.57,'USA')
,('Grand Canyon',1919,1201647.03,'USA')
,('Shenandoah',1935,199223.77,'USA')
,('Yosemite',1890,761747.50,'USA')
,('Olympic',1938,922649.41,'USA')
,('Great Smoky Mountains',1934,522426.88,'USA')
,('Grand Teton',1929,310044.36,'USA')
,('Mount Rainier',1899,236381.64,'USA');

INSERT INTO rangers(Name,Dob,Address,Phone,Manages_Park_Name,Manages_Park_Year_Founded) VALUES
 ('Cathy Pfister','09/20/1965','10 Park Loop Dr, Bar Harbor, ME 04609','879-239-6525','Acadia',1919)
,('Norman Puth','08/10/1982','2282 Resource Blvd, Moab, UT 84532','990-290-3398','Arches',1971)
,('Garrett Haut','10/24/1990','120 California Highway, Death Valley, CA 92328','054-298-7349','Death Valley',1994)
,('Sydney Stern','12/12/1973','40001 State Hwy 9336, Homestead, FL 33034','847-285-8275','Everglades',1934)
,('Andrew Bis','09/26/1958','20 South Entrance Road, Grand Canyon, AZ 86023','109-234-8203','Grand Canyon',1919)
,('Sarah Mills','07/11/1968','3655 Hwy 211 East, Luray, VA 22835','902-996-5983','Shenandoah',1935)
,('Nancy Hallows','03/01/1974','Highway 41, Yosemite, CA 95389','880-438-7602','Yosemite',1890)
,('Bill Bernsdorf','02/08/1965','3002 Mount Angeles Road, Port Angeles, WA 98362','557-334-6211','Olympic',1938)
,('Carol Smith','09/29/1993','107 Park Headquarters Road, Gatlinburg, TN 37738','990-553-7854','Great Smoky Mountains',1934)
,('Ben Rapids','11/20/1950','103 Headquarters Loop, Moose, WY 83012-0170','201-113-4387','Grand Teton',1929)
,('John Caraway','05/19/1989','55210 238th Avenue East, Ashford, WA 98304','883-922-4747','Mount Rainier',1899);

INSERT INTO mountains(Name,Elevation,Coordinates,Part_Of_Mountain_Range,in_National_Park_Name,in_National_Park_Year_Founded) VALUES
 ('Cadillac',1529,'44.3512694,-68.2264888','Appalachian','Acadia',1919)
,('Beehive',539,'44.5130119,-67.1883055','Appalachian','Acadia',1919)
,('Telescope Peak',11043,'36.1698167,-117.0891972','Panamint Range','Death Valley',1994)
,('Hawksbill',4050,'38.5552778,-78.395000','Appalachian','Shenandoah',1935)
,('Old Rag',3284,'38.5518333,-78.31452777','Appalachian','Shenandoah',1935)
,('Half Dome',8846,'37.7460361,-119.5329388','Sierra Nevada','Yosemite',1890)
,('El Capitan',7573,'37.7422222,-119.635833','Sierra Nevada','Yosemite',1890)
,('Mount Olympus',7980,'47.8012972,-123.7108361','Olympic','Olympic',1938)
,('Mount Constance',7756,'47.7728139,-123.1273527','Olympic','Olympic',1938)
,('Mount Rainier',14411,'46.8528861,-121.7603722','Cascades','Mount Rainier',1899)
,('Clingmans Dome',6643,'35.5628722,-83.4984972','Appalachian','Great Smoky Mountains',1934);

INSERT INTO trails(Name,Trailhead,Difficulty,Trail_Length,Elevation_Change,Mountain_Coordinates) VALUES
 ('Gorge Path','44.3726111,-68.2220000','Hard',3.4,1286,'44.3512694,-68.2264888')
,('Beehive Loop','44.3316389,-68.18530555','Hard',1.4,488,'44.5130119,-67.1883055')
,('Charcoal Kilns','36.2466000,-117.0760000','Hard',15.5,4363,'36.1698167,-117.0891972')
,('Mengel Pass','35.8588000,-117.1794000','Hard',14.3,3656,'36.1698167,-117.0891972')
,('Linville Gorge','35.9033000,-81.8796000','Moderate',7.24,2661,'38.5552778,-78.395000')
,('White Oak Falls','38.5857000,-78.3831000','Easy',7.81,1558,'38.5518333,-78.31452777')
,('Yosemite Valley Loop','37.7484000,-119.5879000','Moderate',9.67,289,'37.7460361,-119.5329388')
,('Eagle Peak','37.7334000,-119.637500','Moderate',12.3,5358,'37.7422222,-119.635833')
,('Big Quilcene Trail','47.8279000,-123.0410000','Moderate',12.15,4035,'47.8012972,-123.7108361')
,('Elk Ridge Trail','47.9184000,-123.382000','Moderate',5.8,1286,'47.8012972,-123.7108361')
,('South Tunnel Creek Trail','47.7811000,-123.0521000','Moderate',10.3,3189,'47.7728139,-123.1273527')
,('Mount Rainer Summit','46.8361000,-121.7324000','Very Hard',21.38,9760,'46.8528861,-121.7603722')
,('Clingmans Loop','35.5639000,-83.4969000','Moderate',18.44,7270,'35.5628722,-83.4984972');

INSERT INTO campgrounds(Name,Address,Has_Tent_Sites,Capacity,Price,Located_In_Park_Name,Located_In_Park_Year_Founded) VALUES
 ('Bar Harbor Campground','409 ME-3, Bar Harbor, ME 04609','Y',500,20,'Acadia','1919')
,('Devils Garden Campground','2282 Resource Blvd, Moab, UT 84532','Y',51,25,'Arches','1971')
,('Furnace Creek','Furnace Creek Campground, Death Valley, CA 92328','Y',136,22,'Death Valley','1994')
,('Flamingo Campground','1 Flamingo Lodge Hwy Homestead, FL 33034','Y',100,25,'Everglades','1934')
,('Mather Campground','Havasupai St, Grand Canyon Village, AZ 86023','Y',50,18,'Grand Canyon','1919')
,('Mathews Arm','3655 HIGHWAY 211 EAST LURAY, VA 22835','Y',166,15,'Shenandoah','1935')
,('Upper Pines','YOSEMITE NATIONAL PARK, CA 95389','Y',238,26,'Yosemite','1890')
,('Kalaloch','HWY 101 MILE POST MARKER 157683, WA 98331-9354','Y',100,25,'Olympic','1938')
,('Abrams Creek','Abrams Creek Campground Rd, Tallassee, TN 37878','Y',100,18,'Great Smoky Mountains','1934')
,('Gros Ventre','100 Gros Ventre Campground Road, Moran, WY 83013','Y',300,0,'Grand Teton','1929')
,('Cougar Rock','Ashford, WA 98304','Y',173,20,'Mount Rainier','1899');


INSERT INTO hikers(Name,Dob,Years_Experience,Camp_Name,Camp_Address) VALUES
 ('Frank Mosatto','04/11/1987',20,'Bar Harbor Campground','409 ME-3, Bar Harbor, ME 04609')
,('Jill Hatton','01/07/1996',10,'Devils Garden Campground','2282 Resource Blvd, Moab, UT 84532')
,('Paul Kinderman','12/05/1970',32,'Furnace Creek','Furnace Creek Campground, Death Valley, CA 92328')
,('Casi Rosche','08/21/1984',16,'Flamingo Campground','1 Flamingo Lodge Hwy Homestead, FL 33034')
,('Sam Speed','05/29/1965',22,'Mather Campground','Havasupai St, Grand Canyon Village, AZ 86023')
,('Sue Parker','07/14/1950',39,'Mathews Arm','3655 HIGHWAY 211 EAST LURAY, VA 22835')
,('Edmund Coleman','09/22/1949',43,'Upper Pines','YOSEMITE NATIONAL PARK, CA 95389')
,('Piper Smith','10/19/2000',5,'Kalaloch','HWY 101 MILE POST MARKER 157683, WA 98331-9354')
,('Darcy Steinberg','03/02/1989',19,'Abrams Creek','Abrams Creek Campground Rd, Tallassee, TN 37878')
,('Sterling Green','05/10/1990',8,'Gros Ventre','100 Gros Ventre Campground Road, Moran, WY 83013')
,('Amy Mahler','06/03/1959',28,'Kalaloch','HWY 101 MILE POST MARKER 157683, WA 98331-9354')
,('Jane Bellows','01/28/1973',25,'Abrams Creek','Abrams Creek Campground Rd, Tallassee, TN 37878')
,('Michael Addams','05/12/2001',2,'Gros Ventre','100 Gros Ventre Campground Road, Moran, WY 83013')
,('Michelle Bowler','06/23/1992',5,'Cougar Rock','Ashford, WA 98304');

INSERT INTO hikes(Hiker_Name,Hiker_Dob,Trail_Name,Trail_Trailhead) VALUES
 ('Frank Mosatto','04/11/1987','Gorge Path','44.3726111,-68.2220000')
,('Jill Hatton','01/07/1996','Beehive Loop','44.3316389,-68.18530555')
,('Paul Kinderman','12/05/1970','Charcoal Kilns','36.2466000,-117.0760000')
,('Casi Rosche','08/21/1984','Mengel Pass','35.8588000,-117.1794000')
,('Sam Speed','05/29/1965','Linville Gorge','35.9033000,-81.8796000')
,('Sue Parker','07/14/1950','White Oak Falls','38.5857000,-78.3831000')
,('Edmund Coleman','09/22/1949','Yosemite Valley Loop','37.7484000,-119.5879000')
,('Piper Smith','10/19/2000','Eagle Peak','37.7334000,-119.637500')
,('Darcy Steinberg','03/02/1989','Big Quilcene Trail','47.8279000,-123.0410000')
,('Sterling Green','05/10/1990','Elk Ridge Trail','47.9184000,-123.382000')
,('Jill Hatton','01/07/1996','Gorge Path','44.3726111,-68.2220000')
,('Paul Kinderman','12/05/1970','Mengel Pass','35.8588000,-117.1794000')
,('Paul Kinderman','12/05/1970','Linville Gorge','35.9033000,-81.8796000')
,('Sue Parker','07/14/1950','Yosemite Valley Loop','37.7484000,-119.5879000')
,('Sue Parker','07/14/1950','Eagle Peak','37.7334000,-119.637500')
,('Paul Kinderman','12/05/1970','Mount Rainer Summit','46.8361000,-121.7324000')
,('Paul Kinderman','12/05/1970','Clingmans Loop','35.5639000,-83.4969000')
,('Darcy Steinberg', '03/02/1989', 'Beehive Loop', '44.3316389,-68.18530555');

INSERT INTO supplies(Owned_By_Name,Owned_By_Dob,Name,Quantity,Weight) VALUES
 ('Frank Mosatto','04/11/1987','Water purifier',1,2)
,('Jill Hatton','01/07/1996','Trail snacks',10,24)
,('Casi Rosche','08/21/1984','Compass',1,2.6)
,('Sam Speed','05/29/1965','Compass',1,2.6)
,('Sue Parker','07/14/1950','Altimeter',1,1.83)
,('Darcy Steinberg','03/02/1989','GPS',2,8.1)
,('Piper Smith','10/19/2000','Water purifier',1,2)
,('Darcy Steinberg','03/02/1989','Water purifier',1,2)
,('Sterling Green','05/10/1990','GPS',1,7.5)
,('Amy Mahler','06/03/1959','Altimeter',1,1.83)
,('Amy Mahler','06/03/1959','Satellite phone',1,11.2)
,('Amy Mahler','06/03/1959','First-aid kit',3,5)
,('Piper Smith','10/19/2000','First-aid kit',2,8)
,('Frank Mosatto','04/11/1987','First-aid kit',1,10)
,('Frank Mosatto','04/11/1987','Whistle',3,0.4)
,('Sue Parker','07/14/1950','Bear spray',1,11)
,('Sue Parker','07/14/1950','Knife',1,4.6)
,('Piper Smith','10/19/2000','Multi-tool',1,6)
,('Jane Bellows','01/28/1973','Gear-repair kit',1,10)
,('Jane Bellows','01/28/1973','Headlamp',2,2.8)
,('Jane Bellows','01/28/1973','Two-way radio',1,9.6)
,('Michael Addams','05/12/2001','Two-way radio',1,9.6);

INSERT INTO injuries(Name,Body_Part,Severity,Hiker_Name,Hiker_Dob,On_Trail_Name,On_Trail_Trailhead) VALUES
 ('Poison Ivy','Legs',3,'Frank Mosatto','04/11/1987','Gorge Path','44.3726111,-68.2220000')
,('Sprained Ankle','Ankle',1,'Jill Hatton','01/07/1996','Beehive Loop','44.3316389,-68.18530555')
,('Temperature-related Illness','Head',4,'Paul Kinderman','12/05/1970','Charcoal Kilns','36.2466000,-117.0760000')
,('Temperature-related Illness','Head',4,'Casi Rosche','08/21/1984','Mengel Pass','35.8588000,-117.1794000')
,('Joint Inflammation','Knee',2,'Sam Speed','05/29/1965','Linville Gorge','35.9033000,-81.8796000')
,('Sprained Ankle','Ankle',1,'Sue Parker','07/14/1950','White Oak Falls','38.5857000,-78.3831000')
,('Sunburn','Face',3,'Edmund Coleman','09/22/1949','Yosemite Valley Loop','37.7484000,-119.5879000')
,('Insect bite','Arm',2,'Piper Smith','10/19/2000','Eagle Peak','37.7334000,-119.637500')
,('Exhaustion','Body',3,'Darcy Steinberg','03/02/1989','Big Quilcene Trail','47.8279000,-123.0410000')
,('Insect bite','Legs',1,'Sterling Green','05/10/1990','Elk Ridge Trail','47.9184000,-123.382000')
,('Broken Ribs','Abdomen',5,'Jill Hatton','01/07/1996','Beehive Loop','44.3316389,-68.18530555')
,('Head Trauma','Head',5,'Darcy Steinberg','03/02/1989','Beehive Loop','44.3316389,-68.18530555')
,('Broken Leg','Leg',4,'Paul Kinderman','12/05/1970','Mount Rainer Summit','46.8361000,-121.7324000')
,('Sprained Wrist','Wrist',2,'Michelle Bowler','06/23/1992','Mount Rainer Summit','46.8361000,-121.7324000');