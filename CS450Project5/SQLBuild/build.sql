/*
	Filename: build.sql
	Author: Walter Hiranpat
	Description: Contain the complete script with which 
		you constructed your database
*/

drop table VDIAGNOSES;
drop table VISIT;
drop table SCHEDULE;
drop table TIMESLOT;
drop table PATIENT; 
drop table DIAGNOSE;
drop table EXPERT;
drop table SPECIALTY;
drop table STAFF;

create table STAFF
(
	Emp number(2),
	Ename varchar2(20),
	Title varchar2(20),
	PRIMARY KEY (Emp)
);
insert into STAFF values(1,'Harry Gutierrez','Doctor');
insert into STAFF values(2,'Joshua Pierce','Doctor');
insert into STAFF values(3,'Philip Freeman','Doctor');
insert into STAFF values(4,'Frances Sanchez','Doctor');
insert into STAFF values(5,'Ronald Ferguson','Doctor');
insert into STAFF values(6,'Paul Wood','Doctor');
insert into STAFF values(7,'Beverly Williams','Doctor');
insert into STAFF values(8,'Benjamin Evans','Doctor');
insert into STAFF values(9,'Michelle Little','Nurse');
insert into STAFF values(10,'Martin Watkins','Nurse');
insert into STAFF values(11,'Frances Richardson','Nurse');
insert into STAFF values(12,'Russell Fields','Nurse');
insert into STAFF values(13,'Marie Cunningham','Nurse');
insert into STAFF values(14,'Fred Montgomery','Nurse');
insert into STAFF values(15,'Katherine Banks','Nurse');
insert into STAFF values(16,'Dorothy Mccoy','Nurse');
insert into STAFF values(17,'Stephanie Hansen','Nurse');
insert into STAFF values(18,'Phyllis Richards','Nurse');
insert into STAFF values(19,'Louise Andrews','Nurse');


create table SPECIALTY
(
	Scode number(3),
	SName varchar2(20),
	PRIMARY KEY(Scode)
);
insert into SPECIALTY values(300,'ORTHALMOLOGIST');
insert into SPECIALTY values(301,'ORTHOPEDIST');
insert into SPECIALTY values(302,'DERMATOLOGIST');
insert into SPECIALTY values(303,'CARDIOLOGIST');
insert into SPECIALTY values(304,'DENTIST');
insert into SPECIALTY values(305,'AUDIOLOGIST');
insert into SPECIALTY values(306,'NEUROLOGIST');
insert into SPECIALTY values(307,'PODIATRIST');

create table EXPERT
(
	Emp number(2),
	Scode number(3),
	FOREIGN KEY (Emp) REFERENCES STAFF(Emp),
	FOREIGN KEY (Scode) REFERENCES SPECIALTY(Scode)
);
insert into EXPERT values(1,300);
insert into EXPERT values(2,301);
insert into EXPERT values(3,302);
insert into EXPERT values(4,303);
insert into EXPERT values(5,304);
insert into EXPERT values(6,305);
insert into EXPERT values(7,300);
insert into EXPERT values(7,301);
insert into EXPERT values(7,302);
insert into EXPERT values(7,303);
insert into EXPERT values(7,304);
insert into EXPERT values(7,305);
insert into EXPERT values(7,306);
insert into EXPERT values(7,307);
insert into EXPERT values(8,307);
insert into EXPERT values(9,305);
insert into EXPERT values(10,306);
insert into EXPERT values(11,307);
insert into EXPERT values(12,303);
insert into EXPERT values(13,300);
insert into EXPERT values(14,301);
insert into EXPERT values(15,303);
insert into EXPERT values(16,303);
insert into EXPERT values(17,304);
insert into EXPERT values(18,305);
insert into EXPERT values(19,306);

