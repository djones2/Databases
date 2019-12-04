-- Lab 6
-- djones27
-- Dec 2, 2019

USE `BAKERY`;
-- BAKERY-1
-- Find all customers who did not make a purchase between October 5 and October 11 (inclusive) of 2007. Output first and last name in alphabetical order by last name.
select customers.Firstname, customers.Lastname
from customers
where customers.CId not in (
    select c.CID
    from customers as c
    join receipts
    on receipts.Customer = c.CId
    where receipts.SaleDate between
        '2007-10-05' and '2007-10-11');


USE `BAKERY`;
-- BAKERY-2
-- Find the customer(s) who spent the most money at the bakery during October of 2007. Report first, last name and total amount spent (rounded to two decimal places). Sort by last name.
with most as 
(select customers.FirstName,
        customers.Lastname,
        round(sum(goods.PRICE), 2) as spent
from customers
join receipts
on receipts.Customer = customers.CId
join items
on items.Receipt = receipts.RNumber
join goods 
on items.Item = goods.GId
where receipts.SaleDate between
    '2007-10-01' and '2007-10-31'
group by customers.LastName, customers.Firstname
having max(spent)
order by customers.LastName)
select * from most
where spent = (select max(spent) from most);


USE `BAKERY`;
-- BAKERY-3
-- Find all customers who never purchased a twist ('Twist') during October 2007. Report first and last name in alphabetical order by last name.

select c.Firstname, 
        c.Lastname
from customers as c
where c.CId not in(
select customers.CId
from customers
join receipts
    on receipts.Customer = customers.CId
join items
    on items.Receipt = receipts.RNumber
join goods 
    on items.Item = goods.GId
where receipts.SaleDate 
    between '2007-10-01' and '2007-10-31'
    and goods.Food = 'Twist')
order by c.Lastname;


USE `BAKERY`;
-- BAKERY-4
-- Find the type of baked good (food type & flavor) responsible for the most total revenue.
with revenue as (
select goods.Food,
        goods.Flavor,
        sum(goods.Price) as total
from receipts
join items
    on items.Receipt = receipts.RNumber
join goods
    on goods.GId = items.Item
group by goods.Food, goods.Flavor, goods.Price
)
select revenue.Flavor, revenue.Food from revenue
where total = (select max(total) from revenue);


USE `BAKERY`;
-- BAKERY-5
-- Find the most popular item, based on number of pastries sold. Report the item (food, flavor) and total quantity sold.
with popular as 
(select goods.Food,
        goods.Flavor,
        count(*) as total
from receipts
join items
    on items.Receipt = receipts.RNumber
join goods
    on goods.GId = items.Item
group by goods.Food, goods.Flavor
)
select popular.Flavor, popular.Food, total from popular
where total = (select max(total) from popular);


USE `BAKERY`;
-- BAKERY-6
-- Find the date of highest revenue during the month of October, 2007.
with total as (
select receipts.SaleDate, 
    round(sum(goods.Price), 2) as revenue
from receipts
join items
    on items.Receipt = receipts.RNumber
join goods
    on goods.GId = items.Item
where receipts.SaleDate between
    '2007-10-01' and '2007-10-31'
group by receipts.SaleDate
order by receipts.SaleDate)
select total.SaleDate
from total
where revenue = (select max(revenue) from total);


USE `BAKERY`;
-- BAKERY-7
-- Find the best-selling item (by number of purchases) on the day of the highest revenue in October of 2007.
with total as (
select receipts.SaleDate, 
    goods.GId,
    goods.Flavor, 
    goods.Food,
    count(goods.GId) as popular,
    round(sum(goods.Price), 2) as revenue
from receipts
join items
    on items.Receipt = receipts.RNumber
join goods
    on goods.GId = items.Item
where receipts.SaleDate between
    '2007-10-01' and '2007-10-31'
group by receipts.SaleDate, goods.GId, goods.Flavor,
            goods.Food
order by receipts.SaleDate)
select total.Flavor, total.Food, total.popular
from total
where revenue = (select max(revenue) from total);


