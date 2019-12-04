-- Lab 4: JOIN and WHERE
-- djones27
-- Nov 1, 2019

USE `STUDENTS`;
-- STUDENTS-1
-- Find all students who study in classroom 111. For each student list first and last name. Sort the output by the last name of the student.
select FirstName, LastName from list
where classroom=111
order by LastName ASC;


USE `STUDENTS`;
-- STUDENTS-2
-- For each classroom report the grade that is taught in it. Report just the classroom number and the grade number. Sort output by classroom in descending order.
select distinct classroom, grade from list
order by classroom desc;


USE `STUDENTS`;
-- STUDENTS-3
-- Find all teachers who teach fifth grade. Report first and last name of the teachers and the room number. Sort the output by room number.
select distinct teachers.First, teachers.Last, teachers.classroom
from teachers
inner join list 
on (teachers.classroom=list.classroom) and list.grade=5;


USE `STUDENTS`;
-- STUDENTS-4
-- Find all students taught by OTHA MOYER. Output first and last names of students sorted in alphabetical order by their last name.
select list.FirstName, list.LastName
from list inner join teachers
on (teachers.classroom=list.classroom) 
and (teachers.First='OTHA') and (teachers.Last="MOYER")
order by list.Lastname asc;


USE `STUDENTS`;
-- STUDENTS-5
-- For each teacher teaching grades K through 3, report the grade (s)he teaches. Each name has to be reported exactly once. Sort the output by grade and alphabetically by teacher’s last name for each grade.
select distinct teachers.First, teachers.Last, list.grade 
from teachers join list
on (teachers.classroom=list.classroom) and list.grade<4
order by list.grade, teachers.last asc;


USE `BAKERY`;
-- BAKERY-1
-- Find all chocolate-flavored items on the menu whose price is under $5.00. For each item output the flavor, the name (food type) of the item, and the price. Sort your output in descending order by price.
select Flavor, Food, PRICE from goods
where (PRICE < 5.00) and (Flavor='Chocolate')
order by PRICE desc;


USE `BAKERY`;
-- BAKERY-2
-- Report the prices of the following items (a) any cookie priced above $1.10, (b) any lemon-flavored items, or (c) any apple-flavored item except for the pie. Output the flavor, the name (food type) and the price of each pastry. Sort the output in alphabetical order by the flavor and then pastry name.
select Flavor, Food, PRICE from goods
where (Food = 'Cookie' and PRICE > 1.10) or 
    (Flavor = 'Lemon') or 
    (Flavor = 'Apple' and Food != 'Pie')
order by Flavor, Food asc;


USE `BAKERY`;
-- BAKERY-3
-- Find all customers who made a purchase on October 3, 2007. Report the name of the customer (last, first). Sort the output in alphabetical order by the customer’s last name. Each customer name must appear at most once.
select distinct customers.LastName, customers.FirstName 
from receipts 
inner join customers on (customers.CId = receipts.Customer) and (receipts.SaleDate = 20071003)
order by customers.LastName asc;


USE `BAKERY`;
-- BAKERY-4
-- Find all different cakes purchased on October 4, 2007. Each cake (flavor, food) is to be listed once. Sort output in alphabetical order by the cake flavor.
select distinct goods.flavor, goods.food 
from goods
join items on goods.GId = items.Item
and goods.Food = 'Cake'
join receipts on items.Receipt = receipts.Rnumber
and receipts.SaleDate = '20071004';


USE `BAKERY`;
-- BAKERY-5
-- List all pastries purchased by ARIANE CRUZEN on October 25, 2007. For each pastry, specify its flavor and type, as well as the price. Output the pastries in the order in which they appear on the receipt (each pastry needs to appear the number of times it was purchased).
select goods.flavor, goods.food, goods.PRICE
from goods
join items on items.Item = goods.GId
join receipts on items.Receipt = receipts.RNumber
and receipts.SaleDate = '20071025'
join customers on receipts.Customer = customers.CId 
and customers.FirstName = 'ARIANE' 
and customers.LastName = 'CRUZEN'
order by receipts.RNumber asc;


USE `BAKERY`;
-- BAKERY-6
-- Find all types of cookies purchased by KIP ARNN during the month of October of 2007. Report each cookie type (flavor, food type) exactly once in alphabetical order by flavor.