create table DIAGNOSE 
(
	Scode number(3),
	Dcode number(3),
	Price number(3),
	PRIMARY KEY (Scode, Dcode),
	FOREIGN KEY (Scode) REFERENCES SPECIALTY(Scode)
);
insert into DIAGNOSE values(300,100,344);
insert into DIAGNOSE values(301,101,149);
insert into DIAGNOSE values(302,102,39);
insert into DIAGNOSE values(303,103,117);
insert into DIAGNOSE values(304,104,428);
insert into DIAGNOSE values(305,105,234);
insert into DIAGNOSE values(305,106,200);
insert into DIAGNOSE values(306,105,100);
insert into DIAGNOSE values(306,106,139);
insert into DIAGNOSE values(307,107,393);

create table PATIENT 
(
	SSN number(9),
	Pname varchar2(20),
	DOB number(8),
	Address varchar2(30),
	Insurance number(20),
	PRIMARY KEY (SSN)
);
insert into PATIENT values(744360707,'Nicole Castillo',		11271999,'58 Coleman Center',6334714839922510);
insert into PATIENT values(630831394,'Shirley Williams',	09251987,'365 Ramsey Hill',201715800385205);
insert into PATIENT values(789018821,'Kimberly Allen',		12201983,'083 Clyde Gallagher Road',6331109036684400);
insert into PATIENT values(267258764,'Ernest George',		10161989,'9 Hansons Street',63043087992763900);
insert into PATIENT values(165418018,'David Schmidt',		04141996,'0 Michigan Road',501816302138952000);
insert into PATIENT values(408782364,'Sarah Bailey',		04011990,'91965 Harper Park,63',34208632712880000);
insert into PATIENT values(136598671,'Sandra Bailey',		10281984,'8 Hintze Circle',3532736980223900);
insert into PATIENT values(298702129,'Stephanie Ramos',		07281987,'68404 Loftsgordon Circle',676266457363263000);
insert into PATIENT values(218815811,'Patrick Russell',		12191982,'6 Tomscot Court',5602227318487200);
insert into PATIENT values(598783149,'Joe Ellis',			06242000,'5 Algoma Trail',3570744290944860);
insert into PATIENT values(126741084,'Pamela Webb',			06161997,'9 Burning Wood Drive',3567906034054000);
insert into PATIENT values(272554574,'Frances Little',		04191987,'49404 Knutson Center',201516119121566);
insert into PATIENT values(940571016,'Mildred Phillips',	09131996,'3392 Buena Vista Crossing',5100175044006890);
insert into PATIENT values(720188395,'Kathryn Ferguson',	01071990,'66 Forster Hill',3528186133077090);
insert into PATIENT values(662759003,'Christina Franklin',	05261992,'5344 Schurz Way',3549134377679020);
insert into PATIENT values(315304212,'Beverly Weaver',		04251995,'5468 Kipling Road',3586567821335970);
insert into PATIENT values(851937707,'Steven Hicks',		03141987,'158 John Wall Circle',3586054098116450);
insert into PATIENT values(724759546,'Evelyn Brown',		06221985,'01315 Hovde Avenue',3551037424639600);
insert into PATIENT values(315408926,'Marie Chavez',		02101987,'08440 Express Drive',4917644465946420);
insert into PATIENT values(171295181,'Marie Carroll',		08191984,'8191 Tennessee Hill',3540735973853780);
insert into PATIENT values(342286502,'Dennis Scott',		08061989,'49 Sherman Street',4913199771644840);
insert into PATIENT values(446421596,'Christina Cunningham',09071989,'83557 Mendota Pass',5602222318879810);
insert into PATIENT values(649778840,'Jerry Ford',			05181994,'03 Anthes Trail',5535118430894320);
insert into PATIENT values(787462937,'Elizabeth Hill',		08121982,'237 Debs Way',3553942487500390);
insert into PATIENT values(151515012,'Philip Fowler',		04112000,'73210 Darwin Crossing',5184997961206020);
insert into PATIENT values(884179599,'Bonnie Powell',		07301998,'5813 Bultman Alley',3574351912653090);
insert into PATIENT values(247224207,'Karen Peterson',		01151991,'78724 Logan Junction',5100149118997750);
insert into PATIENT values(451573494,'Rose Thompson',		11171992,'71365 Dorton Circle',675918931361420000);
insert into PATIENT values(684470615,'Tammy Fox',			07181994,'88 Menomonie Place',3563553751117160);
insert into PATIENT values(641560138,'Debra Chapman',		01181991,'7 Dakota Place',372301701661516);
insert into PATIENT values(632602974,'Louise Sims',			10131981,'62429 Dexter Hill',3569168836439290);
insert into PATIENT values(187963805,'Willie Powell',		03311994,'5 Fair Oaks Court',5548003916059180);
insert into PATIENT values(983140133,'Michael Alvarez',		06091985,'828 Everett Terrace',6389934954212780);
insert into PATIENT values(519634318,'Arthur Nelson',		09191991,'18 Springview Hill',201901312346451);
insert into PATIENT values(330257957,'Amy Burke',			05281985,'7 Westend Parkway',5010128611260880);
insert into PATIENT values(375305250,'Albert Alexander',	01041982,'9639 Graceland Court',5020326073361550);
insert into PATIENT values(574643499,'Sharon Price',		04221992,'7 Anthes Junction',5194554027183200);
insert into PATIENT values(871379160,'William Gonzales',	09291988,'449 Bay Junction',633413294002568000);
insert into PATIENT values(212548632,'Paula Hansen',		06111989,'0 Lien Hill',4026311810317970);
insert into PATIENT values(263805945,'Amy Murray',			12201986,'973 Swallow Park',6771324770483830000);
insert into PATIENT values(605647149,'Victor Shaw',			04231991,'07454 Monument Trail',4917044267655260);
insert into PATIENT values(149999818,'Joyce Wood',			01191981,'475 Bluestem Street',3558607715491070);
insert into PATIENT values(676466340,'Paul Long',			06061995,'93794 Birchwood Drive',5602254820217800);
insert into PATIENT values(974849401,'Kathryn Little',		04281982,'619 Dryden Point',5118425846485080);
insert into PATIENT values(487940673,'Alan Cooper',			01021996,'051 Sunfield Place',490323306061119000);
insert into PATIENT values(226976552,'Roger Long',			09241984,'85578 Kings Place',3531250940636380);
insert into PATIENT values(127167253,'Benjamin Banks',		09181994,'0 Linden Crossing',5002358363024230);
insert into PATIENT values(837097216,'Diane Morgan',		04241994,'5 Waxwing Center',3544803909904920);
insert into PATIENT values(832272706,'Russell Rodriguez',	01071987,'25 Alpine Pass',374288111594924);
insert into PATIENT values(604227928,'Wanda Roberts',		04111984,'37687 Onsgard Street',3533501646145690);

