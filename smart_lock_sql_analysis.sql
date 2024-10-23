--1. Find Top 5 Highest Priced Products.
SELECT "Product Name","Brand" , "Price" 
FROM smart_lock_data
ORDER BY 3 DESC 
LIMIT 5;

-- 2. Write a query to calculate the average price of products for each brand.
SELECT "Brand", round(AVG("Price"),2) AS average_price 
FROM smart_lock_data
GROUP BY 1
order by 2 desc;

-- 3. List all products that have a price higher than the average price of all
--    smart locks.

select "Product Name","Price"
from smart_lock_data
where "Price" >(select avg("Price") from smart_lock_data);

-- 4. Categorize the products into 'Low', 'Medium', and 'High' price categories based on their price ranges. Assume:
--    Low: Price < 2000
-- 	  Medium: 2000 <= Price <= 5000
--	  High: Price > 5000

SELECT "Product Name", "Price", 
   CASE
       WHEN "Price" < 2000 THEN 'Low'
       WHEN "Price" BETWEEN 2000 AND 5000 THEN 'Medium'
       ELSE 'High'
   END AS Price_Category
FROM smart_lock_data;

-- 5. Rank all products by their rating within each brand to see how each 
--    brand's products perform relative to each other.

SELECT "Product Name", "Brand", "Rating", 
       RANK() OVER (PARTITION BY "Brand" ORDER BY "Rating" DESC) AS product_rank_in_brand
FROM smart_lock_data;

-- 6. calculate the total number of reviews for each brand, and 
--    then find brands with more than 100 reviews in total.

WITH brand_review_count AS (
    SELECT "Brand", SUM("Reviews_count") AS total_reviews
    FROM smart_lock_data
    GROUP BY "Brand"
)
SELECT "Brand", "total_reviews"
FROM brand_review_count
WHERE total_reviews > 1000;


8. write a query to find the count of products in particular price distribution :
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
