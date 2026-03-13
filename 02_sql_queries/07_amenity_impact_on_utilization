==============================================================================
Amenity_Impact_on_Utilization
==============================================================================

-- Location Type Demand
 Logic:
 Analyzes how different location types influence:
  1.Utilization rate
  2.Pricing
  3.Power output
  4.Total infrastructure capacity

  ---------------------------------

SELECT
    location_type,
    ROUND(AVG(utilization_rate),3) AS avg_utilization,
    ROUND(AVG(current_price),3) AS avg_price,
    ROUND(AVG(power_output_kw),2) AS avg_power_kw,
    SUM(ports_total) AS total_ports
FROM ev_charging_station_data
GROUP BY location_type
ORDER BY avg_utilization DESC;
----------------------------------------

--- Amenity Density Impact
     LOGIC:
     1.Amenities are stored as comma-separated VARCHAR.
     2.Count commas + 1 to estimate number of amenities.
     3.Categorize stations into High / Medium / Low amenity density
---------------------------------------------------

WITH amenity_count_cte AS (
    SELECT
        utilization_rate,
        CASE 
            WHEN amenities_nearby = 'None' THEN 0
            ELSE LEN(amenities_nearby) 
                 - LEN(REPLACE(amenities_nearby, ',', '')) + 1
        END AS amenity_count
    FROM ev_charging_station_data
)

SELECT
    CASE 
        WHEN amenity_count >= 5 THEN 'High Amenity'
        WHEN amenity_count >= 3 THEN 'Medium Amenity'
        ELSE 'Low Amenity'
    END AS amenity_group,
    CAST(AVG(utilization_rate) AS DECIMAL(10,4)) AS avg_utilization
FROM amenity_count_cte
GROUP BY 
    CASE 
        WHEN amenity_count >= 5 THEN 'High Amenity'
        WHEN amenity_count >= 3 THEN 'Medium Amenity'
        ELSE 'Low Amenity'
    END
------------------------------------------------------------------------

---- Charger type with Current price and power output in Peak Hours  
    Evaluate charger types based on:
    1.Average power output
    2.Pricing
    3.Utilization
    4.Rank chargers by demand
    --------------------------------------------------

WITH charger_performance AS (
    SELECT
        charger_type,
        AVG(power_output_kw) AS avg_power,
        AVG(current_price) AS avg_price,
        AVG(utilization_rate) AS avg_utilization
    FROM ev_charging_station_data
    GROUP BY charger_type
)
SELECT *,
       RANK() OVER (ORDER BY avg_utilization DESC) AS utilization_rank
FROM charger_performance;
---------------------------------------------------------
