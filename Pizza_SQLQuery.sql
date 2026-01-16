SELECT * FROM pizza_sales;

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--Avg order value
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) AS Avg_order_value
FROM pizza_sales;

--Total pizza sold
SELECT SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales;

--Total orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

--Avg pizzas per order
SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS Avg_pizzas_per_order
FROM pizza_sales;

--Daily Trend for Total orders
SELECT DATENAME(DW,order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

--Hourly Trend for Total orders
SELECT DATEPART(HOUR,order_time) AS Order_hour, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time);

--Percentage of Sales by Pizza category
SELECT pizza_category, SUM(total_price) AS Total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

--Percentage of Sales by Pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))AS Total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;

--Total pizzas sold by pizza category
SELECT pizza_category, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category;

--Top 5 Best Sellers by Total pizzas sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold DESC;

--Bottom 5 Worst Sellers by Total pizzas sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold ASC;