select distinct goods.Flavor, goods.Food 
from goods
join items on items.Item = goods.GId
and goods.Food = 'Cookie'
join receipts on items.Receipt = receipts.RNumber
and receipts.SaleDate < '20071100'
and receipts.SaleDate > '20070930'
join customers on receipts.Customer = customers.CId 
and customers.FirstName = 'KIP' 
and customers.LastName = 'ARNN'
order by goods.Flavor asc;


USE `CSU`;
-- CSU-1
-- Report all campuses from Los Angeles county. Output the full name of campus in alphabetical order.
select Campus from campuses
where County = 'Los Angeles'
order by Campus asc;


USE `CSU`;
-- CSU-2
-- For each year between 1994 and 2000 (inclusive) report the number of students who graduated from California Maritime Academy Output the year and the number of degrees granted. Sort output by year.
select distinct degrees.year, degrees.degrees
from degrees 
inner join campuses
on degrees.CampusId = campuses.Id 
    and degrees.year >= 1994
    and degrees.year <= 2000
    and campuses.Campus = 'California Maritime Academy'
order by degrees.year asc;


USE `CSU`;
-- CSU-3
-- Report undergraduate and graduate enrollments (as two numbers) in ’Mathematics’, ’Engineering’ and ’Computer and Info. Sciences’ disciplines for both Polytechnic universities of the CSU system in 2004. Output the name of the campus, the discipline and the number of graduate and the number of undergraduate students enrolled. Sort output by campus name, and by discipline for each campus.
select campuses.Campus, disciplines.Name, discEnr.GR, discEnr.Ug
from discEnr
join disciplines on disciplines.Id = discEnr.Discipline 
    and discEnr.Year = 2004
    and (disciplines.Name = 'Mathematics'
        or disciplines.Name = 'Engineering'
        or disciplines.Name = 'Computer and Info. Sciences')
join campuses on campuses.Id = discEnr.CampusId
    and (campuses.Campus = 'California State Polytechnic University-Pomona' 
    or campuses.Campus = 'California Polytechnic State University-San Luis Obispo')
    order by campuses.Campus asc;


USE `CSU`;
-- CSU-4
-- Report graduate enrollments in 2004 in ’Agriculture’ and ’Biological Sciences’ for any university that offers graduate studies in both disciplines. Report one line per university (with the two grad. enrollment numbers in separate columns), sort universities in descending order by the number of ’Agriculture’ graduate students.
select distinct campuses.Campus, discEnr.Gr
from campuses
join discEnr 
on campuses.Id = discEnr.CampusId
join disciplines
on disciplines.Id = discEnr.Discipline
and disciplines.Name = 'Agriculture'
and discEnr.Gr > 0
join discEnr as d2
on discEnr.Id <> d2.CampusId
and disciplines.Id = d2.Discipline
and disciplines.Name = 'Biological Sciences'
order by discEnr.Gr; 
/*
join disciplines as d2
on d2.Id = discEnr.Discipline
and d2.Name = 'Biological Sciences'
and discEnr.Gr > 0; */;


USE `CSU`;
-- CSU-5
-- Find all disciplines and campuses where graduate enrollment in 2004 was at least three times higher than undergraduate enrollment. Report campus names and discipline names. Sort output by campus name, then by discipline name in alphabetical order.
select campuses.Campus, disciplines.Name, discEnr.Ug, discEnr.Gr
from discEnr
join campuses 
on campuses.Id = discEnr.CampusId
and (discEnr.Ug * 3) < discEnr.Gr
join disciplines
on discEnr.Discipline = disciplines.Id
order by campuses.Campus, disciplines.Name;


USE `CSU`;
-- CSU-6
-- Report the total amount of money collected from student fees (use the full-time equivalent enrollment for computations) at ’Fresno State University’ for each year between 2002 and 2004 inclusively, and the amount of money (rounded to the nearest penny) collected from student fees per each full-time equivalent faculty. Output the year, the two computed numbers sorted chronologically by year.
select * from campuses;


