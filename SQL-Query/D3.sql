SELECT 
COUNT(email_id) AS Email_sent,
SUM(CASE WHEN opened = 't' THEN 1 ELSE 0 END) AS Opened,
SUM(CASE WHEN clicked = 't' THEN 1 ELSE 0 END) AS Clicked,
SUM(CASE WHEN bounced = 't' THEN 1 ELSE 0 END) AS Bounced,
SUM(CASE WHEN opened = 't' THEN 1 ELSE 0 END) / COUNT(email_id) AS Open_Rate,
SUM(CASE WHEN clicked ='t' THEN 1 ELSE 0 END) / (COUNT(email_id) - SUM(CASE WHEN bounced = 't' THEN 1 ELSE 0 END)) AS Click_Rate
FROM emails
WHERE sent_date BETWEEN '2016-08-10' AND '2016-10-31' 
;