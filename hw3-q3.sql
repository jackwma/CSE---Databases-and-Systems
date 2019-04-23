/* 	Wenjie Ma
	CSE 414 Spring 2019
	Dan Suciu 
	HW 3 
For each origin city, find the percentage of departing flights shorter than 3 hours.
For this question, treat flights with NULL actual_time values as longer than 3 hours. (15 points)
Name the output columns origin_city and percentage
Order by percentage value, ascending. Be careful to handle cities without any flights shorter than 3 hours.
We will accept either 0 or NULL as the result for those cities.
Report percentages as percentages not decimals (e.g., report 75.25 rather than 0.7525).
*/

select F.origin_city as origin_city, ((
	select count(*)
	from Flights as shortF
	where shortF.origin_city = F.origin_city
	and (shortF.actual_time < 180 or shortF.actual_time is not NULL)
	group by shortF.origin_city
)/count(*))*100 as percentage
from Flights as F
group by F.origin_city
order by percentage ASC;