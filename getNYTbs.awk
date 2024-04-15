# load the amazonReviews file into a table
# loop through the ISINS
# for each ISIN, check if it's in the amazonReviews file
# if key in amazonReviews
#    print the key and the average review
function loadTable(name, arr, keyField, dataField){
    while ((getline < name) > 0)
        arr[($keyField)] = $dataField

    if (close(name)){
        print "Couldn't properly close file: " name > "/dev/stderr"
        return 0
    }

    return 1
}
BEGIN{
    FS = "|"
    print "Loading tables... " > "/dev/stderr"

    if (!loadTable("./AmazonReviews", amazon, 1, 3))

    {
	print "FAILED TO PROPERLY LOAD ONE OR MORE TABLES!!" > "/dev/stderr"
	exit -1
    }
    
    # go through the isins of the nyt best sellers
    input = "./uniqISINS"
    while (("cat " input | getline) > 0) {
	# if it's in amazon
	key = $0
	if (key in amazon) {
	    print key "|" amazon[key]
	}
    }
}
#output ISIN|averageReview
