function pdfmake -d "Use pandoc to convert Markdown file into pdf."
    pandoc $argv -f markdown-implicit_figures --pdf-engine=xelatex -o $argv.pdf
end
