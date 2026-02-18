# Create database and import data in tables:

    CREATE DATABASE superstore_db;

    USE superstore_db;

    select count(*) from Clean_Superstore;

    EXEC sp_rename 'dbo.Clean_Superstore', 'orders'; 

    select top 5 * from orders;

    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'orders';

# 1: Total Sales, Profit, Quantity
    select 
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit), 2 ) as Total_Profit,
    sum(quantity) as Total_quatity
    from orders;

# 2: Category-wise Sales & Profit
    select
        Category,
        round(sum(Sales),2) as Total_Sales,
        round(sum(Profit),2) as Total_Profit
    from orders
    group by Category
    order by Total_Sales Desc;

# 3: Sub-Category Profit (Find Best & Worst)

    Select 
    Sub_Category,
    round(sum(sales),2) as Total_Sales,
    round (sum(Profit),2) as Total_Profit
    from orders
    group by Sub_Category
    order by Total_Profit Desc;

# 4: Region-wise Performance

    select 
    Region,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit),2) as Total_Profit
    from orders
    group by Region
    order by Total_Profit Desc;

# 5: Discount Impact on Profit

    select
    Discount,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit),2) as Total_Profit
    from orders
    group by Discount
    Order by Discount;

# 6: State-wise Sales & Profit (Top 10)

    Select top 10
    State,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit),2) asTotal_Profit
    from orders
    group by State
    order by Total_Sales desc;

# 7: State-wise Loss (Worst 10 States)

    select top 10
    State,
    round(sum(Profit),2) as Total_Profit
    from orders
    group by State
    order by Total_Profit;

# 8: Segment-wise Sales & Profit

    select Segment,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit), 2) as Total_Profit
    from orders
    group by Segment
    order by Total_Profit desc;

# 7: Ship Mode Performance

    select Ship_Mode,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit), 2) as Total_Profit
    from orders
    group by Ship_Mode
    order by Total_Sales desc;

# 8: Find Products with High Sales but Loss

    select Sub_Category,
    round(sum(Sales),2) as Total_Sales,
    round(sum(Profit),2) as Total_Profit
    from orders
    group by Sub_Category
    having sum(Profit) < 0
    order by Total_Sales desc;

# 9: Profit by Discount Level

    SELECT 
        Discount,
        ROUND(SUM(Sales),2) AS Total_Sales,
        ROUND(SUM(Profit),2) AS Total_Profit
    FROM orders
    GROUP BY Discount
    ORDER BY Discount;

# 10: Find Discount Levels Causing Loss

    SELECT 
        Discount,
        COUNT(*) AS Total_Orders,
        ROUND(SUM(Profit),2) AS Total_Profit
    FROM orders
    GROUP BY Discount
    HAVING SUM(Profit) < 0
    ORDER BY Discount;
 
# 11: Top Loss Products with High Discount
    SELECT TOP 10
        Sub_Category,
        Discount,
        ROUND(SUM(Sales),2) AS Total_Sales,
        ROUND(SUM(Profit),2) AS Total_Profit
    FROM orders
    GROUP BY Sub_Category, Discount
    HAVING SUM(Profit) < 0
    ORDER BY Total_Profit ASC;



