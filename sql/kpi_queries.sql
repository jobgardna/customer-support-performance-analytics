-- First Contact Resolution %
SELECT 
ROUND((SUM(CASE WHEN repeat_flag = 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS FCR_Percentage
FROM tickets;

-- Average Handle Time (in minutes)
SELECT 
ROUND(AVG(TIMESTAMPDIFF(MINUTE, created_date, resolved_time)), 2) AS Avg_Handle_Time
FROM tickets;

-- Repeat Contact Rate %
SELECT 
ROUND((SUM(repeat_flag) * 100.0) / COUNT(*), 2) AS Repeat_Rate
FROM tickets;

-- Total Tickets per Agent
SELECT 
agent_id,
COUNT(ticket_id) AS total_tickets
FROM tickets
GROUP BY agent_id;