USE `BAKERY`;
-- BAKERY-8
-- For every type of Cake report the customer(s) who purchased it the largest number of times during the month of October 2007. Report the name of the pastry (flavor, food type), the name of the customer (first, last), and the number of purchases made. Sort output in descending order on the number of purchases, then in alphabetical order by last name of the customer, then by flavor.
select Flavor, Food, FirstName, LastName, count(*) from
goods g join items i on g.GId = i.Item and g.Food = 'Cake'
join receipts r on r.RNumber = i.Receipt
join customers c on c.CId = r.Customer
group by g.Flavor, g.Food, c.CId
having count(*) = (select max(cnt) from
    (select g1.flavor, count(*) as cnt from
    goods g1 join items i1 on g1.GId = i1.Item and g1.Food = 'Cake'
    join receipts r1 on r1.RNumber = i1.Receipt
    join customers c1 on c1.CId = r1.Customer
    group by g1.Flavor, c1.CId) as a
    group by a.Flavor having a.Flavor = g.Flavor)
order by count(*) desc, LastName asc, Flavor asc;


USE `BAKERY`;
-- BAKERY-9
-- Output the names of all customers who made multiple purchases (more than one receipt) on the latest day in October on which they made a purchase. Report names (first, last) of the customers and the earliest day in October on which they made a purchase, sorted in chronological order.

with purchases as (select c.LastName,
        c.FirstName,
        r.SaleDate,
        MAX(r.SaleDate) over (Partition by c.LastName) as last
from customers c
join receipts r 
on r.Customer = c.CId
order by c.LastName, r.SaleDate),
first as (select distinct c.LastName,
        c.FirstName,
        MIN(r.SaleDate) over (Partition by c.LastName) as first
from customers c
join receipts r 
on r.Customer = c.CId
order by c.LastName)
select p.LastName,
        p.FirstName,
        f.first
from purchases p
join purchases p1
on p.LastName = p1.LastName 
    and p.FirstName = p1.FirstName
    and p.SaleDate = p1.Last
    and p.SaleDate = p1.SaleDate
join first f
on p.LastName = f.LastName 
    and p.FirstName = f.FirstName
group by p.FirstName, p.LastName, f.first
having count(*) > 1
order by f.first;


USE `BAKERY`;
-- BAKERY-10
-- Find out if sales (in terms of revenue) of Chocolate-flavored items or sales of Croissants (of all flavors) were higher in October of 2007. Output the word 'Chocolate' if sales of Chocolate-flavored items had higher revenue, or the word 'Croissant' if sales of Croissants brought in more revenue.

select CASE
        WHEN croissant.type2 > chocolate.type2 THEN "Croissant"
        ELSE "Chocolate"
    END
from
(select g.Food, sum(g.PRICE) as type2
from goods as g 
join items as i
    on i.Item = g.GId
join receipts as r 
    on r.RNumber = i.Receipt
where g.Food = 'Croissant'
and r.SaleDate between '2007-10-01' and '2007-10-31'
) as croissant 
join (
select g1.flavor,
        sum(g1.PRICE) as type2
from goods as g1 
join items as i1
    on i1.Item = g1.GId
join receipts as r1 
    on r1.RNumber = i1.Receipt
where g1.Flavor = 'Chocolate'
and r1.SaleDate between '2007-10-01' and '2007-10-31'
) as chocolate;


USE `INN`;
-- INN-1
-- Find the most popular room (based on the number of reservations) in the hotel  (Note: if there is a tie for the most popular room status, report all such rooms). Report the full name of the room, the room code and the number of reservations.

with pop as (
select rooms.RoomName,
        rooms.RoomCode,
        count(*) as total
from reservations
join rooms 
on rooms.RoomCode = reservations.Room
group by rooms.RoomName, rooms.RoomCode)
select * 
from pop
where total = (select max(total) from pop);


USE `INN`;
-- INN-2
-- Find the room(s) that have been occupied the largest number of days based on all reservations in the database. Report the room name(s), room code(s) and the number of days occupied. Sort by room name.
with pop as (
select rooms.RoomName,
        rooms.RoomCode,
        sum(DATEDIFF(reservations.Checkout, reservations.CheckIn)) as nights
from reservations
join rooms 
on rooms.RoomCode = reservations.Room
group by rooms.RoomName, rooms.RoomCode)
select * from pop
where nights = (select max(nights) from pop);