create table TIMESLOT
(	
	TSlot number(4),
	Sdate number(6),
	Duration number(2),
	PRIMARY KEY (TSlot, Sdate, Duration)
);
insert into TIMESLOT values(0928,150605,60);
insert into TIMESLOT values(0935,150629,60);
insert into TIMESLOT values(1148,150616,60);
insert into TIMESLOT values(0920,150710,60);
insert into TIMESLOT values(1200,150603,60);
insert into TIMESLOT values(1352,150629,60);
insert into TIMESLOT values(1333,150715,60);
insert into TIMESLOT values(1452,150705,60);
insert into TIMESLOT values(1118,150628,60);
insert into TIMESLOT values(1010,150606,60);
insert into TIMESLOT values(1205,150606,60);
insert into TIMESLOT values(1409,150602,60);
insert into TIMESLOT values(1200,150630,60);
insert into TIMESLOT values(1016,150712,60);
insert into TIMESLOT values(1429,150709,60);
insert into TIMESLOT values(1039,141031,40);
insert into TIMESLOT values(1124,150607,40);
insert into TIMESLOT values(1327,150626,40);
insert into TIMESLOT values(1108,150711,40);
insert into TIMESLOT values(1438,150615,40);
insert into TIMESLOT values(1321,150613,40);
insert into TIMESLOT values(0908,150712,40);
insert into TIMESLOT values(1016,150615,40);
insert into TIMESLOT values(1246,150621,40);
insert into TIMESLOT values(1130,150603,40);
insert into TIMESLOT values(1037,150613,40);
insert into TIMESLOT values(1138,150712,40);
insert into TIMESLOT values(1049,150615,40);
insert into TIMESLOT values(1429,150606,40);
insert into TIMESLOT values(1502,150615,40);
insert into TIMESLOT values(1104,150610,40);
insert into TIMESLOT values(1116,150627,40);
insert into TIMESLOT values(1431,150614,40);
insert into TIMESLOT values(1036,150711,40);
insert into TIMESLOT values(1340,150624,40);
insert into TIMESLOT values(1442,150603,20);
insert into TIMESLOT values(1159,150616,20);
insert into TIMESLOT values(1144,150615,20);
insert into TIMESLOT values(1427,150612,20);
insert into TIMESLOT values(1014,150630,20);
insert into TIMESLOT values(1410,150601,20);
insert into TIMESLOT values(1020,150704,20);
insert into TIMESLOT values(1250,150629,20);
insert into TIMESLOT values(1522,150616,20);
insert into TIMESLOT values(1456,150611,20);
insert into TIMESLOT values(1543,150711,20);
insert into TIMESLOT values(1159,150619,20);
insert into TIMESLOT values(1249,150714,20);
insert into TIMESLOT values(1350,150704,20);
insert into TIMESLOT values(0903,150612,20);

