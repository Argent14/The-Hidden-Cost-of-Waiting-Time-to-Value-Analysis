-- ============================================
-- PROJECT: Time-to-Value Analysis
-- AUTHOR: Moses Abah
-- DESCRIPTION:
-- Analyzing how fulfillment delays reduce revenue value
-- ============================================


-- ============================================
-- 1. BASE DATA CREATION
-- ============================================

WITH base_data AS (
SELECT 
    o.order_id,
    o.region,
    o.fulfillment_days,
    o.returned,
    
    o.quantity * o.unit_price * (1 - o.discount_percent/100) AS revenue

FROM orders o
)


-- ============================================
-- 2. VALUE LOSS CALCULATION
-- ============================================

SELECT 
    SUM(revenue) AS original_revenue,
    SUM(revenue * (1 - 0.001 * fulfillment_days)) AS adjusted_revenue,
    SUM(revenue) - SUM(revenue * (1 - 0.001 * fulfillment_days)) AS value_lost
FROM base_data;


-- ============================================
-- 3. REGION VALUE LOSS ANALYSIS
-- ============================================

SELECT 
    region,
    SUM(revenue) AS original_revenue,
    SUM(revenue * (1 - 0.001 * fulfillment_days)) AS adjusted_revenue,
    SUM(revenue) - SUM(revenue * (1 - 0.001 * fulfillment_days)) AS value_lost
FROM base_data
GROUP BY region
ORDER BY value_lost DESC;


-- ============================================
-- 4. DELAY VS RETURN ANALYSIS
-- ============================================

SELECT 
    CASE 
        WHEN fulfillment_days <= 3 THEN 'Fast'
        WHEN fulfillment_days <= 7 THEN 'Moderate'
        ELSE 'Slow'
    END AS speed_group,

    COUNT(*) AS total_orders,
    SUM(returned)*1.0/COUNT(*) AS return_rate

FROM base_data
GROUP BY speed_group;


-- ============================================
-- 5. PRODUCT DELAY RANKING
-- ============================================

SELECT 
    product_id,
    AVG(fulfillment_days) AS avg_delay,
    RANK() OVER (ORDER BY AVG(fulfillment_days) DESC) AS delay_rank

FROM orders
GROUP BY product_id;