USE `INN`;
-- INN-3
-- For each room, report the most expensive reservation. Report the full room name, dates of stay, last name of the person who made the reservation, daily rate and the total amount paid. Sort the output in descending order by total amount paid.
select rooms.RoomName,
        reservations.CheckIn,
        reservations.CheckOut,
        reservations.LastName,
        reservations.Rate,
        reservations.Rate * DATEDIFF(reservations.Checkout, reservations.CheckIn) as paid
from reservations
join rooms
on rooms.RoomCode = reservations.Room
group by rooms.RoomName,
        reservations.CheckIn,
        reservations.CheckOut,
        reservations.LastName,
        reservations.Rate
having paid = (select max(due) from
    (select rooms.RoomName,
        reservations.CheckIn,
        reservations.CheckOut,
        reservations.LastName,
        reservations.Rate,
        reservations.Rate * DATEDIFF(reservations.Checkout, reservations.CheckIn) as due
    from reservations
    join rooms
    on rooms.RoomCode = reservations.Room
    group by rooms.RoomName,
        reservations.CheckIn,
        reservations.CheckOut,
        reservations.LastName,
        reservations.Rate) as a
    group by a.RoomName having a.RoomName = rooms.RoomName)
order by paid desc;


USE `INN`;
-- INN-4
-- For each room, report whether it is occupied or unoccupied on July 4, 2010. Report the full name of the room, the room code, and either 'Occupied' or 'Empty' depending on whether the room is occupied on that day. (the room is occupied if there is someone staying the night of July 4, 2010. It is NOT occupied if there is a checkout on this day, but no checkin). Output in alphabetical order by room code. 
select distinct r.RoomName,
        r.RoomCode,
        (CASE WHEN r.RoomName in (
        select rooms.RoomName from rooms
        join reservations
        on reservations.Room = rooms.RoomCode
        where '2010-07-04' >= reservations.CheckIn 
        and '2010-07-04' < reservations.CheckOut) THEN 'Occupied'
        ELSE 'Empty'
        END) as occupied
from rooms r
order by r.RoomCode;


USE `INN`;
-- INN-5
-- Find the highest-grossing month (or months, in case of a tie). Report the month, the total number of reservations and the revenue. For the purposes of the query, count the entire revenue of a stay that commenced in one month and ended in another towards the earlier month. (e.g., a September 29 - October 3 stay is counted as September stay for the purpose of revenue computation). In case of a tie, months should be sorted in chronological order.
with gross as (select MONTH(r.CheckIn) as month,
        count(*) as reser,
        sum(r.Rate * DATEDIFF(r.CheckOut, r.CheckIn)) as income
from reservations r
group by month
order by month)
select MONTHNAME(STR_TO_DATE(gross.month, '%m')) as monthname,
        gross.reser,
        gross.income
from gross
having gross.income = (select max(income) from gross)
order by gross.month asc;


USE `STUDENTS`;
-- STUDENTS-1
-- Find the teacher(s) who teach(es) the largest number of students. Report the name of the teacher(s) (first and last) and the number of students in their class.

with numbers as (select teachers.Last,
        teachers.First,
        count(*) as students
from list
join teachers
    on teachers.classroom = list.classroom
group by teachers.Last, teachers.First)
select * from numbers
where students = (select max(students) from numbers);


USE `STUDENTS`;
-- STUDENTS-2
-- Find the grade(s) with the largest number of students whose last names start with letters 'A', 'B' or 'C' Report the grade and the number of students
with letters as (
select list.grade as grade,
        count(*) as cnt
from list
where left(list.LastName, 1) = 'A'
        or left(list.LastName, 1) = 'B'
        or left(list.LastName, 1) = 'C'
group by list.grade)
select * 
from letters
where cnt = (select max(cnt) from letters);


USE `STUDENTS`;
-- STUDENTS-3
-- Find all classrooms which have fewer students in them than the average number of students in a classroom in the school. Report the classroom numbers in ascending order. Report the number of student in each classroom.
with ave as (
select avg(a.size) as aver from
(select count(*) as size 
from list l
group by l.classroom) a)
select list.classroom,
        count(*) as num
from list
group by list.classroom
having num < (select * from ave);


