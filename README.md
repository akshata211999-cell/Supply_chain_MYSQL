# Supply Chain Data Analysis Using SQL
## 📌 Project Overview
This project focuses on analyzing supply chain data using **MySQL**. The goal is to extract meaningful business insights related to orders, products, suppliers, regions, delivery performance, inventory, and OTIF performance.
The project uses SQL queries to perform data analysis using filtering, aggregation, grouping, joins, window functions, and other SQL concepts.
---
## 🎯 Business Objectives
The main objectives of this project are:
* Analyze total orders and ordered quantities.
* Analyze delivery performance and delay days.
* Calculate OTIF performance.
* Identify regions with high OTIF performance.
* Find products with high ordered and delivered quantities.
* Analyze supplier performance.
* Calculate total sales value using ordered quantity and unit price.
* Analyze inventory stock levels.
* Compare products, suppliers, and product categories.
---
## 🛠️ Tools Used
* **MySQL**
* **MySQL Workbench**
* **GitHub**
---
## 📂 Dataset Structure
The project contains two main tables:
### 1. `supply_chain`
This table contains order and delivery-related information.
Example columns include:
* OrderID
* ProductID
* Region
* OrderedQty
* DeliveredQty
* DelayDays
* TransportMode
* InventoryStock
* OTIF
### 2. `dim_material`
This table contains product and supplier information.
Example columns include:
* ProductID
* Product
* Supplier
* Product Category
* Unit Price
The two tables are connected using the **ProductID** column.
---
## 🔍 Key SQL Analysis
The project includes analysis such as:
### Order Analysis
* Find the total number of orders.
* Find total ordered quantity.
* Find total delivered quantity.
* Find orders from a specific region.
* Find orders where delivered quantity is less than ordered quantity.
### Delivery Analysis
* Calculate average delay days.
* Find orders with delays greater than a specific number of days.
* Analyze transport modes.
### OTIF Analysis
* Calculate OTIF percentage.
* Find the region with the highest OTIF percentage.
### Product Analysis
* Find total ordered quantity by product.
* Find products with the highest ordered quantity.
* Find total delivered quantity by product.
* Find top products based on order quantity.
### Supplier Analysis
* Find the total number of orders for each supplier.
* Find suppliers with the highest number of orders.
* Calculate total sales value for each supplier.
### Regional Analysis
* Find total ordered quantity by region.
* Find regions with more than a specified number of orders.
* Find regions with high inventory stock.
* Find the region with the highest OTIF percentage.
---
## 🔗 SQL Concepts Used
This project demonstrates the following SQL concepts:
* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* Aggregate Functions
  * `SUM()`
  * `COUNT()`
  * `AVG()`
  * `MIN()`
  * `MAX()`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `UNION`
* `LIMIT`
---
## 📁 Project Structure
```text
Supply-Chain-SQL-Analysis/
│
├── Supply Chain.sql
└── README.md
```
---
## ▶️ How to Run the Project

1. Install **MySQL** and **MySQL Workbench**.
2. Open MySQL Workbench.
3. Create a database.
```sql
CREATE DATABASE SC;
```
4. Select the database.
```sql
USE SC;
```
5. Import or create the required tables:

```text
supply_chain
dim_material
```
6. Open the `https://github.com/akshata211999-cell/Supply_chain_MYSQL/blob/main/Supply%20Chain.sql` file.
7. Run the SQL queries to perform the analysis.
---
## 📊 Example Business Insight
One of the analyses calculates the **OTIF (On Time In Full) percentage** for each region.
```sql
**SELECT Region,
       100 * SUM(OTIF) / COUNT(*) AS OTIF_Percentage
FROM supply_chain
GROUP BY Region
ORDER BY OTIF_Percentage DESC;**
```
This helps identify which region has better delivery performance.
---
## 📈 Key Learnings
Through this project, I practiced:
* Writing SQL queries for business analysis.
* Working with multiple tables.
* Using different types of joins.
* Performing aggregations and grouping.
* Calculating business metrics such as OTIF percentage.
* Analyzing product, supplier, region, and delivery performance.
* Converting raw supply chain data into meaningful insights.
---
## 👩‍💻 Author
**Akshata Pattar**
Aspiring Data Analyst | SQL | Excel | Power BI | Python
---

