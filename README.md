# PC_Project
### Project overview
This Power BI project analyzes PC offerings from MyTek and Tunisianet to help customers choose the right PC based on their budget and component preferences. The analysis focuses on comparing price ranges, component availability, and overall value between the two stores 

![Image](https://github.com/user-attachments/assets/930ce17e-bd15-4dd1-82cf-366157e1dab2)

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

### Exploratory data analysis

The exploratory data analysis examined the MyTek and Tunisianet data to address a key question :

- How to design a dashboard that analyzes PC options while guiding users to choose the best fit?

### Limitations

I couldn't fully utilize the entire customer_needs table as planned, so I focused on the processor and graphics_card columns for the slicer and deleted the others and  To ensure all selection options remained available, I created two separate visuals for RAM and storage.



![Image](https://github.com/user-attachments/assets/289b387e-c558-40e7-af09-99ab8983ed5d)


