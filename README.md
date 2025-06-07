# bike-store-powerbi-dashboard
Welcome to the Bike Store Analytics Dashboard – a data-driven project that transforms raw bike rental data into powerful business insights using Microsoft SQL Server and Power BI.

📌 Project Overview
This project analyzes two years' worth of bike rental data to answer key business questions such as:

When are we making the most money?
How do seasons and times of day affect revenue?
What impact does pricing have on rider demand?
Who are our riders – casual or registered?
Using SQL for data extraction and transformation and Power BI for interactive data visualization, this dashboard uncovers meaningful patterns to support strategic decision-making.

💾 Tech Stack
Database: Microsoft SQL Server
Data Modeling & Queries: T-SQL (CTEs, joins, calculations)
Visualization: Microsoft Power BI
Data Analysis: DAX (Data Analysis Expressions)

📊 Key Insights
💸 Revenue Peaks: Highest earnings occur at 5 PM and 6 PM, aligning with post-work hours.
📈 Pricing Strategy: A 25% price increase led to a 64% surge in rider demand — showing elasticity in rider behavior.
📅 Seasonal Trends: Season 3 (likely summer) generated the highest revenue.
👥 Rider Demographic: Over 81% of users are registered riders, but casual users account for significant daily fluctuations.
⏰ Profitability by Hour: Midday to early evening (10 AM – 3 PM) are the most profitable hours.

🧠 Skills Demonstrated
✅ SQL querying (data transformation using CTEs, UNION, calculated columns)
✅ DAX (custom KPIs and measures)
✅ Power BI dashboard design (clean UI with slicers, cards, and visuals)
✅ Business storytelling with data

![image](https://github.com/user-attachments/assets/23c5f208-0abf-4810-b8ff-ab95e3b7a32c)
![image](https://github.com/user-attachments/assets/c80a34d5-ad86-4430-b7ca-e75dbe95087a)


▶️ To connect the Power BI dashboard to your SQL Server:

Go to Get Data > SQL Server, enter your Server Name and Database Name, then expand the Advanced options, and paste the following SQL query:

WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)

SELECT
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    riders * price AS revenue,
    riders * price - COGS AS profit
FROM cte a
LEFT JOIN cost_table b
    ON a.yr = b.yr
