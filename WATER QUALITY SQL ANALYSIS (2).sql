select * from water_quality_dataset;

-- CORE KPIs
-- HOW MANY WATER SAMPLES WERE TESTED?
-- 300 water samples were analyzed
select count(*) from water_quality_dataset;
select count(Sample_ID) from water_quality_dataset;

-- HOW MANY DISTINCT STATIONS WERE THE SAMPLES COLLECTED FROM?
-- 5 stations 
-- Station A - River Intake, Station B - Reservoir, Station E - Consumer Tap, Station D - Distribution Main, Station C - Treatment Plant Outlet
select distinct Station_Name from water_quality_dataset;

-- HOW MANY DISTINCT REGIONS ARE THERE?
-- 5 regions; North, East, Central, West, South
select distinct Region from water_quality_dataset;

-- WHAT IS THE AVERAGE pH LEVEL RECORDED?
-- 7.44
select round(avg(pH),2) as Average_pH from water_quality_dataset;

-- WHAT IS THE AVERAGE Hardness mg/L RECORDED?
-- 207.06 mg/L
select round(avg(Hardness_mgL),2) as Average_Hardness from water_quality_dataset;

-- WHAT IS THE AVERAGE Dissolved Oxygen mg/L RECORDED?
-- 8.14 mg/L
select round(avg(Dissolved_Oxygen_mgL),2) as Average_Dissolved_Oxygen from water_quality_dataset;

-- WHAT IS THE AVERAGE Turbidity NTU RECORDED?
-- 12.35 NTU
select round(avg(Turbidity_NTU),2) as Average_Turbidity from water_quality_dataset;

-- WHAT IS THE AVERAGE Conductivity uS cm RECORDED?
-- 359.6 uS/cm
select round(avg(Conductivity_uScm),2) as Average_Conductivity from water_quality_dataset;

-- WHAT IS THE AVERAGE Nitrate mg/L RECORDED?
-- 3.43 mg/L
select round(avg(Nitrate_mgL),2) as Average_Nitrate from water_quality_dataset;

-- WHAT IS THE AVERAGE BOD mg/L RECORDED?
-- 2.07 mg/L
select round(avg(BOD_mgL),2) as Average_BOD from water_quality_dataset;

-- WHAT IS THE AVERAGE Total Coliform CFU 100mL RECORDED?
-- 65.8
select round(avg(Total_Coliform_CFU_100mL),2) as Average_Total_Coliform from water_quality_dataset;

-- WHAT IS THE AVERAGE Chlorine mg/L RECORDED?
-- 0.49 mg/L
select round(avg(Chlorine_mgL),2) as Average_Chlorine from water_quality_dataset;

-- WHAT IS THE AVERAGE Temperature C RECORDED?
-- 19.21 *C
select round(avg(Temperature),2) as Average_Temperature from water_quality_dataset;

-- CHARTS
-- Which station and region recorded the highest and lowest average ph levels in the two years?
-- Station B - Reservoir recorded the highest average pH level(7.57)
-- Station C - Treatment Plant Outlet recorded the lowest average pH level(7.36)
-- East region recorded the highest average pH level(7.57)
-- South region recorded the lowest average pH level(7.36)
select
   Station_Name,
   Region,
   round(avg(pH),2) as Average_pH
from water_quality_dataset
group by 1,2
order by 3 desc;
   
