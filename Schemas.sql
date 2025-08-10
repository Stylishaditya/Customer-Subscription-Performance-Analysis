create database submind;
use submind;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    signup_date DATE,
    location VARCHAR(50),
    age VARCHAR(10),
    subscription_type VARCHAR(20),
    signup_channel VARCHAR(50)
);

CREATE TABLE payments (
    payment_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE support (
    ticket_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    ticket_date DATE,
    issue_type VARCHAR(50),
    resolution_time_hours DECIMAL(10,2),
    resolved varchar(50),
    outcome VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE usagedata (
    usage_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    activity_date DATE,
    minutes_used INT,
    device VARCHAR(20),
    content_category VARCHAR(50),
    platform VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);