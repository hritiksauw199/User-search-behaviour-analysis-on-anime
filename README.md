# User-search-behaviour-analysis-on-anime

In the course of this project, we examined anime-related search queries originating from diverse users, taking into account their distinctive search patterns, visited websites, geographic trends, and other relevant factors. Our primary objective was to discern the factors influencing these searches and to observe how these influences evolved over time. Despite the inherent limitation of our dataset, we managed to extract valuable insights within a condensed timeframe. To refine our understanding, we narrowed our focus exclusively to the United States.

For this project we utilized Exasol to establish a connection with the database image (Installation and setup guide below). Employing SQL queries, we mined the data for answers and leveraged Python for data cleaning purposes. Furthermore, our utilization of Python extended to interfacing with external data sources, allowing us to extract nuanced insights and formulate substantiated conclusions. This comprehensive approach, combining database querying and programming, enabled us to derive a comprehensive understanding of anime-related search behaviors, especially within the context of the U.S. region.

# About the Data

Presented here is a snapshot encompassing over 36 million query logs, predominantly originating from U.S. citizens, and the corresponding clicked results spanning the period from March to June 2006. This dataset was culled from the AOL search engine during a period when Google search technology was in use. 

**Context**

The dataset contains numerous tables, but for our project, we will focus mainly on the following tables: `DMOZ_CATEGORIES`, `FACTS`, `QUERYDIM`, `TIMEDIM`, `URL_CATEGORY`, and `URLDIM`.

Each of these tables has various columns. Below are the specific columns from these tables that we'll be using for our project:

`Topic`: This column provides the full name of the category and indicates its placement.

`Title`: Refers to the name of the category to which a query belongs.

`Topic 1 - 15`: These columns list sub-topics corresponding to the full topic mentioned.

`Catid`: This is a unique identifier for each category.

`Query`: The specific query made by the user.

`Queryid`: Represents the ID of the query.

`Click`: This is a boolean value that indicates whether a user clicked on the provided link or URL.

`URL`: This column provides the actual URL that corresponds to the executed query.

_Note_: I haven't detailed every ID column that can be used for joining tables to avoid potential confusion. The column names are mostly self-explanatory.

**External Dataset**

To gather deeper insights from our data, we link it with a database available on Kaggle.
The dataset contains information about reviews from users for different animes, with text review and scores.

Link to the file: https://www.kaggle.com/datasets/marlesson/myanimelist-dataset-animes-profiles-reviews?select=reviews.csv

**Final Schema**

![Final](images%2FSchema.jpg)