-- Which station and region recorded the highest and lowest average Hardness mg/L in the two years?
-- Station E - Consumer Tap recorded the highest average Hardness mg/L(226.27)
-- Station C - Treatment Plant Outlet recorded the lowest average Hardness_mg/L(192.28)
-- Central region recorded the highest average Hardness mg/L(226.27)
-- South region recorded the lowest average Hardness_mg/L(192.28)
select
   Station_Name,
   Region,
   round(avg(Hardness_mgL),2) as Average_Hardness
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Dissolved Oxygen mg/L in the two years?
-- Station B - Reservoir recorded the highest average Dissolved Oxygen mg/L(9.57)
-- Station E - Consumer Tap recorded the lowest average Dissolved Oxygen mg/L(7.39)
-- East region recorded the highest average Dissolved Oxygen mg/L(9.57)
-- Central region recorded the lowest average Dissolved Oxygen mg/L(7.39)
select
   Station_Name,
   Region,
   round(avg(Dissolved_Oxygen_mgL),2) as Average_Dissolved_Oxygen
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Turbidity NTU in the two years?
-- Station A - River Intake recorded the highest average Turbidity NTU(45.93)
-- Station C - Treatment Plant Outlet recorded the lowest average Turbidity NTU(0.86)
-- North region recorded the highest average Turbidity NTU(45.93)
-- South region recorded the lowest average Turbidity NTU(0.86)
select
   Station_Name,
   Region,
   round(avg(Turbidity_NTU),2) as Average_Turbidity
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Conductivity uS cm in the two years?
-- Station A - River Intake recorded the highest average Conductivity uS cm(513.42)
-- Station C - Treatment Plant Outlet recorded the lowest average Conductivity uS cm(281.9)
-- North region recorded the highest average Conductivity uS cm(513.42)
-- South region recorded the lowest average Conductivity uS cm(281.9)
select
   Station_Name,
   Region,
   round(avg(Conductivity_uScm),2) as Average_Conductivity
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Nitrate mg/L in the two years?
-- Station A - River Intake recorded the highest average Nitrate mg/L(7.57)
-- Station C - Treatment Plant Outlet recorded the lowest average Nitrate mg/L(1.36)
-- North region recorded the highest average Nitrate mg/L(7.57)
-- South region recorded the lowest average Nitrate mg/L(1.36)
select
   Station_Name,
   Region,
   round(avg(Nitrate_mgL),2) as Average_Nitrate
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average BOD mg/L in the two years?
-- Station A - River Intake recorded the highest average BOD mg/L(2.96)
-- Station C - Treatment Plant Outlet recorded the lowest average BOD mg/L(1.68)
-- North region recorded the highest average BOD mg/L(2.96)
-- South region recorded the lowest average BOD mg/L(1.68)
select
   Station_Name,
   Region,
   round(avg(BOD_mgL),2) as Average_BOD
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Total Coliform CFU 100mL in the two years?
-- Station A - River Intake recorded the highest average Total Coliform CFU 100mL(230.48)
-- Station C - Treatment Plant Outlet recorded the lowest average Total Coliform CFU 100mL(2.03)
-- North region recorded the highest average Total Coliform CFU 100mL(230.48)
-- South region recorded the lowest average Total Coliform CFU 100mL(2.03)
select
   Station_Name,
   Region,
   round(avg(Total_Coliform_CFU_100ml),2) as Average_Total_Coliform
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Chlorine mg/L in the two years?
-- Station C - Treatment Plant Outlet recorded the highest average Chlorine mg/L(1.03)
-- Station B - Reservoir recorded the lowest average Chlorine mg/L(0.05)
-- South region recorded the highest average Chlorine mg/L(1.03)
-- East region recorded the lowest average Chlorine mg/L(0.05)
select
   Station_Name,
   Region,
   round(avg(Chlorine_mgL),2) as Average_Chlorine
from water_quality_dataset
group by 1,2
order by 3 desc;

-- Which station recorded the highest and lowest average Temperature C in the two years?
-- Station E - Consumer Tap recorded the highest average Temperature(20.32)
-- Station B - Reservoir recorded the lowest average Temperature(18.47)
-- Central region recorded the highest average Temperature(20.32)
-- East region recorded the lowest average Temperature(18.47)
select
   Station_Name,
   Region,
   round(avg(Temperature),2) as Average_Temperature
from water_quality_dataset
group by 1,2
order by 3 desc;

-- YEARLY ANALYSIS
-- In which year was the highest and lowest average ph levels recorded?
-- Highest 2023 7.46
-- Lowest 2024 7.41
select
   Year,
   round(avg(pH),2) as Average_pH
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Hardness mg/L recorded?
-- Highest 2024 (210.31 mg/L)
-- Lowest 2023 (204.02 mg/L)
select
   Year,
   round(avg(Hardness_mgL),2) as Average_Hardness
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Chlorine mg/L recorded?
-- Highest 2024 0.52 mg/L
-- Lowest 2023 0.46 mg/L
select
   Year,
   round(avg(Chlorine_mgL),2) as Average_Chlorine
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Temperature C recorded?
-- Highest 2024 19.33 *C)
-- Lowest 2023 (19.09 *C)
select
   Year,
   round(avg(Temperature),2) as Average_Temperature
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Total Coliform CFU 100mL recorded?
-- Highest 2023 81.42/100ml
-- Lowest 2024 49.1/100ml
select
   Year,
   round(avg(Total_Coliform_CFU_100ml),2) as Average_Total_Coliform
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average BOD mg/L recorded?
-- Highest 2023 2.15 mg/L
-- Lowest 2024 1.98 mg/L
select
   Year,
   round(avg(BOD_mgL),2) as Average_BOD
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Nitrate mg/L recorded?
-- Highest 2023 3.74 mg/L
-- Lowest 2024 3.09 mg/L
select
   Year,
   round(avg(Nitrate_mgL),2) as Average_Nitrate
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Conductivity uS cm recorded?
-- Highest 2023 381.27 uS/cm
-- Lowest 2024 336.43 uS/cm
select
   Year,
   round(avg(Conductivity_uScm),2) as Average_Conductivity
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Turbidity NTU recorded?
-- Highest 2023 14.65 NTU
-- Lowest 2024 9.89 NTU
select
   Year,
   round(avg(Turbidity_NTU),2) as Average_Turbidity
from water_quality_dataset  
group by 1
order by 2 desc;

