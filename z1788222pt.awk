# Programmer: Chase Pranga
# ZID: Z1788222
# Assignment: 6
# Due Date: 4 December 2017
BEGIN {
	print "		ABC Computing"
	print "		2017 Sales Assosciate"
	print " Name			Position			Sales Amount "
	print "================================================================="
	FS = ":"
}

NF == 4{
	productIDArray[$1] = $4
}

NF == 3{
	staffNameArray[$1] = $2
	staffPositionArray[$1] = $3
	staffIDArray[$1] = $1
}

NF == 5{
	if ( $4 ~ /2017/) {
		salesTotalArray[$5]+= productIDArray[$2] * $3
	}
}

END	{
	print ""
	print "				UNSORTED SALES LIST"
	for ( x in staffIDArray)
		 {printf("%-20s %20s %20.2d \n", staffNameArray[x], staffPositionArray[x], salesTotalArray[x])}
	print ""
	print "				SORTED SALES LIST"
	for ( x in staffIDArray)
		{printf("%10s %-20s %-20s \n", staffIDArray[x], staffNameArray[x], salesTotalArray[x]) | "sort -nk4"}
}
