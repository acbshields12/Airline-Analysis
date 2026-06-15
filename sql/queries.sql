create database airline_analysis;
use airline_analysis;

-- Total Revenue
select round(sum(revenue),2) as totalrevenue
from flights;

-- Revenue by Airline
select airline, round(sum(revenue),2) as totalrevenue
from flights
group by airline
order by totalrevenue desc;

-- Top 10 Routes
select concat(departureairport," - ",arrivalairport) as route,
		round(sum(revenue),2) as totalrevenue
from flights
group by route
order by totalrevenue desc
limit 10;

-- Average Delay by Airline
select airline, round(avg(delayminutes),2) as avgdelay
from flights
group by airline
order by avgdelay desc;

-- Cancelled FLights
select airline, count(*) as cancelled
from flights
where status = "Cancelled"
group by airline;

-- Passenger Volume by Airport
select departureairport, sum(passengers) as total_passengers
from flights
group by departureairport
order by total_passengers desc;

-- Monthly Revenue Trend
select month(flightdate) as month_num,
round(sum(revenue),2) as revenue
from flights
group by month_num
order by month_num;