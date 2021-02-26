function mergepdfs -d "Merge pdf files into single pdf."
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$argv[1] $argv[2..-1]
end
