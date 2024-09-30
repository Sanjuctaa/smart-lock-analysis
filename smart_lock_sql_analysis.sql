-- 12. write a query to find the count of products in particular price distribution :
-- <INR 4999  
-- INR 3000-4999  
-- INR 5000-9999  
-- INR 10000-14999  
-- INR 15000-19999  
-- Greater than 20000

select '<INR 4999' as price_band, count(*) as count
from smart_lock_data
where "Price" < 4999
union
select 'INR 3000-4999' as price_band, count(*) as price_count
from smart_lock_data
where "Price" between 3000 and 49999
union
select 'INR 5000-9999' as price_band, count(*) as price_count
from smart_lock_data
where "Price" between 5000 and 99999
union
select 'INR 10000-14999' as price_band, count(*) as price_count
from smart_lock_data
where "Price" between 10000 and 149999
union
select 'INR 15000-19999' as price_band, count(*) as price_count
from smart_lock_data
where "Price" between 15000 and 199999
union
select 'Greater than 20000' as price_band, count(*) as price_count
from smart_lock_data
where "Price" >20000;