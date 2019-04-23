/* 	Wenjie Ma
	CSE 414 Spring 2019
	Dan Suciu 
	HW 3 
List all cities that cannot be reached from Seattle through a direct flight nor with one stop
(i.e., with any two flights that go through an intermediate city). Warning: this query might take a while to execute.
We will learn about how to speed this up in lecture. (15 points)
Name the output column city. Order the output ascending by city.
(You can assume all cities to be the collection of all origin_city or all dest_city)
(Note: Do not worry if this query takes a while to execute. We are mostly concerned with the results)
[Output relation cardinality: 3 or 4, depending on what you consider to be the set of all cities]
*/

with secondStopFlight as (
	select F1.dest_city as dest_city
	from Flights as F1
	where F1.origin_city != 'Seattle WA'
	and F1.dest_city != 'Seattle WA'
)
select SF.dest_city as city
from Flights as F, secondStopFlight as SF
where city not in
		(select F3.dest_city
		from Flights as F2
		join Flights F3
		on F2.dest_city = F3.origin_city
		and F2.dest_city = SF.dest_city
		where F2.origin_city = 'Seattle WA')
group by SF.dest_city
order by SF.dest_city ASC;