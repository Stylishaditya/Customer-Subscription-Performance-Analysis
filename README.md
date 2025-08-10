# 📊 Customer Insights and Revenue Optimization Analysis

## 📌 Project Overview
This project uses **SQL**  to analyzes customer, usage, payment, and support ticket data for a subscription-based business.The aim is to answer key business questions that provide insights into customer behavior, revenue trends, platform performance, and support efficiency.

---

## 🎯 Objective

- Understand Customer Demographics
- Track Revenue Trends
- Measure Engagement
- Analyze Payment Performance
- Improve Customer Support

---

## 🗂 Dataset
The analysis is based on three main tables:

1. **customers.csv** – Customer details including signup date, location, age, subscription type, and signup channel.
2. **usage.csv** – Platform usage data including activity date, minutes used, device, content category, and platform.
3. **payments.csv** – Payment transactions with details like payment amount, status, date, and method.
4. **support_tickets.csv** – Customer support ticket details including issue type, resolution time, and outcome.

---

## 🎯 Business Questions Addressed
1. What is the average age of customers by subscription type and location?
2. Which signup channel brings in the most Premium subscribers?
3. How many customers have been active for more than 6 months since signup?
4. What percentage of customers from each location are Premium users?
5. Which content category has the highest total minutes watched per month?
6. Do Premium subscribers use the platform for more minutes on average than Basic ones?
7. Is there a seasonal trend in average daily usage minutes?
8. What is the total revenue per month by payment method?
9. Which subscription type contributes the most to revenue?
10. What is the payment failure rate by payment method?
11. Are Premium subscribers more likely to have successful payments than Basic ones?
12. Which issue type has the longest average resolution time?
13. How many customers opened more than one support ticket in the last 6 months?
14. Which top 3 platforms (Netflix, Spotify, Disney+, etc.) generate the most revenue?
15. How many new customers join each year by platform?

---

## 📊 Findings & Conclusion

- Premium users are younger and show higher engagement compared to Basic users.
- Netflix, Spotify, and Disney+ are the top revenue-generating platforms.
- Premium subscriptions drive most of the revenue, especially via Wallet and NetBanking.
- NetBanking has a higher payment failure rate, indicating a need for improvement.
- Content Requests take the longest to resolve, affecting customer satisfaction.

---

## 🛠 SQL Techniques Used
- **Joins** (INNER JOIN, LEFT JOIN)  
- **Aggregation** (`COUNT`, `AVG`, `SUM`, `ROUND`)  
- **Date Functions** (`YEAR()`, `MONTHNAME()`, `DATE_SUB()`)  
- **Window Functions** (`RANK() OVER`, `PARTITION BY`)  
- **Grouping & Ordering** (`GROUP BY`, `ORDER BY`)  
- **Filtering** (`WHERE`, `HAVING`)

---

## 🚀 How to Use
1. Import the datasets into MySQL.
2. Run the SQL queries provided in the `/queries` folder to answer each business question.
3. Analyze the output to generate actionable insights.

---

💡 *Author: Tulsidas Telange*
