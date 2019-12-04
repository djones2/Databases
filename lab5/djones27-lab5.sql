-- Lab 5
-- djones27
-- Nov 12, 2019

USE `STUDENTS`;
-- STUDENTS-1
-- Report the names of teachers who have between seven and eight (inclusive) students in their classrooms. Sort output in alphabetical order by the teacher's last name.
select last, first
from teachers
inner join list on teachers.classroom = list.classroom 
group by Last, First
having count(*) >= 7 and count(*) <= 8
order by Last, First;


USE `STUDENTS`;
-- STUDENTS-2
-- For each grade, report the number of classrooms in which it is taught and the total number of students in the grade. Sort the output by the number of classrooms in descending order, then by grade in ascending order.

select grade, 
    count(distinct teachers.classroom) as classrooms, count(list.LastName)
from list 
join teachers on teachers.classroom = list.classroom
group by grade
order by classrooms desc, grade;


USE `STUDENTS`;
-- STUDENTS-3
-- For each Kindergarten (grade 0) classroom, report the total number of students. Sort output in the descending order by the number of students.
select list.classroom, count(LastName) as students
from list
join teachers on teachers.classroom = list.classroom
where grade = 0
group by list.classroom
order by students desc;


USE `STUDENTS`;
-- STUDENTS-4
-- For each fourth grade classroom, report the student (last name) who is the last (alphabetically) on the class roster. Sort output by classroom.
select distinct list.classroom, max(LastName) over w as hello
from list
inner join teachers
on list.classroom = teachers.classroom
where grade = 4
window w as (partition by list.classroom);


USE `BAKERY`;
-- BAKERY-1
-- For each flavor which is found in more than three types of items offered at the bakery, report the average price (rounded to the nearest penny) of an item of this flavor and the total number of different items of this flavor on the menu. Sort the output in ascending order by the average price.
select Flavor, round(avg(PRICE), 2), count(*)
from goods
group by Flavor
having count(*) > 3
order by Flavor;


USE `BAKERY`;
-- BAKERY-2
-- Find the total amount of money the bakery earned in October 2007 from selling eclairs. Report just the amount.
select sum(goods.PRICE)
from receipts
join items 
    on items.Receipt = receipts.RNumber
join goods
    on items.Item = goods.GId
where SaleDate between '2007-10-01' and '2007-10-31'
    and goods.Food = 'Eclair';


USE `BAKERY`;
-- BAKERY-3
-- For each visit by NATACHA STENZ output the receipt number, date of purchase, total number of items purchased and amount paid, rounded to the nearest penny. Sort by the amount paid, most to least.
select RNumber, SaleDate, count(Item), round(sum(goods.PRICE), 2) as amount
from customers
inner join receipts
    on receipts.Customer = customers.CId
inner join items
    on items.Receipt = receipts.RNumber
inner join goods
    on goods.GId = items.Item
where FirstName = 'NATACHA' 
    and LastName = 'STENZ'
group by RNumber
order by amount desc;


USE `BAKERY`;
-- BAKERY-4
-- For each day of the week of October 8 (Monday through Sunday) report the total number of purchases (receipts), the total number of pastries purchased and the overall daily revenue. Report results in chronological order and include both the day of the week and the date.
select DAYNAME(SaleDate) as day, 
        SaleDate,
        count(distinct RNumber) as rnum,
        count(Item),
        round(sum(goods.PRICE), 2) as amount
from receipts
join items
    on items.Receipt = receipts.RNumber
inner join goods
    on goods.GId = items.Item
where SaleDate between '2007-10-08' and '2007-10-14'
group by SaleDate
order by SaleDate;


USE `BAKERY`;
-- BAKERY-5
-- Report all days on which more than ten tarts were purchased, sorted in chronological order.
select SaleDate
from goods
join items
    on items.Item = goods.GId
join receipts
    on items.Receipt = receipts.RNumber
where Food = 'Tart'
group by SaleDate
having count(Item) > 10
order by SaleDate;


