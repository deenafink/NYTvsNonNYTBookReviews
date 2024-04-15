all: AmazonReviews NYTbs notNYTbs uniqISINS graphs.pdf

clean:
	rm -f AmazonReviews NYTbs notNYTbs uniqISINS graphs.pdf

# the ISIN id number taken from the NYT dataset
uniqISINS: bestsellers.csv.gz getISIN.awk
	zcat bestsellers.csv.gz | gawk -f getISIN.awk | sort | uniq > uniqISINS

# ISIN|#ofReviews|AverageReview
AmazonReviews: Books.csv.gz getReviews.awk
	zcat Books.csv.gz | gawk -f getReviews.awk > AmazonReviews

# ISIN|AverageReview
NYTbs: AmazonReviews getNYTbs.awk uniqISINS
	gawk -f getNYTbs.awk > NYTbs

# ISIN|AverageReview
notNYTbs: AmazonReviews getnotNYTbs.awk NYTbs
	gawk -f getnotNYTbs.awk > notNYTbs

# plots
graphs.pdf: NYTbs notNYTbs makeGraphs.py
	python3 makeGraphs.py > graphs.pdf
