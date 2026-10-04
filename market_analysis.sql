use project_orders;

select * from aisles;
select * from departments;
select * from order_products_train;
select * from orders;
select * from products;


-- 1.	What are the top 10 aisles with the highest number of products?

select aisle_id,count(aisle_id) as number_of_products
from products
group by aisle_id
order by count(aisle_id) desc limit 10;

-- 2.	How many unique departments are there in the dataset?

select count(distinct department) as unique_department
from departments;

-- 3.	What is the distribution of products across departments?

select department_id,count(department_id) as total_products
from products
group by department_id
order by department_id asc;

-- 4.	What are the top 10 products with the highest reorder rates?

select product_id , count(*) as total_orders,
sum(reordered) as reorder_count,
round(sum(reordered)*100.00/count(*),2) as reorder_rate
from order_products_train
group by product_id
order by reorder_rate desc limit 10;

-- 5.	How many unique users have placed orders in the dataset?
 
select count(distinct  order_id) as unquie_users
from orders;

-- 6.	What is the average number of days between orders for each user
select user_id ,
round(avg(days_since_prior_order)) as average_days
from orders
group by user_id;

-- 7. What are the peak hours of order placement during the day 
select order_hour_of_day,count(*) as frequency
from orders
group by order_hour_of_day
order by frequency desc;

-- 8.	How does order volume vary by day of the week?
select order_dow,count(order_id) as order_volume
from orders
group by order_dow
order by order_dow;

-- 9.	What are the top 10 most ordered products?
select p.product_id,p.product_name,count(*) as order_count
from order_products_train opt
join products p
on p.product_id = opt.product_id
group by product_id
order by order_count desc limit 10;

-- 10.	How many users have placed orders in each department?
select p.department_id,
count(distinct o.order_id) total_users
from orders o 
join order_products_train opt
on o.order_id = opt.order_id
join products p 
on opt.product_id = p.product_id
group by department_id
order by department_id;

 -- 11.	What is the average number of products per order?
select round(avg(product_count),2) as avg_products_per_order
from(
 select order_id , count(product_id) as product_count
 from order_products_train
 group by order_id
) as order_count;
 
 -- 12.	What are the most reordered products in each department?
 select d.department, p.department_id ,p.product_id,count(reordered) as count_of_reorder
 from products p
 join order_products_train opt
 on p.product_id= opt.product_id
 join departments as d
 on d.department_id = p.department_id
 where opt.reordered = 1
 group by department_id,department,product_id
 order by count_of_reorder desc;
 
 
-- 13.	How many products have been reordered more than once?
select count(*) as reorder_more_than_ones
from (
select product_id 
from order_products_train
where reordered = 1
group by product_id
having count(*) >1
) as product_reordered;

-- 14.	What is the average number of products added to the cart per order?
select round(avg(product_per_order),2)as avg_number_of_products_added_to_cart
from(

select order_id,count(product_id)as product_per_order
from order_products_train
group by order_id)as order_count
;

-- 15.	How does the number of orders vary by hour of the day?

select order_hour_of_day,
count(order_id) as no_of_orders_vary_by_hour
from orders
group by order_hour_of_day;

-- 16.	What is the distribution of order sizes (number of products per order)?

SELECT
    product_count AS products_per_order,
    COUNT(*) AS number_of_orders
FROM (
    SELECT
        order_id,
        COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_sizes
GROUP BY product_count
ORDER BY product_count;

-- 17.	What is the average reorder rate for products in each aisle?
SELECT
    a.aisle_id,
    a.aisle,
    ROUND(AVG(opt.reordered) * 100, 2) AS avg_reorder_rate
FROM aisles a
JOIN products p
    ON a.aisle_id = p.aisle_id
JOIN order_products_train opt
    ON p.product_id = opt.product_id
GROUP BY a.aisle_id, a.aisle;
-- 18.	How does the average order size vary by day of the week?
SELECT
    o.order_dow,
    ROUND(AVG(order_size), 2) AS avg_order_size
FROM (
    SELECT
        order_id,
        COUNT(product_id) AS order_size
    FROM order_products_train
    GROUP BY order_id
) AS os
JOIN orders o
    ON os.order_id = o.order_id
GROUP BY o.order_dow
ORDER BY o.order_dow;
-- 19.	What are the top 10 users with the highest number of orders?
SELECT
    user_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY user_id
ORDER BY order_count DESC
LIMIT 10;
-- 20.	How many products belong to each aisle and department?
SELECT
    a.aisle,
    d.department,
    COUNT(p.product_id) AS product_count
FROM products p
JOIN aisles a
    ON p.aisle_id = a.aisle_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY
    a.aisle_id,
    a.aisle,
    d.department_id,
    d.department
ORDER BY d.department_id, a.aisle_id;


 