USE `CSU`;
-- CSU-1
-- For each campus that averaged more than $2,500 in fees between the years 2000 and 2005 (inclusive), report the total cost of fees for this six year period. Sort in ascending order by fee.
select Campus,
        sum(fee) as t
from fees
join campuses
    on fees.CampusId = campuses.Id
where fees.Year >= 2000
    and fees.Year <= 2005
group by CampusId
having (sum(fee) / count(fee)) > 2500
order by t;


USE `CSU`;
-- CSU-2
-- For each campus for which data exists for more than 60 years, report the average, the maximum and the minimum enrollment (for all years). Sort your output by average enrollment.
select distinct Campus,
        min(Enrolled) as min,
        avg(Enrolled) as avg,
        max(Enrolled) as max
from campuses
join enrollments
    on enrollments.CampusId = campuses.Id
group by Campus
having (max(enrollments.Year) - min(enrollments.Year)) > 60
order by avg;


USE `CSU`;
-- CSU-3
-- For each campus in LA and Orange counties report the total number of degrees granted between 1998 and 2002 (inclusive). Sort the output in descending order by the number of degrees.

select campuses.Campus, sum(degrees.Degrees) as deg
from campuses
join degrees
    on degrees.CampusId = campuses.Id
where (campuses.County = 'Los Angeles'
    or campuses.County = 'Orange')
    and (degrees.Year >= 1998 
    and degrees.Year <= 2002)
group by campuses.Campus
order by deg desc;


USE `CSU`;
-- CSU-4
-- For each campus that had more than 20,000 enrolled students in 2004, report the number of disciplines for which the campus had non-zero graduate enrollment. Sort the output in alphabetical order by the name of the campus. (Exclude campuses that had no graduate enrollment at all.)
select campuses.Campus,
    count(*)
from enrollments
inner join discEnr
    on discEnr.CampusId = enrollments.CampusId
        and discEnr.Year = enrollments.Year
inner join campuses
    on discEnr.CampusId = campuses.Id
where enrollments.Enrolled > 20000
    and enrollments.Year = 2004
    and discEnr.Gr > 0
group by campuses.Campus
order by campuses.Campus;


USE `MARATHON`;
-- MARATHON-1
-- For each gender/age group, report total number of runners in the group, the overall place of the best runner in the group and the overall place of the slowest runner in the group. Output result sorted by age group and sorted by gender (F followed by M) within each age group.
select AgeGroup,
    Sex,
    count(*) as Total,
    min(Place) as BestPlacing,
    max(Place) as SlowestPacing
from marathon
group by Sex, AgeGroup
order by AgeGroup, Sex;


USE `MARATHON`;
-- MARATHON-2
-- Report the total number of gender/age groups for which both the first and the second place runners (within the group) are from the same state.
select count(*)
from marathon
inner join marathon as m2
    on marathon.Sex = m2.Sex
    and marathon.AgeGroup = m2.AgeGroup
    and marathon.Place <> m2.Place
    and marathon.State = m2.State
    and marathon.Age < m2.Age
where marathon.GroupPlace <= 2
    and m2.GroupPlace <= 2;


USE `MARATHON`;
-- MARATHON-3
-- For each full minute, report the total number of runners whose pace was between that number of minutes and the next. In other words: how many runners ran the marathon at a pace between 5 and 6 mins, how many at a pace between 6 and 7 mins, and so on.
select floor(time_to_sec(Pace) / 60) as p,
    count(Pace)
from marathon
group by P
order by P;


USE `MARATHON`;
-- MARATHON-4
-- For each state with runners in the marathon, report the number of runners from the state who finished in top 10 in their gender-age group. If a state did not have runners in top 10, do not output information for that state. Sort in descending order by the number of top 10 runners.
select State, 
    count(*) as num
from marathon
where GroupPlace <= 10
group by State
order by num desc;


USE `MARATHON`;
-- MARATHON-5
-- For each Connecticut town with 3 or more participants in the race, report the average time of its runners in the race computed in seconds. Output the results sorted by the average time (lowest average time first).
select Town,
    round(avg(time_to_sec(RunTime)), 1) as time
