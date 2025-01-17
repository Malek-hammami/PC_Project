# PC_Project
### Project overview
This Power BI project analyzes PC offerings from MyTek and Tunisianet to help customers choose the right PC based on their budget and component preferences. The analysis focuses on comparing price ranges, component availability, and overall value between the two stores and this part is about cleaning and preparing data using MySQL 

### Data Sources
Raw Datasets: Extracted from MyTek and Tunisianet websites.
Customer Table: Customer preferences and purchase history.

### Tools

- SQL - data cleaning
- Power BI - data visualization

### Data cleaning/preparation

1. Renamed Columns for clarity and consistency across the MyTek and Tunisianet datasets.
2. Corrected Processor Data by merging fragmented data using CONCAT and removing unnecessary columns.
3. Resolved Mixed Data Issues in the RAM, Storage, and Graphics Card columns by relocating misplaced data and assigning irrelevant entries to NULL and filled them later with data from other columns
4. Standardized Data Formats by filtering and updating inconsistent entries in component columns.
5. Cleaned Price Data by removing special characters for accurate analysis.
6. Added Unique ID Columns to both datasets for better data management.
7. Created a Customer Table to define market segments and their minimum PC requirements.