USE `CSU`;
-- CSU-7
-- Find all campuses where enrollment in 2003 (use the FTE numbers), was higher than the 2003 enrollment in ’San Jose State University’. Report the name of campus, the 2003 enrollment number, the number of faculty teaching that year, and the student-to-faculty ratio, rounded to one decimal place. Sort output in ascending order by student-to-faculty ratio.
-- No attempt


USE `INN`;
-- INN-1
-- Find all modern rooms with a base price below $160 and two beds. Report room names and codes in alphabetical order by the code.
select RoomCode, roomname from rooms
where basePrice < 160 and Beds = 2 and decor = 'modern'
order by RoomCode desc;


USE `INN`;
-- INN-2
-- Find all July 2010 reservations (a.k.a., all reservations that both start AND end during July 2010) for the ’Convoke and sanguine’ room. For each reservation report the last name of the person who reserved it, checkin and checkout dates, the total number of people staying and the daily rate. Output reservations in chronological order.
select reservations.LastName, reservations.CheckIn, reservations.CheckOut, (reservations.Adults + reservations.Kids), reservations.Rate
from reservations
join rooms on 
    (reservations.CheckIn >= 20100701 and reservations.CheckIn < 20100801) 
    and rooms.RoomName = 'Convoke and sanguine'
    and reservations.Room = rooms.RoomCode
order by reservations.Checkin asc;


USE `INN`;
-- INN-3
-- Find all rooms occupied on February 6, 2010. Report full name of the room, the check-in and checkout dates of the reservation. Sort output in alphabetical order by room name.
select rooms.RoomName, reservations.CheckIn, reservations.CheckOut
from rooms
join reservations
on reservations.Room = rooms.RoomCode
and reservations.CheckIn <= 20100206
and reservations.CheckOut > 20100206
order by rooms.RoomName asc;


USE `INN`;
-- INN-4
-- For each stay by GRANT KNERIEN in the hotel, calculate the total amount of money, he paid. Report reservation code, checkin and checkout dates, room name (full) and the total stay cost. Sort output in chronological order by the day of arrival.

select reservations.Code, 
        rooms.RoomName,
        reservations.CheckIn, 
        reservations.CheckOut,  
        DATEDIFF(reservations.CheckOut, reservations.CheckIn)*reservations.Rate as Paid
from reservations
join rooms on reservations.Room = rooms.RoomCode
    and reservations.FirstName = 'GRANT'
    and reservations.LastName = 'KNERIEN'
order by reservations.CheckIn asc;


USE `INN`;
-- INN-5
-- For each reservation that starts on December 31, 2010 report the room name, nightly rate, number of nights spent and the total amount of money paid. Sort output in descending order by the number of nights stayed.
select rooms.RoomName, 
        reservations.Rate, 
        DATEDIFF(reservations.CheckOut, reservations.CheckIn) as Nights,
        reservations.Rate * DATEDIFF(reservations.CheckOut, reservations.CheckIn) as Money
from reservations
join rooms 
on reservations.CheckIn = '20101231'
    and reservations.Room = rooms.RoomCode
order by (reservations.CheckOut - reservations.CheckIn) desc;


USE `INN`;
-- INN-6
-- Report all reservations in rooms with double beds that contained four adults. For each reservation report its code, the full name and the code of the room, check-in and check out dates. Report reservations in chronological order, then sorted by the three-letter room code (in alphabetical order) for any reservations that began on the same day.
select  reservations.CODE, reservations.Room, rooms.RoomName, reservations.CheckIn, reservations.CheckOut
from reservations
join rooms 
on reservations.Room = rooms.RoomCode
and rooms.bedType = 'Double'
and reservations.Adults = 4
order by reservations.CheckIn, reservations.Room;


USE `MARATHON`;
-- MARATHON-1
-- Report the time, pace and the overall place of TEDDY BRASEL.
select Place, RunTime, Pace from marathon
where FirstName = 'Teddy'
and LastName = 'BRASEL';


USE `MARATHON`;
-- MARATHON-2
-- Report names (first, last), times, overall places as well as places in their gender-age group for all female runners from QUNICY, MA. Sort output by overall place in the race.
select FirstName, LastName, Place, RunTime, GroupPlace from marathon
where Town = "QUNICY" and State = 'MA' and Sex = 'F'
order by Place asc;


