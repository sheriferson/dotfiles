function makepdf
    pandoc $argv --pdf-engine=xelatex -o $argv.pdf
end
