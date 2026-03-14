⚡ EV Charging Station SQL Analysis
-----------------------------------------------------------------
📊 Data Analysis Project | SQL | Infrastructure & Demand Insights
-----------------------------------------------------------------
This project analyzes EV charging station operational data to understand charging demand patterns, infrastructure efficiency, and operational stress factors across multiple stations.

The analysis focuses on identifying usage trends, congestion periods, infrastructure distribution, and external factors influencing EV charging demand.

📂 Project Structure
---------------------
ev-charging-station-sql-analysis
│
├── 01_dataset
│   └── ev_charging_station_data.zip
│
├── 02_sql_queries
│   ├── 01_data_cleaning.sql
│   ├── 02_infrastructure_analysis.sql
│   ├── 03_utilization_analysis.sql
│   ├── 04_peak_hour_analysis.sql
│   ├── 05_weather_analysis.sql
│   └── 06_station_stress_analysis.sql
│
├── 03_insights
│   └── key_insights.md
│
└── README.md

🧾 Dataset Overview
--------------------
The dataset contains hourly operational records of EV charging stations.

Key Attributes
Column                   -  Description
station_id	             -  Unique station identifier
city	                   -  Location of charging station
charger_type 	          -  Type of charger installed
ports_total	             -  Total charging ports
ports_occupied	          -  Ports currently in use
utilization_rate	       -  Station usage percentage
estimated_wait_time_mins -  Average wait time
weather_condition	       -  Weather  during charging
local_event	             -  Nearby events impacting demand

📦 Dataset Size: ~1.3 Million Records
🏙 Stations Covered: 150

🧹 Data Cleaning
------------------
Initial SQL checks were performed to ensure data reliability.

✔ Checked for null values

✔ Checked for duplicate station records

✔ Validated port usage does not exceed capacity

✔ Verified categorical values consistency

Example query:
---------------
SELECT *
FROM ev_charging_station_data
WHERE ports_occupied > ports_total;

📊 Analysis Sections
The project is divided into multiple analytical sections.

🚧 Infrastructure Analysis
-----------------------------
Evaluates:
1. Charging port distribution
2. City-level infrastructure capacity
3. Station deployment patterns

Key goal: Identify areas requiring infrastructure expansion.

⚡ Utilization Analysis
-------------------------------
Examines:
1. Average utilization rates
2. Charger type demand
3. Station usage patterns
   
Key goal: Understand how efficiently stations are used.

⏰ Peak Hour Demand
----------------------------
Analyzes:
1. Charging demand by hour
2. Congestion periods
3. Wait time increases

Key goal: Detect peak demand periods.

⚠️ Customer Charging Stress Analysis
-------------------------------------

This section evaluates charging station congestion and customer stress levels based on:
1. Utilization Rate
2. Ports Occupied
3. Estimated Wait Time
4. Charging Demand Patterns
A Charging Stress Indicator was developed to identify stations experiencing high operational pressure.

Stations were categorized into stress levels:
----------------------------------------------
Stress Level Condition
🟢 Low Stress - Low wait time and moderate utilization

🟡 Moderate Stress - Increasing utilization with moderate wait time

🟠 High Stress	-   High utilization and increasing queue time

🔴 Critical Stress - Severe congestion and long wait times

This analysis helps identify stations that require infrastructure expansion or operational optimization.

🌦 Weather Impact
-------------------------
Investigates how weather affects:
1. Utilization rate
2. Charging performance
3. User behavior

Key goal: Identify environmental factors affecting charging demand.

🏙 Amenity & Location Impact
-----------------------------
Evaluates influence of:
1. Nearby amenities
2. Commercial vs residential locations
3. Charging convenience

Key goal: Understand urban factors influencing EV usage.

🎪 Local Event Impact
----------------------
Studies demand spikes caused by:
1. Concerts
2. Festivals
3. Public gatherings
4. Conferences

Key goal: Identify temporary infrastructure stress.

🔍 Key Insights
--------------------

📌 Charging congestion is strongly linked to utilization levels above 50%, where wait times begin increasing significantly.

📌 Stations operating near full capacity experience high customer stress levels due to limited port availability.

📌 Peak-hour demand creates temporary congestion spikes, especially in high-traffic urban areas.

📌 Fast chargers tend to reduce customer wait times despite higher utilization levels.

📌 Stations located in commercial areas show both higher demand and higher customer stress during peak hours.

📌 Large public events can temporarily push stations into critical stress levels due to sudden demand spikes.

🛠 Tools Used
---------------------
Tool	Purpose:
1. SQL	Data querying and analysis
2. MicrosoftSQL / SQL Server	Data processing
3. Power Ouery	Data cleaning
4. Power BI	Visualization (separate dashboard project)

   
📈 Future Improvements
----------------------------
1. Add interactive dashboards
2. Perform predictive demand analysis
3. Implement charging station performance scoring
4. Develop EV infrastructure optimization model

👤 Author
-----------------
Nikhil Sagar

🎓 BBA Graduate
📊 Aspiring Data Analyst

Skills:
--------------
1. SQL
2. Power BI
3. Microsoft Excel
4. Data Analysis & Visualization

⭐ If You Found This Useful
Consider starring ⭐ the repository to support the project.