USE `STUDENTS`;
-- STUDENTS-4
--  Find all pairs of classrooms with the same number of students in them. Report each pair only once. Report both classrooms and the number of students. Sort output in ascending order by the number of students in the classroom.
with pop as (
select l.classroom,
        count(*) as size
from list l
group by l.classroom)
select pop.classroom,
        pop2.classroom,
        pop.size
from pop
join pop as pop2
on pop.classroom <> pop2.classroom
and pop.size = pop2.size
and pop.classroom < pop2.classroom
order by pop.size;


USE `STUDENTS`;
-- STUDENTS-5
-- For each grade with more than one classroom, report the last name of the teacher who teachers the classroom with the largest number of students in the grade. Output results in ascending order by grade.
with grades as (
select list.grade 
from list
group by list.grade
having count(distinct list.classroom) > 1),
students as (
select t.Last,
        t.First,
        l.grade,
        count(*) as num
from teachers t
join list l 
on l.classroom = t.classroom
group by t.Last,
        t.First,
        l.grade
having num = (select max(most) from
        (select t.Last,
        t.First,
        l.grade,
        count(*) as most
        from teachers t
        join list l 
        on l.classroom = t.classroom
        group by t.Last,
                t.First,
                l.grade) as ta
        group by ta.grade having ta.grade = l.grade)
)
select students.grade,
        students.Last
from students
join grades
on grades.grade = students.grade
order by students.grade;


USE `CSU`;
-- CSU-1
-- Find the campus with the largest enrollment in 2000. Output the name of the campus and the enrollment.

with most as (select campuses.Campus,
        enrollments.Enrolled as enroll
from campuses
join enrollments
    on enrollments.CampusId = campuses.Id
where enrollments.Year = 2000)
select * from most
where enroll = (select max(enroll) from most);


USE `CSU`;
-- CSU-2
-- Find the university that granted the highest average number of degrees per year over its entire recorded history. Report the name of the university.

with avgd as (select campuses.Campus as c,
        avg(degrees.degrees) as average
from degrees
join campuses
    on degrees.CampusId = campuses.Id
group by campuses.Campus)
select c
from avgd
where average = (select max(average) from avgd);


USE `CSU`;
-- CSU-3
-- Find the university with the lowest student-to-faculty ratio in 2003. Report the name of the campus and the student-to-faculty ratio, rounded to one decimal place. Use FTE numbers for enrollment.
with this as (select c.Campus,
        round(e.FTE / f.FTE, 1) as ratio
from enrollments e
join faculty f
on e.CampusId = f.CampusId and e.Year = f.Year
join campuses c
on c.Id = e.CampusId
where e.year = 2003)
select *
from this 
where ratio = (select min(ratio) from this);


USE `CSU`;
-- CSU-4
-- Find the university with the largest percentage of the undergraduate student body in the discipline 'Computer and Info. Sciences' in 2004. Output the name of the campus and the percent of these undergraduate students on campus.
with percent as (select campuses.Campus,
        round((discEnr.Ug / enrollments.Enrolled) * 100, 1)
        as perc
from campuses
join discEnr 
    on discEnr.CampusId = campuses.Id
join disciplines
    on disciplines.Id = discEnr.Discipline
join enrollments
    on campuses.Id = enrollments.CampusId
where disciplines.Name = 'Computer and Info. Sciences'
    and enrollments.Year = 2004)
select *
from percent
where perc = (select max(perc) from percent);


USE `CSU`;
-- CSU-5
-- For each year between 1997 and 2003 (inclusive) find the university with the highest ratio of total degrees granted to total enrollment (use enrollment numbers). Report the years, the names of the campuses and the ratios. List in chronological order.
with one as (select d.year,
        c.Campus, 
        d.degrees / e.Enrolled as ratio
from campuses c
join degrees d
on d.CampusId = c.Id 
join enrollments e
on d.year = e.year and e.CampusId = c.Id
where d.year between 1997 and 2003)
select *
from one
group by one.year, one.Campus, one.ratio
having one.ratio = (select max(most) from
    (select d.year,
        c.Campus, 
        d.degrees / e.Enrolled as most
    from campuses c
    join degrees d
    on d.CampusId = c.Id 
    join enrollments e
    on d.year = e.year and e.CampusId = c.Id
    where d.year between 1997 and 2003) as a 
    group by a.year
    having a.year = one.year)