-- In which year was the highest and lowest average Dissolved Oxygen mg/L recorded?
-- Highest 2023 8.22 mg/L
-- Lowest 2024 8.06 mg/L
select
   Year,
   round(avg(Dissolved_Oxygen_mgL),2) as Average_Dissolved_Oxygen
from water_quality_dataset  
group by 1
order by 2 desc;

-- SEASONAL PATTERN

-- In which month of the year 2023 and 2024 was the highest and lowest average ph levels recorded?
select
   Month_name as Month_2023,
   round(avg(pH),2) as average_pH
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(pH),2) as average_pH
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Hardness mg/L recorded?
select
   Month_name as Month_2023,
   round(avg(Hardness_mgL),2) as average_Hardness
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Hardness_mgL),2) as average_Hardness
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Chlorine mg/L recorded?
select
   Month_name as Month_2023,
   round(avg(Chlorine_mgL),2) as average_Chlorine
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Chlorine_mgL),2) as average_Chlorine
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Temperature C recorded?
select
   Month_name as Month_2023,
   round(avg(Temperature),2) as average_Temperature
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Temperature),2) as average_Temperature
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Total Coliform CFU 100mL recorded?
select
   Month_name as Month_2023,
   round(avg(Total_Coliform_CFU_100mL),2) as Average_Total_Coliform
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Total_Coliform_CFU_100mL),2) as Average_Total_Coliform
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average BOD mg/L recorded?
select
   Month_name as Month_2023,
   round(avg(BOD_mgL),2) as Average_BOD
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(BOD_mgL),2) as Average_BOD
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Nitrate mg/L recorded?
select
   Month_name as Month_2023,
   round(avg(Nitrate_mgL),2) as Average_Nitrate
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Nitrate_mgL),2) as Average_Nitrate
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Conductivity uS cm recorded?
select
   Month_name as Month_2023,
   round(avg(Conductivity_uScm),2) as Average_Conductivity
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Conductivity_uScm),2) as Average_Conductivity
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Turbidity NTU recorded?
select
   Month_name as Month_2023,
   round(avg(Turbidity_NTU),2) as Average_Turbidity
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Turbidity_NTU),2) as Average_Turbidity
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;

-- In which month of the year 2023 and 2024 was the highest and lowest average Dissolved Oxygen mg/L recorded?
select
   Month_name as Month_2023,
   round(avg(Dissolved_Oxygen_mgL),2) as Dissolved_Oxygen
from water_quality_dataset
where Year(Date) = 2023   
group by 1
order by 2 desc;

select
   Month_name as Month_2024,
   round(avg(Dissolved_Oxygen_mgL),2) as Dissolved_Oxygen
from water_quality_dataset
where Year(Date) = 2024   
group by 1
order by 2 desc;


-- How many samples passed and failed the WHO Coliform standards from each of the stations?
select
   Station_Name,
   count(case when WHO_Coliform_Pass = 'PASS' then 'P' end) as PASSED_SAMPLES,
   count(case when WHO_Coliform_Pass = 'FAIL' then 'F' end) as FAILED_SAMPLES
from water_quality_dataset
group by 1
order by 3 desc;      
  
-- How many samples passed and failed the WHO Turbidity standards from each of the stations?
select
   Station_Name,
   count(case when WHO_Turbidity_Pass = 'PASS' then 'P' end) as PASSED_SAMPLES,
   count(case when WHO_Turbidity_Pass = 'FAIL' then 'F' end) as FAILED_SAMPLES
from water_quality_dataset
group by 1
order by 3 desc;  

-- How many samples passed and failed the WHO Nitrate standards from each of the stations?
select
   Station_Name,
   count(case when WHO_Nitrate_Pass= 'PASS' then 'P' end) as PASSED_SAMPLES,
   count(case when WHO_Nitrate_Pass = 'FAIL' then 'F' end) as FAILED_SAMPLES
from water_quality_dataset
group by 1
order by 3 desc; 
 
-- How many samples passed and failed the WHO pH standards from each of the stations?
select
   Station_Name,
   count(case when WHO_pH_Pass= 'PASS' then 'P' end) as pH_PASSED_SAMPLES,
   count(case when WHO_pH_Pass = 'FAIL' then 'F' end) as pH_FAILED_SAMPLES
from water_quality_dataset
group by 1
order by 3 desc; 

-- HOW MANY WATER SAMPLES ARE POTABLE AND NOT POTABLE FROM EACH STATION?
select
   Station_Name,
   count(case when Overall_Potable = 'YES' then 'Y' end) as POTABLE,
   count(case when Overall_Potable = 'NO' then 'N' end) as NOT_POTABLE,
   count(case when Overall_Potable = 'N/A (Raw Source)' then 'R' end) as RAW_WATER
from water_quality_dataset
group by 1
order by 2 desc; 
select * from water_quality_dataset;