create database genius_league;

use genius_league;

create table users(
    userid varchar(20) NOT NULL PRIMARY KEY,
    name varchar(20) NOT NULL,
    password varchar(20) NOT NULL,
    score int
    );

create table quiz(
	question varchar(100) primary key,
    option1 varchar(30) not null,
    option2 varchar(30) not null,
    option3 varchar(30) not null,
    option4 varchar(30) not null,
    answer varchar(30) not null
    ); 
    					
insert into quiz values("What is the name of the fifth planet?","Pluto", "Mercury","Jupiter", "Saturn", "Jupiter");
insert into quiz values("What is the boiling point of water?","10 deg C", "100 deg C","1000 deg C", "-15 deg C", "100 deg C");
insert into quiz values("Which is the most abundant element in the Universe?","Hydrogen", "Diamond","Gold", "Iron", "Hydrogen");
insert into quiz values("What is 9 x 9 =   ?", "18", "36", "72", "81", "81");
insert into quiz values("Choose which is a continent?", "Finland", "Japan", "Australia", "Brazil", "Australia");
insert into quiz values("What travels fast among the options given below?", "Light", "Sound", "Electricity", "ME! when food is ready! :p", "Light");
insert into quiz values("Which is the lightest known gas?", "Xenon", "Hydrogen", "Oxygen", "Krypton", "Hydrogen");
insert into quiz values("Why helium is used in balloons instead of hydrogen?(both floats upwards though)", "Because helium balloon goes super high", 
				"Because hydrogen is hard to capture", "Because hydrogen is highly flammable", "Because helium is colorless and odorless",
				"Because hydrogen is highly flammable");
insert into quiz values("Which is the best conductor of electricity?", "Silver", "Gold", "Copper", "Iron", "Silver");
insert into quiz values("What is the best way to prevent electric shock among the options given below?", "Wear shades", "Always have louis vuitton bag", "Wear leather shoes",
					"Wear a cap", "Wear leather shoes");