order by one.year;


USE `CSU`;
-- CSU-6
-- For each campus report the year of the best student-to-faculty ratio, together with the ratio itself. Sort output in alphabetical order by campus name. Use FTE numbers to compute ratios.
with ratios as (select c.Campus,
        e.Year,
        round(e.FTE / f.FTE, 2) as SF
from campuses c
join enrollments e
on e.CampusId = c.Id
join faculty f 
on f.Year = e.Year and f.CampusId = c.Id)
select *
from ratios 
where ratios.SF = (select max(most) from
    (select c.Campus,
        e.Year,
        round(e.FTE / f.FTE, 2) as most
    from campuses c
    join enrollments e
    on e.CampusId = c.Id
    join faculty f 
    on f.Year = e.Year and f.CampusId = c.Id) as a
    group by a.Campus having a.Campus = ratios.Campus)
order by ratios.Campus;


USE `CSU`;
-- CSU-7
-- For each year (for which the data is available) report the total number of campuses in which student-to-faculty ratio became worse (i.e. more students per faculty) as compared to the previous year. Report in chronological order.

with year as (select e.CampusId,
        e.Year,
        e.FTE / f.FTE as ratio
from enrollments e
join faculty f
on e.CampusId = f.CampusId and e.Year = f.Year
group by e.CampusId, e.Year)
select y2.year,
        count(distinct y2.CampusId)
from year y1
join year y2
on y1.CampusId = y2.CampusId
and y1.Year = y2.Year - 1
and y1.ratio < y2.ratio
group by y2.Year;


USE `MARATHON`;
-- MARATHON-1
-- Find the state(s) with the largest number of participants. List state code(s) sorted alphabetically.

with counts as (select State,
        count(*) as participants
from marathon
group by State)
select State
from counts
where participants = (select max(participants) from counts)
order by state;


USE `MARATHON`;
-- MARATHON-2
--  Find all towns in Rhode Island (RI) which fielded more female runners than male runners for the race. Report the names of towns, sorted alphabetically.

with compare as (
select marathon.town, males, females
from marathon
join (select m.town,
        count(*) as males
from marathon as m
where m.State = 'RI'
    and m.sex = 'M'
group by m.town) as male
on marathon.town = male.town
join (select m2.town,
        count(*) as females
from marathon as m2 
where m2.State = 'RI'
    and m2.sex = 'F'
group by m2.town) as female
on marathon.town = female.town)
select distinct town
from compare 
where females > males
order by compare.town;


USE `MARATHON`;
-- MARATHON-3
-- For each state, report the gender-age group with the largest number of participants. Output state, age group, gender, and the number of runners in the group. Report only information for the states where the largest number of participants in a gender-age group is greater than one. Sort in ascending order by state code, age group, then gender.
select m.State, m.AgeGroup, m.Sex, count(*)
from marathon m
group by m.State, m.AgeGroup, m.Sex
having count(*) = (select max(largest) from
    (select m1.State, m1.AgeGroup, m1.Sex, count(*) as largest
    from marathon m1
    group by m1.State, m1.AgeGroup, m1.Sex) as a
    group by a.State having a.State = m.State)
    and count(*) > 1
order by m.State, m.AgeGroup, m.Sex;


USE `MARATHON`;
-- MARATHON-4
-- Find the 30th fastest female runner. Report her overall place in the race, first name, and last name. This must be done using a single SQL query (which may be nested) that DOES NOT use the LIMIT clause. Think carefully about what it means for a row to represent the 30th fastest (female) runner.
with thirty as (select m.Place, m.FirstName, m.LastName,
row_number() OVER (PARTITION BY m.Sex ORDER BY m.Place) 
    as ordered
from marathon m
where m.Sex = 'F')
select thirty.Place,
        thirty.FirstName,
        thirty.LastName
from thirty
where ordered = 30;


USE `MARATHON`;
-- MARATHON-5
-- For each town in Connecticut report the total number of male and the total number of female runners. Both numbers shall be reported on the same line. If no runners of a given gender from the town participated in the marathon, report 0. Sort by number of total runners from each town (in descending order) then by town.

