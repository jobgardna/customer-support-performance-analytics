-- Create the database
CREATE DATABASE IF NOT EXISTS customer_support_analytics;
USE customer_support_analytics;

-- Agents table
CREATE TABLE agents (
    agent_id VARCHAR(10) PRIMARY KEY,
    agent_name VARCHAR(100),
    team VARCHAR(50),
    hire_date DATE,
    shift VARCHAR(20)
);

-- Tickets table
CREATE TABLE tickets (
    ticket_id VARCHAR(15) PRIMARY KEY,
    customer_id VARCHAR(15),
    agent_id VARCHAR(10),
    channel VARCHAR(20),
    issue_category VARCHAR(50),
    created_date DATETIME,
    resolved_time DATETIME,
    repeat_flag BOOLEAN,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Customer Feedback table
CREATE TABLE customer_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id VARCHAR(15),
    csat_score INT,
    nps_score INT,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);
