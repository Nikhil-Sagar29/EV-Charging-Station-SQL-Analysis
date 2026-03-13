====================================================================================
WEATHER_ANALYSIS
====================================================================================
--Weather Condition Performance
 /* Logic:
  Analyze how weather affects:
  Utilization
  Maximum wait time */
 ---------------------------------

SELECT
    weather_condition,
    ROUND(AVG(utilization_rate),3) AS avg_utilization,
    ROUND(MAX(estimated_wait_time_mins),1) AS worst_wait_time
FROM ev_charging_station_data
GROUP BY weather_condition
ORDER BY avg_utilization DESC;

--Temperature Impact on Power Usage
 /* Logic:
    Group temperatures into operational categories to examine:
    1.Power output efficiency
    2.Utilization patterns
    0–32F → Very Cold
    33–50F → Cold
    51–68F → Cool
    69–77F → Warm
    78–86F → Hot
    87–100F → Very Hot 
    */
    ------------------------------------------
SELECT 
    CASE 
        WHEN temperature_f BETWEEN 0 AND 32 THEN 'Very Cold'
        WHEN temperature_f BETWEEN 33 AND 50 THEN 'Cold'
        WHEN temperature_f BETWEEN 51 AND 68 THEN 'Cool'
        WHEN temperature_f BETWEEN 69 AND 77 THEN 'Warm'
        WHEN temperature_f BETWEEN 78 AND 86 THEN 'Hot'
        ELSE 'Very Hot'
    END AS temperature_group,
    ROUND(AVG(power_output_kw),3) AS avg_power,
    ROUND(AVG(utilization_rate),3) AS avg_utilization
FROM ev_charging_station_data
GROUP BY 
    CASE 
        WHEN temperature_f BETWEEN 0 AND 32 THEN 'Very Cold'
        WHEN temperature_f BETWEEN 33 AND 50 THEN 'Cold'
        WHEN temperature_f BETWEEN 51 AND 68 THEN 'Cool'
        WHEN temperature_f BETWEEN 69 AND 77 THEN 'Warm'
        WHEN temperature_f BETWEEN 78 AND 86 THEN 'Hot'
        ELSE 'Very Hot'
    END
ORDER BY avg_power DESC


