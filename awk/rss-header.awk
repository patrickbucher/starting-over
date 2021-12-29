BEGIN {
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    print "<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">"
    print "<channel>"
    printf "<atom:link href=\"https://patrickbucher.github.io/starting-over/feed.rss\" "
    print "rel=\"self\" type=\"application/rss+xml\" />"
}

/^title=/ {
    print "<title>" $2 "</title>"
}

/^url=/ {
    print "<link>" $2 "</link>"
}

/^description=/ {
    print "<description>" $2 "</description>"
}

/^language=/ {
    print "<language>" $2 "</language>"
}

/^author=/ {
    print "<copyright>" $2 "</copyright>"
}

END {
    print "<pubDate>" strftime("%a, %d %b %Y %H:%M:%S %z") "</pubDate>"
}