USE `MARATHON`;
-- MARATHON-3
-- Find the results for all 34-year old female runners from Connecticut (CT). For each runner, output name (first, last), town and the running time. Sort by time.
select FirstName, LastName, Town, RunTime from marathon
where Age = 34 and Sex = 'F' and State = 'CT'
order by RunTime;


USE `MARATHON`;
-- MARATHON-4
-- Find all duplicate bibs in the race. Report just the bib numbers. Sort in ascending order of the bib number. Each duplicate bib number must be reported exactly once.
select marathon.BibNumber from marathon
join (marathon as m2) on marathon.BibNumber = m2.BibNumber 
and marathon.FirstName > m2.FirstName
order by marathon.BibNumber;


USE `MARATHON`;
-- MARATHON-5
-- List all runners who took first place and second place in their respective age/gender groups. For age group, output name (first, last) and age for both the winner and the runner up (in a single row). Order the output by gender, then by age group.
select marathon.Sex, 
        marathon.AgeGroup,
        marathon.FirstName,
        marathon.LastName,
        marathon.Age,
        m1.FirstName,
        m1.LastName,
        m1.Age
from marathon
inner join (marathon as m1) 
on marathon.AgeGroup = m1.AgeGroup
    and marathon.GroupPlace = 1
    and m1.GroupPlace = 2
    and m1.Sex = marathon.Sex
order by marathon.Sex, marathon.AgeGroup;


USE `AIRLINES`;
-- AIRLINES-1
-- Find all airlines that have at least one flight out of AXX airport. Report the full name and the abbreviation of each airline. Report each name only once. Sort the airlines in alphabetical order.
select distinct airlines.Name, airlines.Abbr from airlines
join flights on airlines.Id = flights.Airline
and flights.Source = 'AXX'
order by airlines.Name asc;


USE `AIRLINES`;
-- AIRLINES-2
-- Find all destinations served from the AXX airport by Northwest. Re- port flight number, airport code and the full name of the airport. Sort in ascending order by flight number.

select distinct flights.FlightNo, flights.Destination, airports.Name from flights
join airports on (airports.Code = flights.Destination) and flights.Source = 'AXX'
join airlines on flights.Airline = airlines.Id and airlines.Name = 'Northwest Airlines'
order by flights.FlightNo asc;


USE `AIRLINES`;
-- AIRLINES-3
-- Find all *other* destinations that are accessible from AXX on only Northwest flights with exactly one change-over. Report pairs of flight numbers, airport codes for the final destinations, and full names of the airports sorted in alphabetical order by the airport code.
select flights.FlightNo, 
        f1.FlightNo, 
        f1.Destination,
        airports.Name
from flights
join (flights as f1)
on f1.Airline = flights.Airline
    and f1.FlightNo <> flights.FlightNo
    and flights.Source = 'AXX'
    and f1.Source <> 'AXX'
join airlines 
    on f1.Airline = airlines.Id
    and flights.Airline = airlines.Id
    and airlines.Name = 'Northwest Airlines'
join airports
    on f1.Destination = airports.Code
    and airlines.Country = airports.Country
order by airports.Code asc;
    
 /*   
select distinct flights.FlightNo, flights.Destination, airports.Name from flights
join airports on (airports.Code = flights.Destination) 
    and flights.Source = 'AXX'
join airlines on flights.Airline = airlines.Id and airlines.Name = 'Northwest Airlines'
order by flights.FlightNo asc;
*/;


USE `AIRLINES`;
-- AIRLINES-4
-- Report all pairs of airports served by both Frontier and JetBlue. Each airport pair must be reported exactly once (if a pair X,Y is reported, then a pair Y,X is redundant and should not be reported).
select distinct airports.Code, a1.Code
from airports
join (airports as a1)
    on a1.Code <> airports.Code
    and a1.Code > airports.Code
inner join airlines
    on airlines.Name = 'JetBlue Airways';


USE `AIRLINES`;
-- AIRLINES-5
-- Find all airports served by ALL five of the airlines listed below: Delta, Frontier, USAir, UAL and Southwest. Report just the airport codes, sorted in alphabetical order.
select * from airlines;


USE `AIRLINES`;
-- AIRLINES-6
-- Find all airports that are served by at least three Southwest flights. Report just the three-letter codes of the airports — each code exactly once, in alphabetical order.
-- No attempt


