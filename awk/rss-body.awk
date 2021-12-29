BEGIN {
    print "<item>"
}

/^## / {
    title_text = gensub(/^## (.+)/, "\\1", "1");
    print "<title>" title_text "</title>"

    title_num = substr(title_text, 0, 3); # 001: -> 001
    url = "https://patrickbucher.github.io/starting-over/#" title_num
    print "<link>" url "</link>"

    print "<guid>" url "</guid>"
    print "<description><![CDATA["
    print "<pre>"
}

/^#### / {
    weekday = $2
    month = $3
    monthday = $4
    year = $5

    printf "<pubDate>"
    printf substr(weekday, 0, 3) ", " # Monday, -> Mon,
    printf gensub(/([[:digit:]]+)[[:alpha:]]{2}/, "\\1", "1", monthday) " " # 4th -> 4
    printf substr(month, 0, 3) " " # January -> Jan
    printf year " "
    printf "00:00:00 +0100"
    printf "</pubDate>"
}

!/^####/ {
    gsub(/&/, "\\&")
    gsub(/</, "\\&lt;")
    gsub(/>/, "\\&gt;")
    sub(/]]>/, "]​]>") # CDATA never must end pre-maturely
    print
}

END {
    print "</pre>"
    print "]]></description>"
    print "</item>"
}
