filename("test.txt")
start{
	var rowCount = 5;
}
body{
	var columnCount = 10;
	match "cheese";
	print "cheese";
	row {
		"cheese", " | ";
		"test", " | ";
	}
}
end{
	var max = 2;
	print columnCount;
}


	