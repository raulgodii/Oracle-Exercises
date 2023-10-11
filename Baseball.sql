SHOW USER;

DROP TABLE players;
CREATE TABLE players(
player_id number PRIMARY KEY,
first_name varchar2(40),
last_name varchar2(40)
);

DROP TABLE stats;
CREATE TABLE stats(
player_id number,
year number,
ab number,
hits number,
hr number,
rbi number,
team varchar2(40),
PRIMARY KEY (player_id, year),
foreign key (player_id) references players(player_id)
);

INSERT INTO PLAYERS VALUES(1, 'Barry', 'Bonds');
INSERT INTO PLAYERS VALUES(2, 'Hank', 'Aaron');
INSERT INTO PLAYERS VALUES(3, 'Babe', 'Ruth');
INSERT INTO PLAYERS VALUES(4, 'Willie', 'Mays');
INSERT INTO PLAYERS VALUES(5, 'Sammy', 'Sosa');

INSERT INTO STATS VALUES(1, 2006, 367, 99, 26, 77, 'SFG');
INSERT INTO STATS VALUES(1, 2007, 340, 94, 28, 66, 'SFG');
INSERT INTO STATS VALUES(2, 1954, 468, 131, 13, 69, 'MLN');
INSERT INTO STATS VALUES(2, 1955, 602, 189, 27, 106, 'MLN');
INSERT INTO STATS VALUES(2, 1956, 609, 200, 26, 92, 'MLN');

SELECT * FROM PLAYERS;
SELECT * FROM STATS;

-- 1.- First, let's look at a query that simply lists data from three selected columns in the STATS table
SELECT player_id, year, ab FROM STATS;

-- 2.- Lists only those seasons in which the player had more than 50 home runs
INSERT INTO STATS VALUES(2, 1957, 644, 253, 67, 34, 'MLN');
INSERT INTO STATS VALUES(2, 1958, 544, 456, 69, 223, 'MLN');
INSERT INTO STATS VALUES(2, 1959, 339, 567, 51, 132, 'MLN');
SELECT year FROM stats WHERE hr>50;

-- 3.- Sort the query number 2 from high to low. To do that, we need to add an ORDER BY clause
SELECT year FROM stats WHERE hr>50 ORDER BY year desc;

-- 4.- The names from the PLAYERS table and the year and HR count from the STATS table for the 50+ HR subset.
SELECT players.first_name, players.last_name, stats.year, count(stats.hr) FROM players, stats WHERE players.player_id = stats.player_id and stats.hr>50 GROUP BY players.first_name, players.last_name, stats.year;

-- 5.- Player's career home run total.
SELECT players.first_name, players.last_name, sum(stats.hr) FROM players, stats WHERE players.player_id = stats.player_id GROUP BY players.first_name, players.last_name;