BEGIN{
    FS = ","
    #input_path = "/data/raw/NYTBestsellers/bestsellers.csv.gz"
    input_path = "./bestsellers.csv.gz"
    
    # go through the NYT bestsellers
    while (("zcat " input_path | getline) > 0) {
	line = $0
	# split the line on dp\ then take just the ISIN
	split(line, a, /dp\//)
	if (a[2] != "")
	    split(a[2], b, /[^0-9A-Z]/)
	print b[1]
    }
    # now this gets all the ISINS out    
}
