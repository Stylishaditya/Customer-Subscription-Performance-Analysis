-- 1.What is the average age of customers by subscription type and location?
select subscription_type, location, round(avg(age),0) as average_age_customers
from customers
group by subscription_type, location
order by subscription_type, location;

-- 2.Which signup channel brings in the most Premium subscribers?
select signup_channel, count(subscription_type) as premium_subscribers
from customers
where subscription_type = 'Premium'
group by signup_channel
order by premium_subscribers desc
limit 1;

-- 3.How many customers have been active for more than 6 months since signup?
select count(distinct c.customer_id) as customers_active_morethan_6months
from customers c
join usagedata u
on c.customer_id = u.customer_id
WHERE TIMESTAMPDIFF(MONTH, c.signup_date, u.activity_date) > 6;

-- 4.What percentage of customers from each location are Premium users?
select location,
ROUND((SUM(CASE WHEN subscription_type = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(customer_id),2) as Premium_users_percentage
from customers
group by location;

-- 5.Which content category has the highest total minutes watched per month?
SELECT year, month_name, content_category, total_minutes_watched
FROM (
    SELECT
		YEAR(activity_date) AS year,
        MONTHNAME(activity_date) AS month_name,
        content_category,
        SUM(minutes_used) AS total_minutes_watched,
        RANK() OVER (PARTITION BY MONTHNAME(activity_date) ORDER BY SUM(minutes_used) DESC) AS rnk
    FROM usagedata
    GROUP BY YEAR(activity_date),MONTHNAME(activity_date), content_category
) ranked
WHERE rnk = 1
order by total_minutes_watched desc;

-- 6.Do Premium subscribers use the platform for more minutes on average than Basic ones?
SELECT 
    MAX(CASE WHEN subscription_type = 'Premium' THEN avg_minutes END) AS premium_avg_minutes,
    MAX(CASE WHEN subscription_type = 'Basic' THEN avg_minutes END) AS basic_avg_minutes
FROM (
    SELECT subscription_type, round(AVG(minutes_used),2) AS avg_minutes
    FROM customers c
    JOIN usagedata u ON c.customer_id = u.customer_id
    GROUP BY subscription_type
) t;

-- 7.Is there a seasonal trend in average daily usage minutes?
select YEAR(activity_date) AS year,
MONTHNAME(activity_date) AS month_name,
ROUND(AVG(minutes_used), 2) AS avg_daily_minutes
from usagedata
group by YEAR(activity_date), MONTHNAME(activity_date)
order by year, month_name;

-- 8.What is the total revenue per month by payment method?
select payment_method,
YEAR(payment_date) AS year,
MONTHNAME(payment_date) AS month_name,
sum(amount) as total_revenue
from payments
group by payment_method, YEAR(payment_date), MONTHNAME(payment_date)
order by year, month_name;

-- 9.Which subscription type contributes the most to revenue?
select c.subscription_type, sum(p.amount) as total_revenue
from payments p
join customers c
on p.customer_id = c.customer_id
group by c.subscription_type
order by total_revenue desc
limit 1;

-- 10.What is the payment failure rate by payment method?
select payment_method , 
ROUND((COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) * 100.0) 
/ COUNT(*), 2) AS failure_rate_percent
from payments
group by payment_method;

-- 11.Are Premium subscribers more likely to have successful payments than Basic ones?
select c.subscription_type , 
ROUND((COUNT(CASE WHEN p.payment_status = 'Success' THEN 1 END) * 100.0) 
/ COUNT(*), 2) AS success_rate_percent
from payments p
join customers c
on p.customer_id = c.customer_id
group by c.subscription_type;

-- 12.Which issue type has the longest average resolution time?
select issue_type, round(avg(resolution_time_hours),2) as longest_average_resolution_time
from support
group by issue_type
order by longest_average_resolution_time desc
limit 1;

-- 13.How many customers opened more than one support ticket in the last 6 months?
SELECT COUNT(*) AS customers
FROM (
    SELECT customer_id
    FROM support
	WHERE ticket_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY customer_id
    HAVING COUNT(ticket_id) > 1
) AS sub
;

-- 14.Which top 3 platform (Netflix, Spotify, Disney+, etc.) generates the most revenue?
select u.platform, sum(p.amount) as total_revenue
from payments p
join usagedata u
on p.customer_id = u.customer_id
group by u.platform
order by total_revenue desc
limit 5;

-- 15.How many new customers join each year by platform?
select u.platform as platform_type,
year(c.signup_date) as year,
COUNT(DISTINCT c.customer_id) AS new_customers
from customers c
join usagedata u
on u.customer_id = c.customer_id
group by u.platform, year(c.signup_date)
order by year, new_customers desc;
