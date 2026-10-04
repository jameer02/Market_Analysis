 Project Overview

project focuses on analyzing customer purchasing behavior and product performance using **MySQL and Power BI**.

The project combines multiple datasets related to orders, products, aisles, and departments to identify patterns in customer activity, product demand, reorder behavior, and order trends.

---

## 🎯 Project Objectives

- Analyze customer purchasing behavior
- Identify the most ordered products
- Analyze product distribution across departments and aisles
- Understand reorder patterns
- Identify peak ordering hours
- Analyze order volume by day of the week
- Understand order size and customer ordering patterns
- Create an interactive Power BI dashboard
- Generate meaningful business insights from the data

---

## 🗂️ Datasets

The project contains the following tables:

### 1. Aisles
Contains information about product aisles.

- `aisle_id`
- `aisle`

### 2. Departments
Contains department information.

- `department_id`
- `department`

### 3. Products
Contains product information.

- `product_id`
- `product_name`
- `aisle_id`
- `department_id`

### 4. Orders
Contains customer order information.

- `order_id`
- `user_id`
- `eval_set`
- `order_number`
- `order_dow`
- `order_hour_of_day`
- `days_since_prior_order`

### 5. Order Products Train
Contains products included in customer orders.

- `order_id`
- `product_id`
- `add_to_cart_order`
- `reordered`

---

## 🛠️ Tools & Technologies

- **MySQL** – Data querying and analysis
- **Power BI** – Dashboard creation and visualization
- **SQL** – Data manipulation, aggregation, filtering, and joins
- **DAX** – Power BI calculations

---

## 🔍 SQL Analysis

The project includes **20 SQL analysis questions**, covering:

1. Top 10 aisles with the highest number of products
2. Number of unique departments
3. Product distribution across departments
4. Products with the highest reorder rates
5. Number of unique users
6. Average days between orders
7. Peak hours of order placement
8. Order volume by day of the week
9. Top 10 most ordered products
10. Users who placed orders in each department
11. Average products per order
12. Most reordered products in each department
13. Products reordered more than once
14. Average products added to cart per order
15. Orders by hour of the day
16. Distribution of order sizes
17. Average reorder rate by aisle
18. Average order size by day of the week
19. Top 10 users by number of orders
20. Products belonging to each aisle and department

---

## 📊 Power BI Dashboard

The Power BI dashboard provides a visual overview of the market analysis.

### Key KPIs

- Total Users
- Total Orders
- Total Products
- Average Products per Order

### Main Visualizations

- 🛒 Top 10 Most Ordered Products
- 🏢 Products by Department
- 🕐 Orders by Hour of Day
- 🔄 Top 10 Aisles by Reorder Rate
- 📅 Orders by Day of Week

The dashboard helps identify important patterns in customer ordering behavior and product performance.

---

## 🔄 Data Analysis Process

```text
Raw Data
   ↓
MySQL Database
   ↓
Data Cleaning & Preparation
   ↓
SQL Queries & Aggregations
   ↓
Data Analysis
   ↓
Power BI
   ↓
Dashboard & Business Insights