create table SCHEDULE
(
	Sdate number(6),
	TSlot number(4),
	Duration number(2),
	SSN number(9),
	Emp number(2),
	PRIMARY KEY(Sdate, TSlot, SSN, Duration),
	FOREIGN KEY(SSN) REFERENCES PATIENT(SSN),
	FOREIGN KEY (Sdate, TSlot, Duration) REFERENCES TIMESLOT(Sdate, TSlot, Duration)
);
insert into SCHEDULE values(150605,0928,60,744360707,1);
insert into SCHEDULE values(150629,0935,60,630831394,2);
insert into SCHEDULE values(150616,1148,60,789018821,3);
insert into SCHEDULE values(150710,0920,60,267258764,4);
insert into SCHEDULE values(150603,1200,60,165418018,5);
insert into SCHEDULE values(150629,1352,60,408782364,6);
insert into SCHEDULE values(150715,1333,60,136598671,7);
insert into SCHEDULE values(150705,1452,60,298702129,8);
insert into SCHEDULE values(150628,1118,60,218815811,9);
insert into SCHEDULE values(150606,1010,60,598783149,10);
insert into SCHEDULE values(150606,1205,60,126741084,11);
insert into SCHEDULE values(150602,1409,60,272554574,13);
insert into SCHEDULE values(150630,1200,60,940571016,14);
insert into SCHEDULE values(150712,1016,60,720188395,14);
insert into SCHEDULE values(150709,1429,60,662759003,15);
insert into SCHEDULE values(141031,1039,40,315304212,16);
insert into SCHEDULE values(150607,1124,40,851937707,17);
insert into SCHEDULE values(150626,1327,40,724759546,18);
insert into SCHEDULE values(150711,1108,40,315408926,19);
insert into SCHEDULE values(150615,1438,40,171295181,17);
insert into SCHEDULE values(150613,1321,40,342286502,18);
insert into SCHEDULE values(150712,0908,40,446421596,19);
insert into SCHEDULE values(150615,1016,40,649778840,1);
insert into SCHEDULE values(150621,1246,40,787462937,2);
insert into SCHEDULE values(150603,1130,40,151515012,3);
insert into SCHEDULE values(150613,1037,40,884179599,4);
insert into SCHEDULE values(150712,1138,40,247224207,5);
insert into SCHEDULE values(150615,1049,40,451573494,6);
insert into SCHEDULE values(150606,1429,40,684470615,7);
insert into SCHEDULE values(150615,1502,40,641560138,8);
insert into SCHEDULE values(150610,1104,40,632602974,9);
insert into SCHEDULE values(150627,1116,40,187963805,10);
insert into SCHEDULE values(150614,1431,40,983140133,11);
insert into SCHEDULE values(150711,1036,40,519634318,12);
insert into SCHEDULE values(150624,1340,40,330257957,13);
insert into SCHEDULE values(150603,1442,20,375305250,14);
insert into SCHEDULE values(150616,1159,20,574643499,15);
insert into SCHEDULE values(150615,1144,20,871379160,16);
insert into SCHEDULE values(150612,1427,20,212548632,17);
insert into SCHEDULE values(150630,1014,20,263805945,18);
insert into SCHEDULE values(150601,1410,20,605647149,19);
insert into SCHEDULE values(150704,1020,20,149999818,17);
insert into SCHEDULE values(150629,1250,20,676466340,18);
insert into SCHEDULE values(150616,1522,20,974849401,19);
insert into SCHEDULE values(150611,1456,20,487940673,1);
insert into SCHEDULE values(150711,1543,20,226976552,7);
insert into SCHEDULE values(150619,1159,20,127167253,8);
insert into SCHEDULE values(150714,1249,20,837097216,9);
insert into SCHEDULE values(150704,1350,20,832272706,10);
insert into SCHEDULE values(150612,0903,20,604227928,11);

