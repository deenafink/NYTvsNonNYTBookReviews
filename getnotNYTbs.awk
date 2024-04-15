# load the amazon reviews and the nytBS into tables
function loadTable(name, arr, keyField, dataField){
    while ((getline < name) > 0)
        arr[($keyField)] = $dataField

    if (close(name)){
        print "Couldn't properly close file: " name > "/dev/stderr"
        return 0
    }

    return 1
}
# function to generate a random index of the amazon book list
function getRandomKey(amazon, dest,   randomNum, randomKey){
    randomNum = int(rand() * length(amazon)) + 1
    randomKey = dest[randomNum]
    return randomKey
}
BEGIN{
    FS = "|"
    print "Loading tables... " > "/dev/stderr"

    if (!loadTable("./AmazonReviews", amazon, 1, 3) ||
	!loadTable("./NYTbs", NYTbs))

    {
	print "FAILED TO PROPERLY LOAD ONE OR MORE TABLES!!" > "/dev/stderr"
	exit -1
    }
    
    # go through the isins of the nyt best sellers
    input = "./NYTbs"
    # get the length of the the other file so we compare the same number of books
    while (("cat " input | getline) > 0){
	sampleSize++
    }

    # get the nonNYTbs average ratings
    # get random reviews from the list
    # use asorti in order to access the indexed list
    asorti(amazon, dest)

    while (sampleSize > 0){
	randomISIN = getRandomKey(amazon, dest)
	# if the book isn't a new york times bestseller
	if (!(randomISIN in NYTbs)) {
	    print randomISIN "|" amazon[randomISIN]
	    # decrement the sampleSize
	    sampleSize--
	}
    }
}
# output ISIN|averageReview