from marathon 
where State = 'CT'
group by Town
having count(*) >= 3
order by time;


USE `AIRLINES`;
-- AIRLINES-1
-- Find all airports with exactly 17 outgoing flights. Report airport code and the full name of the airport sorted in alphabetical order by the code.
select airports.code,
    airports.name
from airports
join flights
    on flights.Source = airports.Code
group by airports.code
having count(*) = 17
order by airports.code;


USE `AIRLINES`;
-- AIRLINES-2
-- Find the number of airports from which airport ANP can be reached with exactly one transfer. Make sure to exclude ANP itself from the count. Report just the number.
select count(distinct f1.source)
from flights as f1
join flights as f2
    on f2.Destination = 'ANP'
    and f1.Destination = f2.Source
    and f1.Source <> 'ANP'
    and f1.FlightNo <> f2.FlightNo
group by f2.Destination;


USE `AIRLINES`;
-- AIRLINES-3
-- Find the number of airports from which airport ATE can be reached with at most one transfer. Make sure to exclude ATE itself from the count. Report just the number.
select count(distinct f1.Source)
from flights as f1
join flights as f2
    on (f2.Destination = 'ATE'
    or f1.Destination = 'ATE')
    and f1.Source <> 'ATE'
    and f1.Destination = f2.Source;


USE `AIRLINES`;
-- AIRLINES-4
-- For each airline, report the total number of airports from which it has at least one outgoing flight. Report the full name of the airline and the number of airports computed. Report the results sorted by the number of airports in descending order. In case of tie, sort by airline name A-Z.
select airlines.Name, 
    count(distinct flights.Source) as numflights
from airlines
join flights
    on flights.Airline = airlines.Id
group by airlines.Name
order by numflights desc, airlines.Name;


USE `INN`;
-- INN-1
-- For each room, report the total revenue for all stays and the average revenue per stay generated by stays in the room that began in the months of September, October and November. Sort output in descending order by total revenue. Output full room names.
select rooms.RoomName,
        sum(reservations.Rate*
        (DATEDIFF(reservations.CheckOut, 
        reservations.CheckIn))) as revenue,
        round(avg(reservations.Rate*
        (DATEDIFF(reservations.CheckOut, 
        reservations.CheckIn))), 2) as average
from reservations
join rooms 
    on reservations.Room = rooms.RoomCode
where month(reservations.Checkin) >= 9 
    and month(reservations.Checkin) <= 11
group by rooms.RoomName
order by revenue desc;


USE `INN`;
-- INN-2
-- Report the total number of reservations that began on Fridays, and the total revenue they brought in.
select count(*),
        sum(reservations.Rate*
        (DATEDIFF(reservations.CheckOut, 
        reservations.CheckIn))) as revenue
from reservations
join rooms 
    on reservations.Room = rooms.RoomCode
where dayofweek(reservations.CheckIn) = 6;


USE `INN`;
-- INN-3
-- For each day of the week, report the total number of reservations that began on that day and the total revenue for these reservations. Report days of week as Monday, Tuesday, etc. Order days from Sunday to Saturday.
select dayname(CheckIn) as day,
    count(*) as stays,
    sum(reservations.Rate*
        (DATEDIFF(reservations.CheckOut, 
        reservations.CheckIn))) as revenue
from reservations
join rooms
    on reservations.Room = rooms.RoomCode
group by day
order by CASE
        WHEN day = 'Sunday' THEN 0 
        WHEN day = 'Monday' THEN 1
        WHEN day = 'Tuesday' THEN 2
        WHEN day = 'Wednesday' THEN 3
        WHEN day = 'Thursday' THEN 4
        WHEN day = 'Friday' THEN 5
        WHEN day = 'Saturday' THEN 6
    END;


USE `INN`;
-- INN-4
-- For each room report the highest markup against the base price and the largest markdown (discount). Report markups and markdowns as the signed difference between the base price and the rate. Sort output in descending order beginning with the largest markup. In case of identical markup/down sort by room name A-Z. Report full room names.
select rooms.RoomName,
        max(reservations.Rate - rooms.basePrice) as markup,
        min(reservations.Rate - rooms.basePrice) as discount