create table VISIT   
(
	SSN number(9),
	Vdate number(6),
	Emp number(2),
	Ipaid number(3),
	Ppaid number(3),
	PRIMARY Key (SSN, VDATE),
	FOREIGN KEY(SSN) REFERENCES PATIENT(SSN)
);

insert into VISIT values(744360707,140925,1,252,92);
insert into VISIT values(630831394,140919,2,268,11);
insert into VISIT values(789018821,140930,5,390,39);
insert into VISIT values(267258764,150422,6,130,97);
insert into VISIT values(165418018,141228,6,155,72);
insert into VISIT values(408782364,140719,6,195,39);
insert into VISIT values(136598671,150115,7,109,30);
insert into VISIT values(298702129,150526,3,29,10);
insert into VISIT values(218815811,150405,4,83,35);
insert into VISIT values(598783149,150306,10,73,67);
insert into VISIT values(126741084,141026,7,351,42);
insert into VISIT values(272554574,150508,5,364,65);
insert into VISIT values(940571016,141110,5,368,60);
insert into VISIT values(720188395,150429,7,149,85);
insert into VISIT values(662759003,140111,5,336,92);
insert into VISIT values(315304212,150702,10,49,90);
insert into VISIT values(851937707,150115,6,164,71);
insert into VISIT values(724759546,150225,7,114,26);
insert into VISIT values(315408926,150505,18,190,37);
insert into VISIT values(171295181,141126,5,381,48);
insert into VISIT values(342286502,140716,7,188,62);
insert into VISIT values(446421596,150603,14,143,84);
insert into VISIT values(649778840,150115,11,346,47);
insert into VISIT values(787462937,150419,5,383,45);
insert into VISIT values(151515012,150713,7,382,92);
insert into VISIT values(884179599,150629,6,194,40);
insert into VISIT values(247224207,150221,7,149,244);
insert into VISIT values(451573494,141014,5,153,96);
insert into VISIT values(684470615,150713,7,159,90);
insert into VISIT values(641560138,150113,5,123,29);
insert into VISIT values(632602974,150501,11,255,138);
insert into VISIT values(187963805,150628,15,10,29);
insert into VISIT values(983140133,140807,4,74,44);
insert into VISIT values(519634318,141219,2,222,57);
insert into VISIT values(330257957,150202,5,172,56);
insert into VISIT values(375305250,150302,2,161,118);
insert into VISIT values(574643499,140807,7,11,28);
insert into VISIT values(871379160,150704,5,302,126);
insert into VISIT values(212548632,150710,6,102,132);
insert into VISIT values(263805945,141122,10,110,29);
insert into VISIT values(605647149,150301,11,249,144);
insert into VISIT values(149999818,140923,10,98,41);
insert into VISIT values(676466340,140818,11,209,184);
insert into VISIT values(974849401,140812,7,143,250);
insert into VISIT values(487940673,140720,6,170,64);
insert into VISIT values(226976552,150505,4,125,124);
insert into VISIT values(127167253,141122,10,191,58);
insert into VISIT values(837097216,150321,12,54,174);
insert into VISIT values(832272706,150624,10,161,66);
insert into VISIT values(604227928,150105,1,209,135);

