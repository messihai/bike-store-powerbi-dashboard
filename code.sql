with cte as ( 
select * from bike_share_yr_0
union all
select * from bike_share_yr_1)

select
dteday,
season,
а.уг,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
riders*price -COGS as profit
from cte a
left join cost table b
on ayr = b.yr