from reservations
join rooms
    on reservations.Room = rooms.RoomCode
group by rooms.RoomName
order by markup desc, rooms.RoomName;


USE `INN`;
-- INN-5
-- For each room report how many nights in calendar year 2010 the room was occupied. Report the room code, the full name of the room and the number of occupied nights. Sort in descending order by occupied nights. (Note: it has to be number of nights in 2010. The last reservation in each room can go beyond December 31, 2010, so the ”extra” nights in 2011 need to be deducted).
select rooms.RoomCode,
        rooms.RoomName,
        sum(DATEDIFF(reservations.Checkout, reservations.CheckIn)
        - (CASE WHEN reservations.CheckOut >= '2011-01-01'
            THEN DATEDIFF(reservations.CheckOut, '2010-12-31')
            ELSE 0 
            END))
        as occupied
from reservations
join rooms
    on reservations.Room = rooms.RoomCode
where year(reservations.CheckIn) = 2010
group by rooms.RoomCode
order by occupied desc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-1
-- For each performer (by first name) report how many times she sang lead vocals on a song. Sort output in descending order by the number of leads.
select Band.Firsname,
        count(*) as leader
from Band
join Vocals
    on Vocals.Bandmate = Band.Id
where Vocals.VocalType = 'lead'
group by Band.Firsname
order by leader desc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-2
-- Report how many different instruments each performer plays on songs from the album 'Le Pop'. Sort the output by the first name of the performers.
select Band.Firsname,
        count(distinct Instruments.Instrument)
from Band
join Instruments 
    on Instruments.Bandmate = Band.Id
join Tracklists
    on Tracklists.Song = Instruments.Song
join Albums
    on Tracklists.Album = Albums.AId
where Albums.Title = 'Le Pop'
group by Band.Firsname
order by Band.Firsname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-3
-- Report the number of times Turid stood at each stage position when performing live. Sort output in ascending order of the number of times she performed in each position.

select Performance.StagePosition as TPos,
        count(*) as count
from Band
join Performance
    on Performance.Bandmate = Band.Id
where Band.Firsname = 'Turid'
group by TPos
order by count;


USE `KATZENJAMMER`;
-- KATZENJAMMER-4
-- Report how many times each performer (other than Anne-Marit) played bass balalaika on the songs where Anne-Marit was positioned on the left side of the stage. Sort output alphabetically by the name of the performer.

select Band.Firsname,
        count(*)
from Band
join Instruments
    on Instruments.Bandmate = Band.Id
join Performance
    on Performance.Bandmate = Band.Id
    and Performance.Song = Instruments.Song
where Instruments.Instrument = 'bass balalaika'
 and Band.Firsname <> 'Anne-Marit'
    and Performance.Song in (
    select Song
    from Performance 
    join Band
    on Band.Id = Performance.BandMate
    where Band.Firsname = 'Anne-Marit'
    and Performance.StagePosition = 'left')
group by Band.Firsname    
order by Band.Firsname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-5
-- Report all instruments (in alphabetical order) that were played by three or more people.
select Instruments.Instrument
from Instruments
join Band
    on Instruments.Bandmate = Band.Id
group by Instruments.Instrument
having count(distinct Band.Id) >= 3
order by Instruments.Instrument;


USE `KATZENJAMMER`;
-- KATZENJAMMER-6
-- For each performer, report the number of times they played more than one instrument on the same song. Sort output in alphabetical order by first name of the performer
select distinct Band.Firsname, 
        count(distinct Instruments.Song)
from Band
join Instruments
    on Band.Id = Instruments.BandMate
join (Band b join Instruments i on b.Id = i.BandMate)
    on b.Id = Band.Id 
    and Instruments.Song = i.Song
    and Instruments.Instrument < i.Instrument
group by Band.Firsname
order by Band.Firsname;


