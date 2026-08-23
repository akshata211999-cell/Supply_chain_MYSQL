create database SC;
use SC;
select * from supply_chain;
select * from dim_material;

alter table supply_chain
rename column ï»¿OrderID  To OrderID;

alter table dim_material
rename column ï»¿ProductID To ProductID;

#Find total orders by region.
select count(OrderID) AS Total_Orders
from supply_chain;

#Find average delay days by region.
select Region, avg(DelayDays) AS Avg_delayday
from supply_chain
group by Region;

#Find total ordered quantity by product.
select d.Product, 
sum(s.OrderedQty) AS Total_ordered_quantity
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product
order by Total_ordered_quantity desc;
#order by desc;

#JOIN the two tables and display Product, Supplier and OrderedQty.
select d.Product, d.Supplier, s.OrderedQty
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID;

#Find total sales value by product.
select d.Product,
sum(s.OrderedQty * d.`Unit Price`) AS Total_sales_value
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product
order by Total_sales_value desc;

#Find which supplier has the highest number of orders.
select d.Supplier, count(s.OrderID) AS Total_Orders
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Supplier 
order by Total_orders desc;

#Calculate OTIF percentage.
select OTIF, 100*sum(OTIF) /sum(sum(OTIF)) over() AS perc
from supply_chain
group by OTIF;

#Find which region has the highest OTIF percentage. #doubt
select Region, 100*sum(OTIF) / count(*) AS Highest_Percentage_OTIF
from supply_chain
group by Region
order by Highest_Percentage_OTIF desc
limit 1;

#Find the product with the highest ordered quantity.
select d.Product
, max(s.OrderedQty) AS highest_order_quantity
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product 
order by highest_order_quantity desc
limit 1;
#Find the top 3 products based on total ordered quantity using a window function.#doubt 

#Display all orders from the North region.
select orderID
from supply_chain
where Region = 'North';	

#Find all orders where DelayDays is greater than 2.
select orderID,count(*) AS Total_order
from supply_chain 
where DelayDays > 2
group by  OrderID;

#Find all orders where OrderedQty is greater than 50.
select OrderedQty
from supply_chain
where OrderedQty > 50;

#Display orders transported by Truck.
select TransportMode
from supply_chain
where TransportMode = 'Truck';

#Find orders where DeliveredQty is less than OrderedQty.
select  DeliveredQty , OrderedQty
from supply_chain 
where DeliveredQty < OrderedQty;

#Find orders where OTIF = 0 and DelayDays > 0.
select OTIF,DelayDays
from supply_chain
where OTIF = 0 and DelayDays > 0;

#Find the total number of orders.
select count(OrderID) AS Total_number_Orders
from supply_chain;

#Find the total quantity ordered.
select sum(OrderedQty) AS Total_quantity 
from supply_chain;

#Find the total quantity delivered.
select count(DeliveredQty) AS Total_Delivered
from supply_chain;

#Find the average delay days.
select avg(DelayDays) AS Average_delay_days
from supply_chain;

#Find the minimum inventory stock.
select min(InventoryStock) Minimum_inventory
from supply_chain;

#Find the average ordered quantity.
select avg(OrderedQty) AS Average_ordered_QTY
from supply_chain;

#Find the total ordered quantity by region.
select Region, Sum(OrderedQty) AS Total_ordered
from supply_chain
group by Region;

#Find regions having more than 20 orders.
select Region, count(OrderID) AS Total_Orders
from supply_chain
group by Region
having count(OrderID) > 20;

#Find transport modes having an average delay greater than 2 days.
select TransportMode, avg(DeliveredQty) AS Average_deay
from supply_chain
group by TransportMode
having avg(DeliveredQty) > 2;

#Find regions where total ordered quantity is greater than 500.
select Region, sum(OrderedQty) AS Total_OrderedQty
from supply_chain
group by Region
having sum(OrderedQty) > 500;

#Find regions where average inventory stock is greater than 100.
select Region, avg(InventoryStock) AS Average_stock
from supply_chain
group by Region
having avg(InventoryStock) > 100;

#JOINS
#Find the total ordered quantity for each product.
select d.Product, sum(OrderedQty) AS Total_ordered
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product;

#Find the total sales value for each supplier.
select d.Supplier, sum(s.OrderedQty * d.`Unit Price`) AS Total_sales
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID 
group by d.Supplier;

#Find the average unit price by product category.
select d.`Product Category`,avg(`Unit Price`) AS Average_UnitPrice
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.`Product Category`;

#Find the number of orders for each product category.
select d.`Product Category`, Count(OrderID) AS Total_Orders
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.`Product Category`;

#Find the product with the highest total ordered quantity.
select d.Product, sum(OrderedQty) AS Total_OrderedQty
from supply_chain s
join dim_material d
on s.ProductId = d.ProductID
group by d.Product;

