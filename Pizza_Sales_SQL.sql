use pizzadb;
select * from pizza_sales;
-- Total Sales
select sum(total_price) as Total_revenue from pizza_sales;

-- Average Order Vale
select sum(total_price)/Count(distinct order_id) as Avg_Order_Value from pizza_sales;

-- Total Pizzas Sold
select Sum(quantity) as Total_pizzas_sold from pizza_sales;

-- Total Orders
select count(distinct order_id) as Total_Orders from pizza_sales;

-- Average Pizza Per Order
select sum(quantity)/count(distinct order_id) as Average_Pizza_Per_Order from pizza_sales;

-- Charts Requirement
-- 1. Daily Order Trend
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Order_Day
ORDER BY FIELD(Order_Day,
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday');


-- Monthly Trend for Total Orders
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%y')) AS Order_Month,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY Order_Month
ORDER BY Total_Orders desc;

-- 3.	Percentage of Sales by Pizza Category
SELECT 
    pizza_category, SUM(total_price) as Total_Sales,
    SUM(total_price) * 100 / (SELECT 
            SUM(total_price)
        FROM
            pizza_sales) AS Percentage_Sales_per_Category
FROM
    pizza_sales
GROUP BY pizza_category;

-- 4.	Percentage of Sales by Pizza Size
SELECT 
    pizza_size, SUM(total_price) as Total_Sales,
   SUM(total_price) * 100 / (SELECT 
            SUM(total_price) 
        FROM
            pizza_sales) AS Percentage_Sales_per_Category
FROM
    pizza_sales
GROUP BY pizza_size;

-- 5.	Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as Total_qty_sold from pizza_sales group by pizza_category;

-- 6.	Top 5 Best Sellers by Revenue, Total Qty and Total Orders
-- By Revenue
select pizza_name, Sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue desc limit 5;
-- Total Qty
select pizza_name, Sum(quantity) as Total_Qty from pizza_sales group by pizza_name order by Total_Qty desc limit 5;
-- Total Orders
select pizza_name, count(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders desc limit 5;

-- 7.	Bottom 5 Worst Sellers by Revenue, Total Qty and Total Orders
-- By Revenue
select pizza_name, Sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue limit 5;
-- Total Qty
select pizza_name, Sum(quantity) as Total_Qty from pizza_sales group by pizza_name order by Total_Qty limit 5;
-- Total Orders
select pizza_name, count(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders  limit 5;


select * from pizza_sales;

;