USE `KATZENJAMMER`;
-- KATZENJAMMER-1
-- Report, in order, the tracklist for ’Le Pop’. Output just the names of the songs in the order in which they occur on the album.
select Songs.Title
from Songs
join Tracklists
on Songs.SongID = Tracklists.Song
join Albums
on Albums.AId = Tracklists.Album
    and Albums.Title = 'Le Pop'
order by Tracklists.Position; /*
on Songs.SongId = Tracklists.Song
    and Tracklists.Album = 'Le Pop'; */;


USE `KATZENJAMMER`;
-- KATZENJAMMER-2
-- List the instruments each performer plays on ’Mother Superior’. Output the first name of each performer and the instrument, sort alphabetically by the first name.
select Band.Firsname, Instruments.Instrument 
from Instruments
join Songs 
on Songs.SongId = Instruments.Song
and Songs.Title = 'Mother Superior'
join Band
on Instruments.Bandmate = Band.Id
order by Band.Firsname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-3
-- List all instruments played by Anne-Marit at least once during the performances. Report the instruments in alphabetical order (each instrument needs to be reported exactly once).
select distinct Instruments.Instrument from
Instruments
join Band 
on Band.Id = Instruments.Bandmate 
    and Band.Firsname = 'Anne-Marit'
join Performance 
on Performance.Bandmate = Instruments.Bandmate
    and Performance.Bandmate
order by Instruments.Instrument asc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-4
-- Find all songs that featured ukalele playing (by any of the performers). Report song titles in alphabetical order.
select Songs.Title from Songs
join Instruments
on SongId = Instruments.Song
and Instruments.Instrument = 'ukalele'
order by Songs.Title asc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-5
-- Find all instruments Turid ever played on the songs where she sang lead vocals. Report the names of instruments in alphabetical order (each instrument needs to be reported exactly once).
select distinct Instruments.Instrument from Instruments
join Vocals
on Vocals.Bandmate = Instruments.Bandmate
and Vocals.VocalType = 'lead'
and Instruments.Song = Vocals.Song
join Band
on Band.Id = Instruments.Bandmate
and Band.Id = Vocals.Bandmate
and Band.Firsname = 'Turid'
order by Instruments.Instrument asc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-6
-- Find all songs where the lead vocalist is not positioned center stage. For each song, report the name, the name of the lead vocalist (first name) and her position on the stage. Output results in alphabetical order by the song. (Note: if a song had more than one lead vocalist, you may see multiple rows returned for that song. This is the expected behavior).
select distinct Songs.Title, Band.Firsname, Performance.StagePosition
from Performance
join Songs
on Performance.Song = Songs.SongId
and Performance.StagePosition <> 'center'
join Vocals
on Performance.Bandmate = Vocals.Bandmate
and Vocals.VocalType = 'lead'
and Vocals.Song = Songs.SongId
join Band
on Band.Id = Performance.Bandmate
order by Songs.Title;


USE `KATZENJAMMER`;
-- KATZENJAMMER-7
-- Find a song on which Anne-Marit played three different instruments. Report the name of the song. (The name of the song shall be reported exactly once)
select distinct Songs.Title from Songs
join Instruments
on Instruments.Song = Songs.SongId
join Band 
on Band.Id = Instruments.Bandmate
 and Band.Firsname = 'Anne-Marit'
join (Instruments as I)
on I.Song = Songs.SongId
    and I.Bandmate = Band.Id
    and I.Instrument <> Instruments.Instrument
join (Instruments as I2)
on I2.Song = Songs.SongId
    and I2.Bandmate = Band.Id
    and I2.Instrument <> Instruments.Instrument;;


USE `KATZENJAMMER`;
-- KATZENJAMMER-8
-- Report the positioning of the band during ’A Bar In Amsterdam’. (just one record needs to be returned with four columns (right, center, back, left) containing the first names of the performers who were staged at the specific positions during the song).
select Band.Firsname
from Band
join Performance
on Band.Id = Performance.Bandmate
join Songs
on Songs.SongId = Performance.Song
    and Songs.Title = 'A Bar In Amsterdam';
join (Band as B1)
on Performance.Bandmate = B1.Id 
and Performance.StagePosition = 'right';


