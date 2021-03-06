/^[[:space:]]+/ {
    print;
}

!/^([[:space:]]+|####)/ {
    sub(/^"/, "“");
    $0 = gensub(/([[:space:]]+)"/, "\\1“", "g");
    gsub(/"/, "”");
    sub(/^'/, "‘");
    $0 = gensub(/([[:space:]]+)'/, "\\1‘", "g");
    gsub(/'/, "’");
    gsub(/\.\.\./, "…");
    $0 = gensub(/([[:alnum:]]+)--([[:alnum:]]+)/, "\\1—\\2", "g");
    print;
}

/^####/ {
    $0 = gensub(/([[:digit:]]{1,2})([[:alpha:]]{2})/, "\\1<sup>\\2</sup>", "1");
    print;
}