create table VDIAGNOSES
(
	Vdate number(6),
	SSN number(9),
	Dcode number(3),
	Scode number(3),
	PRIMARY KEY(Vdate, SSN, Dcode, Scode),
	FOREIGN KEY(SSN) REFERENCES PATIENT(SSN),
	FOREIGN KEY(VDATE, SSN) REFERENCES VISIT(VDATE, SSN),
	FOREIGN KEY(Scode, Dcode) REFERENCES DIAGNOSE(Scode, Dcode)
);
insert into VDIAGNOSES values(140925,744360707,100,300);
insert into VDIAGNOSES values(140919,630831394,101,301);
insert into VDIAGNOSES values(140930,789018821,104,304);
insert into VDIAGNOSES values(150422,267258764,105,305);
insert into VDIAGNOSES values(141228,165418018,105,305);
insert into VDIAGNOSES values(140719,408782364,105,305);
insert into VDIAGNOSES values(150115,136598671,106,306);
insert into VDIAGNOSES values(150526,298702129,102,302);
insert into VDIAGNOSES values(150405,218815811,103,303);
insert into VDIAGNOSES values(150306,598783149,105,306);
insert into VDIAGNOSES values(141026,126741084,107,307);
insert into VDIAGNOSES values(150508,272554574,104,304);
insert into VDIAGNOSES values(141110,940571016,104,304);
insert into VDIAGNOSES values(150429,720188395,105,305);
insert into VDIAGNOSES values(140111,662759003,104,304);
insert into VDIAGNOSES values(150702,315304212,105,306);
insert into VDIAGNOSES values(150115,851937707,106,305);
insert into VDIAGNOSES values(150225,724759546,106,306);
insert into VDIAGNOSES values(150505,315408926,106,305);
insert into VDIAGNOSES values(141126,171295181,104,304);
insert into VDIAGNOSES values(140716,342286502,100,300);
insert into VDIAGNOSES values(150603,446421596,101,301);
insert into VDIAGNOSES values(150115,649778840,107,307);
insert into VDIAGNOSES values(150419,787462937,104,304);
insert into VDIAGNOSES values(150713,151515012,107,307);
insert into VDIAGNOSES values(150629,884179599,106,305);
insert into VDIAGNOSES values(150221,247224207,107,307);
insert into VDIAGNOSES values(141014,451573494,104,304);
insert into VDIAGNOSES values(150713,684470615,101,301);
insert into VDIAGNOSES values(150113,641560138,104,304);
insert into VDIAGNOSES values(150501,632602974,107,307);
insert into VDIAGNOSES values(150628,187963805,102,302);
insert into VDIAGNOSES values(140807,983140133,103,303);
insert into VDIAGNOSES values(141219,519634318,101,301);
insert into VDIAGNOSES values(150202,330257957,104,304);
insert into VDIAGNOSES values(150302,375305250,101,301);
insert into VDIAGNOSES values(140807,574643499,102,302);
insert into VDIAGNOSES values(150704,871379160,104,304);
insert into VDIAGNOSES values(150710,212548632,106,305);
insert into VDIAGNOSES values(141122,263805945,105,306);
insert into VDIAGNOSES values(150301,605647149,107,307);
insert into VDIAGNOSES values(140923,149999818,105,306);
insert into VDIAGNOSES values(140818,676466340,107,307);
insert into VDIAGNOSES values(140812,974849401,107,307);
insert into VDIAGNOSES values(140720,487940673,106,305);
insert into VDIAGNOSES values(150505,226976552,103,303);
insert into VDIAGNOSES values(141122,127167253,105,306);
insert into VDIAGNOSES values(150321,837097216,103,303);
insert into VDIAGNOSES values(150624,832272706,105,306);
insert into VDIAGNOSES values(150105,604227928,100,300);