#Find the product with the highest total delivered quantity.
select d.Product, sum(DeliveredQty) Total_DeliveredQTY
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID 
group by d.Product; 

#Find the total delivered quantity for each product.
select d.Product, sum(DeliveredQty) AS Total_DeliverQty
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product;

#Find the average delay days for each product.
select d.Product, avg(DelayDays) AS Average_delay
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product;

#Find the total number of orders for each supplier.
select d.Supplier, count(OrderID) AS Total_Orders
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Supplier;

#Find the product name and total ordered quantity for each product.
select d.Product, sum( s.OrderedQty) AS Total_orderedQty
from supply_chain s
join dim_material d
on s.ProductID = d.ProductID
group by d.Product;

#Using an INNER JOIN, display Product, Supplier, and OrderedQty.
select d.Product,d.Supplier, s.OrderedQty
from supply_chain s
inner join dim_material d
on s.ProductID =d.ProductID;

#Using an INNER JOIN, display OrderID, Product, Product Category, and DeliveredQty.
select s.OrderID, d.Product, d.Product Category, s.DeliveredQty
from supply_chain s
inner join dim_material d
on s.ProductID = d.ProductID;

#Find the total ordered quantity for each product using an INNER JOIN.
select d.Product, sum(s.OrderedQty) AS Total_OrderedQty
from supply_chain s
inner join dim_material d
on s.ProductID = d.ProductID
group by d.Product;

#Find the total ordered quantity for each supplier.
select d.Supplier, sum(s.OrderedQty) As Total_OrderedQty
from supply_chain s
inner join dim_material d
on s.ProductID = d.ProductID
group by d.Supplier;

#Find the total sales value for each product, using:
#OrderedQty × Unit Price.
select d.Product, sum(s.OrderedQty * d.`Unit Price`)  AS Total_sales
from supply_chain s
inner join dim_material d
on  s.ProductID = d.ProductID
group by d.Product;

#Find the total sales value for each supplier.
select d.Supplier, sum(s.OrderedQty * d.`Unit Price`) AS Total_sales
from supply_chain s
inner join dim_material d
on s.ProductID = d.ProductID
group by d.Supplier;

#Find the average unit price for each product category using an INNER JOIN.
select d.`Product Category`,avg(d.`Unit Price`) AS Average_Price
from supply_chain s
inner join dim_material d
on s.ProductID = d.ProductID
group by d.`Product Category`;

#Using a LEFT JOIN, display all orders along with Product and Supplier.
select s.OrderID, d.Product,d.Supplier
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID;

#Display all orders, even if a matching ProductID does not exist in dim_material.
select s.OrderID, 
s.ProductID , 
d.Product, 
d.Supplier,
s.OrderedQty 
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID;

#Find orders where Product information is missing after performing a LEFT JOIN.
select s.OrderID,
s.ProductID ,
d.Product,
d.Supplier,
s.OrderedQty 
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID 
where d.Product is null ;

#Display all orders with:OrderID,Product,Supplier,OrderedQty,DeliveredQty
select s.OrderID, 
d.Product,
d.Supplier,
s.OrderedQty, 
s.DeliveredQty
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID; 

#Find the total ordered quantity by supplier using a LEFT JOIN.
select d.Supplier,sum(s.OrderedQty) Total_OrderedQty
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID
group by d.Supplier;

#Find products with no matching orders using a LEFT JOIN.
select 
d.ProductID,
d.Product,
d.Supplier
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID;

#Using a RIGHT JOIN, display all products and their corresponding orders.
select d.ProductID,
    d.Product,
    d.Supplier,
    s.OrderID,
    s.OrderedQty,
    s.DeliveredQty
from supply_chain s
right join dim_material d
on s.ProductID = d.ProductID;

#Display all products from dim_material, even if they have no orders.
SELECT 
    d.ProductID,
    d.Product,
    d.Supplier,
    s.OrderID,
    s.OrderedQty
FROM dim_material d
RIGHT JOIN supply_chain s
ON d.ProductID = s.ProductID;

#Find the number of orders for every supplier, including suppliers with zero orders.
SELECT d.Supplier,COUNT(s.OrderID) AS Total_Orders
FROM dim_material d
RIGHT JOIN supply_chain s
ON d.ProductID = s.ProductID
GROUP BY d.Supplier
ORDER BY Total_Orders DESC;

#UNION
#Display all orders with:OrderID,Product,Supplier,OrderedQty,DeliveredQty
select s.OrderID, 
d.Product,
d.Supplier,
s.OrderedQty, 
s.DeliveredQty
from supply_chain s
left join dim_material d
on s.ProductID = d.ProductID

union

#Display all products from dim_material, even if they have no orders.
SELECT 
    d.ProductID,
    d.Product,
    d.Supplier,
    s.OrderID,
    s.OrderedQty
FROM dim_material d
RIGHT JOIN supply_chain s
ON d.ProductID = s.ProductID;




















