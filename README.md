# Cyclistic Bike-Share Case Study

## Project Overview

This case study analyzes 12 months of Cyclistic bike-share trip data to understand how casual riders and annual members use the service differently. The goal of the analysis is to identify patterns that could help Cyclistic develop strategies to convert more casual riders into annual members.

## Business Question

**How do annual members and casual riders use Cyclistic bikes differently?**

## Tools Used

- **Google BigQuery** – SQL querying, data cleaning, and analysis
- **Google Colab** – Uploading and validating the monthly CSV datasets
- **Google Sheets** – Creating charts and presenting final findings

## Dataset

The analysis uses Cyclistic/Divvy historical trip data from **October 2025 through September 2026**.

The original dataset contained **6,171,785 rides** across 12 monthly CSV files. After data cleaning and validation, the final dataset contained **6,099,955 rides**.

Data Source: Divvy Historical Trip Data  
Data License: Divvy Data License Agreement

## Analysis Process

The project follows the Google Data Analytics process:

**Ask → Prepare → Process → Analyze → Share → Act**

The analysis focused on differences between casual riders and annual members across:

- Day of the week
- Time of day
- Ride duration
- Month and season
- Starting station
## Key Findings

### 1. Casual rides are more concentrated on weekends
Casual rides showed a stronger weekend pattern than annual member rides. Saturday accounted for **21.25% of all casual rides**, compared with **12.76% of annual member rides**. Annual member rides were more evenly distributed throughout the workweek.

### 2. Annual members show stronger commuting-related patterns
Annual member rides showed clear peaks during typical commuting hours, particularly around **7–8 a.m.** and **4–6 p.m.** The largest member peak occurred at **5 p.m., accounting for 10.79% of annual member rides**. Casual rides were more gradually distributed throughout the afternoon and early evening.

### 3. Casual rides tend to last longer
Casual rides averaged **17.76 minutes**, compared with **12.03 minutes** for annual members. Median ride duration was also higher for casual rides at **10.88 minutes**, compared with **8.58 minutes** for members.

### 4. Casual usage is more seasonal
Both rider types were more active during warmer months, but casual usage showed stronger seasonal concentration. **16.35% of all casual rides occurred in July**, while annual member rides reached their highest monthly share in August at **13.09%**.

### 5. Casual rides are more concentrated around recreational and tourist destinations
Casual rides were more concentrated at stations near destinations such as Navy Pier, Millennium Park, Shedd Aquarium, and the lakefront. The top 10 casual starting stations accounted for approximately **11.75% of casual rides with known starting stations**, compared with **6.14% of annual member rides with known starting stations**.
