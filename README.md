# 📚 Online Book Store Analysis

## 📄 Project Overview
This project focuses on building an **SQL-based analytical system** for an online bookstore. The goal is to address core business challenges such as poor inventory visibility, limited customer insights, and the lack of a centralized sales monitoring system. By analyzing sales data, customer behavior, and inventory levels, this project provides actionable recommendations to optimize operations and boost revenue.

## 💾 Dataset
The analysis utilizes a relational database consisting of three main tables, each containing **500 records**:

* **`Books.csv`**: Contains details about the book inventory.
    * *Columns:* `Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`.
* **`Customers.csv`**: Contains customer demographic information.
    * *Columns:* `Customer_ID`, `Name`, `Email`, `Phone`, 'City', `Country`.
* **`Orders.csv`**: Records transactional data for book purchases.
    * *Columns:* `Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, `Total_Amount`.

## 🛠️ Tech Stack
* **Database:** SQL (MS SQL Server)
* **Analysis:** SQL Queries (Aggregations, Joins, Window Functions, CTEs)
* **Reporting:** PowerPoint, PDF

## 📊 Key Analysis & Queries
The project involves **30+ SQL queries** ranging from basic data retrieval to advanced analytics. Key areas of analysis include:

1.  **Inventory Management:**
    * Calculated remaining stock levels after fulfilling orders.
    * Identified books with low stock to prevent stockouts.
2.  **Sales Performance:**
    * Analyzed total revenue and monthly revenue trends.
    * Identified the top-selling genres (Mystery & Science Fiction) and authors.
    * Ranked books by revenue within each genre.
3.  **Customer Insights:**
    * Calculated **Customer Lifetime Value (CLV)** to identify high-value clients.
    * Found customers with consecutive monthly purchases to track loyalty.
    * Segmented customers based on spending habits and location.

## 💡 Key Findings
* **Top Genres:** **Mystery** and **Science Fiction** are the best-performing genres in terms of sales volume.
* **Inventory Issues:** Analysis revealed several books with **negative remaining stock**, indicating urgent restocking needs or data discrepancies.
* **Revenue Trends:** Sales revenue shows consistent growth with predictable peaks between January and September.
* **High-Value Customers:** Identified top customers (e.g., Kim Turner, Jonathon Strickland) contributing significantly to total revenue.

## 🚀 Business Recommendations
1.  **Optimize Inventory:** Stop overstocking slow-moving genres and reallocate budget to high-demand genres like Mystery and Sci-Fi.
2.  **Loyalty Program:** Target high-CLV customers with exclusive offers to maintain retention.
3.  **Dynamic Pricing:** Consider bundling low-stock or slow-moving books with bestsellers to clear inventory.
4.  **Stock Monitoring:** Implement an automated alert system for books falling below a critical stock threshold (e.g., < 10 units).

## 📝 How to Run
1.  **Set up the Database:**
    * Create a new database named `OnlineBookStore`.
    * Import the CSV files (`Books.csv`, `Customers.csv`, `Orders.csv`) into their respective tables.
2.  **Run the Analysis:**
    * Open `Online_Book_Store.sql` in your SQL client.
    * Execute the queries to reproduce the analysis and insights.
3.  **View Reports:**
    * Check `ONLINE BOOK STORE ANALYSIS.pdf` or `Online-Bookstore-Analysis.pptx` for a visual summary of the findings.

---
*Created by [Nikhil Vishwakarma]*