with males as (
select m.Town,
        count(*) as males
from marathon m
where m.Sex = 'M'
and m.State = 'CT'
group by m.Town),
females as (
select m.Town,
        count(*) as females
from marathon m
where m.Sex = 'F'
and m.State = 'CT'
group by m.Town
),
last as (
select distinct m2.Town,
        IFNULL(males.males, 0) as ma,
        IFNULL(females.females, 0) as fe
from males
right outer join marathon m2
on males.Town = m2.Town
left outer join females
on females.Town = m2.Town
where m2.State = 'CT' 
order by (ma + fe) desc, m2.town)
select * from last;


USE `KATZENJAMMER`;
-- KATZENJAMMER-1
-- Report the first name of the performer who never played accordion.

select b.Firsname 
from Band as b
where b.Id not in (
select distinct b2.Id 
from Band as b2
join Instruments as I
on I.Bandmate = b2.Id
where I.Instrument = 'accordion');


USE `KATZENJAMMER`;
-- KATZENJAMMER-2
-- Report, in alphabetical order, the titles of all instrumental compositions performed by Katzenjammer ("instrumental composition" means no vocals).

select s.Title 
from Songs as s
where s.SongId not in (
select v.Song 
from Vocals as v)
order by s.Title;


USE `KATZENJAMMER`;
-- KATZENJAMMER-3
-- Report the title(s) of the song(s) that involved the largest number of different instruments played (if multiple songs, report the titles in alphabetical order).
with numI as 
(select i.Song,
        count(*) as most
from Instruments i
group by i.Song)
select s.Title
from numI
join Songs s 
    on s.SongId = numI.Song
where most = (select max(most) from numI)
order by s.Title asc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-4
-- Find the favorite instrument of each performer. Report the first name of the performer, the name of the instrument and the number of songs the performer played the instrument on. Sort in alphabetical order by the first name.

select b.Firsname, i.Instrument, count(*) 
from Band b
join Instruments i on i.Bandmate = b.Id
group by b.Firsname, i.Instrument
having count(*) = (select max(songs2) from 
    (select b1.Firsname, i1.Instrument, count(*) as songs2
    from Band b1
    join Instruments i1 on i1.Bandmate = b1.Id
    group by b1.Firsname, i1.Instrument) as a
    group by a.Firsname having a.Firsname = b.Firsname)
order by b.Firsname, i.Instrument desc;


USE `KATZENJAMMER`;
-- KATZENJAMMER-5
-- Find all instruments played ONLY by Anne-Marit. Report instruments in alphabetical order.
select distinct i.Instrument
from Instruments i 
join Band b
on b.Id = i.Bandmate
where b.Firsname = 'Anne-Marit'
and i.Instrument not in (
select distinct i.Instrument
from Instruments i 
join Band b
on b.Id = i.Bandmate
where b.Firsname <> 'Anne-Marit');


USE `KATZENJAMMER`;
-- KATZENJAMMER-6
-- Report the first name of the performer who played the largest number of different instruments. Sort in ascending order.

with most as (select b.Firsname,
        count(distinct i.Instrument) as talent
from Band b
join Instruments i
on b.Id = i.Bandmate
group by b.Firsname)
select most.Firsname
from most
where talent = (select max(talent) from most)
order by most.Firsname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-8
-- Who spent the most time performing in the center of the stage (in terms of number of songs on which she was positioned there)? Return just the first name of the performer(s). Sort in ascending order.

with time as (
select b.Firsname,
        count(*) as front
from Band b
join Performance p
on p.Bandmate = b.Id
where p.StagePosition = 'center'
group by b.Firsname)
select time.Firsname
from time
where front = (select max(front) from time)
order by time.Firsname;


USE `KATZENJAMMER`;
-- KATZENJAMMER-7
-- Which instrument(s) was/were played on the largest number of songs? Report just the names of the instruments (note, you are counting number of songs on which an instrument was played, make sure to not count two different performers playing same instrument on the same song twice).
with most as 
(select count(distinct i.Song) as more,
        i.Instrument
from Instruments i
group by i.Instrument)
select most.Instrument
from most
where more = (select max(more) from most);


