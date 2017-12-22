command: 'cat ~/dotfiles/Ubersicht/widgets/kindle-clippings.widget/all-clippings.txt | awk -f kindle-clippings.widget/parser.awk'

refreshFrequency: '1h'

style: """
    background: rgba(0, 166, 255, .3);
    color: #fff
    font-family: -apple-system
    whitespace: pre-line;
    left: 50px
    line-height: 1.5
    padding-left: 30px
    padding-right: 30px
    width: 500px
    top: 10px
    border-style: ridge
    border-width: 1px

"""
render: (output) -> """
<div class='clipping'></div>
  <div>
    #{output}
  </div>
"""

