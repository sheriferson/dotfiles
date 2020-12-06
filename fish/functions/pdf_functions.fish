function makepdf
    pandoc $argv -f markdown-implicit_figures --pdf-engine=xelatex -o $argv.pdf
end
