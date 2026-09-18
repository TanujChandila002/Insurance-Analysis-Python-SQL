-- Insurance SQL Analysis Project
-- Database: insurance_db
-- Table: insurance_customers
-- Cleaned dataset: 1337 records

USE InsuranceDB;


CREATE TABLE insurance_customers
(
    customer_id INT PRIMARY KEY,
    age INT,
    sex VARCHAR(10),
    bmi DECIMAL(5,2),
    children INT,
    smoker VARCHAR(5),
    region VARCHAR(20),
    charges DECIMAL(12,2),
    age_group VARCHAR(10),
    family_size INT,
    smoker_flag TINYINT
);


SHOW TABLES;

-- Check the Table Structure
DESCRIBE insurance_customers;


-- Q1. Total customers
SELECT COUNT(*) AS total_customers
FROM insurance_customers;

-- Q2. Average insurance charge
SELECT AVG(charges) AS average_charge
FROM insurance_customers;

-- Q3. Total insurance charges
SELECT SUM(charges) AS total_charges
FROM insurance_customers;

-- Q4. Top 10 customers with highest charges
SELECT customer_id, age, sex, smoker, region, charges
FROM insurance_customers
ORDER BY charges DESC
LIMIT 10;

-- Q5. Number of customers in each region
SELECT region, COUNT(*) AS customer_count
FROM insurance_customers
GROUP BY region
ORDER BY customer_count DESC;

-- Q6. Average charge for each region
SELECT region, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY region
ORDER BY average_charge DESC;

-- Q7. Average charge: smokers vs non-smokers
SELECT smoker, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY smoker
ORDER BY average_charge DESC;

-- Q8. Regions with average charge greater than 10,000
SELECT region, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY region
HAVING AVG(charges) > 10000;

-- Q9. Percentage of customers who are smokers
SELECT ROUND(
    SUM(CASE WHEN smoker = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
) AS smoker_percentage
FROM insurance_customers;

-- Q10. Average charge by gender
SELECT sex, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY sex
ORDER BY average_charge DESC;

-- Q11. Customers with charges above overall average
SELECT customer_id, age, sex, smoker, region, charges
FROM insurance_customers
WHERE charges > (
    SELECT AVG(charges)
    FROM insurance_customers
)
ORDER BY charges DESC;

-- Q12. Customer(s) with the highest charge
SELECT customer_id, age, sex, smoker, region, charges
FROM insurance_customers
WHERE charges = (
    SELECT MAX(charges)
    FROM insurance_customers
);

-- Q13. Categorize charges as Low, Medium, High
SELECT
    customer_id,
    age,
    smoker,
    charges,
    CASE
        WHEN charges < 5000 THEN 'Low'
        WHEN charges < 15000 THEN 'Medium'
        ELSE 'High'
    END AS charge_category
FROM insurance_customers;

-- Q13B. Count customers in each charge category
SELECT
    CASE
        WHEN charges < 5000 THEN 'Low'
        WHEN charges < 15000 THEN 'Medium'
        ELSE 'High'
    END AS charge_category,
    COUNT(*) AS customer_count
FROM insurance_customers
GROUP BY charge_category
ORDER BY customer_count DESC;

-- Q14. Number of customers in each age group
SELECT age_group, COUNT(*) AS customer_count
FROM insurance_customers
GROUP BY age_group
ORDER BY customer_count DESC;

-- Q15. Average charge for each age group
SELECT age_group, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY age_group
ORDER BY average_charge DESC;

-- Q16. Average charge by number of children
SELECT children, AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY children
ORDER BY children;

-- Q17. Average charge by region and smoking status
SELECT
    region,
    smoker,
    COUNT(*) AS customer_count,
    AVG(charges) AS average_charge
FROM insurance_customers
GROUP BY region, smoker
ORDER BY average_charge DESC;

-- Q18. Rank customers by insurance charges
SELECT
    customer_id,
    age,
    sex,
    smoker,
    region,
    charges,
    RANK() OVER (ORDER BY charges DESC) AS charge_rank
FROM insurance_customers;

-- Q19. Top 3 highest-charge customers from each region
WITH ranked_customers AS
(
    SELECT
        customer_id,
        age,
        sex,
        smoker,
        region,
        charges,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY charges DESC
        ) AS region_rank
    FROM insurance_customers
)
SELECT
    customer_id,
    age,
    sex,
    smoker,
    region,
    charges,
    region_rank
FROM ranked_customers
WHERE region_rank <= 3
ORDER BY region, region_rank;

-- Business insights to discuss:
-- 1. Total customer count and total charges
-- 2. Regional customer distribution and average charges
-- 3. Smoker vs non-smoker charge comparison
-- 4. Gender-wise charge comparison
-- 5. Age-group charge patterns
-- 6. Children/family-size charge patterns
-- 7. High-cost customer identification
-- 8. Regional + smoker segment comparison
-- 9. Above-average charge customers
-- 10. Top 3 high-cost customers in each region
