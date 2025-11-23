/*

Business Problem Statement 

*The online bookstore is struggling with three core issues:
-Poor visibility into inventory health, leading to stockouts of high-demand books and overstocking of low-demand ones.
-Limited understanding of customer purchasing behavior, which makes it difficult to identify loyal customers, 
-high-value buyers, or customers who frequently buy specific genres.
-No centralized system to monitor sales performance, revenue generation, frequently ordered books, or author-wise contribution.

*To solve these gaps, the bookstore needs a structured SQL-based analytical system that can:
-Track stock levels, identify the lowest-stock items, and calculate remaining stock after fulfilling orders.
-Analyze sales by genre, author, order frequency, and price to understand buying patterns.
-Identify revenue trends, high-spending customers, and orders exceeding certain thresholds.
-Provide insights into high-performing books, most expensive books, and average prices across genres.
-The objective of this project is to build an SQL-driven analytical model that delivers operational clarity,
-inventory optimization, and data-driven decision-making for the online bookstore.

*/

--Create Database
CREATE DATABASE OnlineBookstore;
use OnlineBookStore

--Create Books Table 
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

--Create Customer Table 
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

--Create Orders table 
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

--Import Data to Books Table 
BULK INSERT Books
FROM 'C:\Users\vishw\OneDrive\Desktop\E-Commerce SQL Project\Books.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--Import Data to Customer Table 
BULK INSERT Customers
FROM 'C:\Users\vishw\OneDrive\Desktop\E-Commerce SQL Project\Customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

--Import Data to Orders table 
BULK INSERT Orders
FROM 'C:\Users\vishw\OneDrive\Desktop\E-Commerce SQL Project\Orders.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

select * from Books
select * from Customers
select * from Orders

--1)Retrieve all books in the "Fiction" genre 
select * from Books
where Genre='Fiction'

--2)Find the books published atfer the year 1950.
select * from Books
where Published_Year > 1950
order by Published_Year

--3)List all customers from the canada
select * from Customers
where Country = 'Canada'

--4)Show order placed in november 2023.
select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30'

--5)Retrieve the total stock of books available.
select sum(Stock) 
as Total_Stock
from books

--6)Find the details of the most expensive book
select top 1 * 
from Books 
Order by Price Desc 

--7)Show alll Customer who orders more than 1 quamtity of book
select * from Orders
where Quantity > 1

--8)Retrieve all orders where the total amount exceeds $20
select * from Orders
where Total_Amount >= 20
order by Total_Amount 

--9)List All teh genre available in the books table.
select distinct genre from Books

--10)Find the book with lowest stock
select Top 5 * from books
order by Stock 

--11) Calculated the total revenue generated from all orders 
select sum(Total_Amount) as revenue from Orders

--Advanced Queries

--1) Retriev the total number of books sold for each genre: 
select b.genre , sum(o.quantity) Total_Books_Sold
from orders o join Books b 
on o.Book_ID = b.Book_ID
group by b.Genre

--2)Find the average price of books in the "Fantasy genre".
select avg(price) as Average_Price_of_fantasy_genre
from books 
where genre = 'Fantasy'

--3)List all Customers who have placed atleast 2 orders.
select c.Customer_ID, c.Name,count(o.Order_ID) as count_of_orders from Customers c join Orders o 
on c.Customer_ID = o.Customer_ID
group by c.Customer_ID, c.Name
having count(o.Order_ID) >= 2

--4)Find the most frequently orderd book.
select Top 6 o.Book_id,count(o.order_id) as Order_count,b.Title from Orders o
join Books b on o.Book_ID=b.Book_ID
group by o.Book_ID,b.Title
order by Order_count desc

--5)Select teh top 3 most expensive books of 'Fantasy Genre'.
select Top 3 Book_id,title,genre,Price from books 
where genre = 'Fantasy'
order by price desc

--6)Retrieve the total quantity of books sold by each author.
select b.author, sum(o.quantity) as Total_Book_Sold 
from orders o inner join books b on o.Book_ID = b.Book_ID
group by B.Author

--7)List the cities where customers who spent over $30 are located 
select distinct c.city,o.Total_Amount
from orders o 
join Customers c ON o.customer_id = c.customer_id
where o.Total_Amount > 30

--8)Find the Customer who have spent most on orders.
SELECT c.Name,c.Customer_ID, sum(o.Total_Amount) as Total_Spent
from orders o inner join Customers c on o.Customer_ID=c.Customer_ID
group by c.Customer_ID,c.Name
order by Total_Spent desc

--9)Calculate the stock remaining after fulfilling all orders:
select b.book_id,b.title,b.stock, coalesce(sum(o.quantity),0) as Order_quantity,
b.stock - coalesce(sum(o.quantity),0) as Remaining_Quantity
From books b
LEFT Join orders o on b.Book_ID = o.Book_ID
group by b.book_ID,b.Title,b.Stock
order by Remaining_Quantity desc

--11)Rank customers by total spending.
select Customer_id,
       sum(Total_Amount) as Total_Spent,
       rank() over (order by sum(Total_Amount) DESC) AS Spending_Rank
from orders
group by Customer_ID

--12)What are the top 3 best-selling books.
WITH BookSales AS (
    SELECT 
        Book_ID,
        SUM(Quantity) AS Total_Sold,
        RANK() OVER (ORDER BY SUM(Quantity) DESC) AS Sales_Rank
    FROM Orders
    GROUP BY Book_ID
)
SELECT * 
FROM BookSales
WHERE Sales_Rank <= 3;


select * from books
select * from orders 
select * from Customers