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
![Ride Distribution by Day of the Week](Ride%20Distribution%20by%20Day%20of%20the%20Week.png)

### 2. Annual members show stronger commuting-related patterns
Annual member rides showed clear peaks during typical commuting hours, particularly around **7–8 a.m.** and **4–6 p.m.** The largest member peak occurred at **5 p.m., accounting for 10.79% of annual member rides**. Casual rides were more gradually distributed throughout the afternoon and early evening.
![Ride Distribution by Time of Day](Ride%20Distribution%20by%20Time%20of%20Day.png)
### 3. Casual rides tend to last longer
Casual rides averaged **17.76 minutes**, compared with **12.03 minutes** for annual members. Median ride duration was also higher for casual rides at **10.88 minutes**, compared with **8.58 minutes** for members.
![Ride Duration by Rider Type](Ride%20Duration%20by%20Rider%20Type.png)

### 4. Casual usage is more seasonal
Both rider types were more active during warmer months, but casual usage showed stronger seasonal concentration. **16.35% of all casual rides occurred in July**, while annual member rides reached their highest monthly share in August at **13.09%**.
![Ride Distribution by Month](Ride%20Distribution%20by%20Month.png)

### 5. Casual rides are more concentrated around recreational and tourist destinations
Casual rides were more concentrated at stations near destinations such as Navy Pier, Millennium Park, Shedd Aquarium, and the lakefront. The top 10 casual starting stations accounted for approximately **11.75% of casual rides with known starting stations**, compared with **6.14% of annual member rides with known starting stations**.
![Top 10 Starting Stations - Casual Riders](Top%2010%20Starting%20Stations%20-%20Casual%20Riders.png)
![Top 10 Starting Stations - Annual Members](Top%2010%20Starting%20Stations%20-%20Annual%20Members.png)

## Business Recommendations

### 1. Target high-traffic recreational and tourist stations
Cyclistic should target casual riders at high-traffic recreational and tourist-area stations with advertising that promotes the benefits of becoming an annual member. The top 10 casual starting stations accounted for approximately **11.75% of casual rides with known starting stations**, compared with **6.14% of annual member rides with known starting stations**.

Cyclistic could use location-specific QR codes or promotional codes to measure how many riders exposed to the campaign later convert to annual memberships.

### 2. Promote membership upgrades after longer casual rides
Casual rides averaged **17.76 minutes**, compared with **12.03 minutes** for annual members. Cyclistic could offer casual riders who complete longer rides a targeted promotion encouraging them to upgrade to an annual membership.

The effectiveness of the promotion could be measured by tracking offer exposure, redemption, and membership conversion rates.

### 3. Focus membership campaigns on weekends and warmer months
Casual riders were more concentrated on weekends and during warmer months. Saturday alone accounted for **21.25% of casual rides**, compared with **12.76% of annual member rides**.

Cyclistic should concentrate annual-membership marketing during these high-usage periods through station signage, in-app messaging, email, or post-ride promotions. Campaign performance could be measured using engagement and membership conversion rates.
## Project Limitations

The dataset contains individual trip records but does not include personally identifiable rider information. Because of this, the analysis cannot determine whether the same casual rider completed multiple trips, whether casual riders live within the service area, or whether an individual rider purchased multiple single-ride passes.

Ride purpose is also not directly recorded. Patterns such as commuting, tourism, or recreational use are therefore inferred from factors such as ride timing, duration, and starting station rather than confirmed directly.

Some trips also contained missing station information. These rides were retained when they passed the cleaning criteria but were excluded from station-ranking analysis when the starting station could not be identified.

## Conclusion

The analysis identified several meaningful differences between casual riders and annual members. Casual rides were more concentrated on weekends, during warmer months, and around recreational and tourist-area stations. Casual rides also tended to last longer. Annual member rides were more evenly distributed throughout the workweek and showed stronger peaks during typical commuting hours.

These findings suggest that Cyclistic could improve its membership-conversion strategy by targeting casual riders at high-traffic recreational locations, promoting membership upgrades after longer rides, and concentrating campaigns during weekends and warmer months when casual usage is highest.
