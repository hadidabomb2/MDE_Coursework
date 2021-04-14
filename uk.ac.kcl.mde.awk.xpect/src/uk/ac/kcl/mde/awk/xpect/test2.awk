filename("processes.txt")
start {
	row {
		"Process ID", " | ";
		"CPU Usage", " | ";
		"Date/Time Started", " | ";
	}
}

body {
	var application = "Spotify";
	match application;
	row {
		column 2, " | ";
		column 3, " | ";
		column 9, " | ";
	}
}
end {
	print "Application Information For:";
	print application;
}