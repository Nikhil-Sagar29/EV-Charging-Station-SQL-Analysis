===========================================================================
INFRASTRUCTURE_ANALYSIS
===========================================================================
-- Which cities are overbuilt vs underbuilt?
SELECT
  city,
  COUNT(DISTINCT station_name) AS total_stations,
  SUM(ports_total) AS total_ports,
  SUM(ports_occupied) AS occupied_ports,
  SUM(ports_out_of_service) AS out_of_service_ports,
  CAST(SUM(ports_occupied)*1.0 / SUM(ports_total) 
         AS DECIMAL(10,4)) AS utilization_ratio
FROM ev_charging_station_data
GROUP BY city
ORDER BY utilization_ratio DESC;

--Available vs Occupied Ports by City  
WITH city_ports AS (
    SELECT
    city,
    SUM(ports_total) AS total_ports,
    SUM(ports_occupied) AS occupied_ports,
    SUM(ports_out_of_service) AS out_of_service_ports
    FROM ev_charging_station_data
    GROUP BY city
)
SELECT *,
       CAST(occupied_ports * 1.0 / total_ports AS DECIMAL(10,3)) AS utilization_ratio,
       RANK() OVER (ORDER BY occupied_ports DESC) AS congestion_rank
FROM city_ports;
