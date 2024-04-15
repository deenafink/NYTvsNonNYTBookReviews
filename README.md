# NYTvsNonNYTBookReviews
The New York Times Bestseller list is a popular and well known list of top selling books in the United States. New lists come out every week. My hypothesis for this project was to determine if books on the list are more beloved than books not on the list. I used a data set from Kaggle which provided a list of books which were ever on the New York Times Bestsellers list between January 3, 2010 to December 29, 2019. I also used a dataset of Amazon book reviews which was a file containing over 51 million book reviews out of 5 stars.

To get results I wrote short Awk scripts and then combined them together in the end with a makefile. I began with scraping the id number (ISIN) from the New York Times Bestseller dataset into a new file. The next awk script found the average star rating for each book reviewed in the Amazon data set. I then used the ISIN scraped from the original NYT dataset to match it with the Amazon data set. 2865 books matched and I then created two files: 2865 New York Times Best selling books, each with its average rating and 2865 other books, each with its average rating. 

I then used matplotlib to test my hypothesis. I created two histogram plots, one for New York Times Bestsellers and one for other books. Each plot’s x-axis is the star rating and the y-axis is the number of books with that average rating. The two plots show the trend in average reviews. 

For New York Times Best Sellers, there is a gradual increase from 3 to around 4.5 stars. There is a slight drop at the 5 star mark. For the other books there are a few ratings by 1 and 2 and then a few more between 3 and 4. At the 5 mark, the bar goes steeply up. Most books are at the 5 mark.

I have proved my hypothesis because there are more books not on the NYT Bestsellers list with an average of 5 star reviews than books on the list. 

The links to the datasets used: 
NYT: https://www.kaggle.com/datasets/dhruvildave/new-york-times-best-sellers
Amazon Book Reviews: https://jmcauley.ucsd.edu/data/amazon_v2/categoryFilesSmall/Books.csv
