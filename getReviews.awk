BEGIN{
    FS = ","
    input_path = "./Books.csv.gz"
    
    # go through all amazon book reviews
    while (("zcat " input_path | getline) > 0) {
	# get the isin from field 1
	ISIN = $1
	# get the star rating from field 3
	rating = $3
	# add to the count of that book
	count[ISIN]++
	# add to the review count
	review[ISIN] += rating
    }
    
    for (key in review) {
	print key "|" count[key] "|" review[key]/count[key]
    }

}
# output ISIN|#reviews|#averageReview
