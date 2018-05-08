command: "bash /Users/sherif/dotfiles/Ubersicht/widgets/todos.widget/renderToday.sh"

refreshFrequency: '1m'

style: """
  font-family: -apple-system
  bottom: 70px
  right: 10px
  width: 400px
  padding: 0

  .prefix
    font-family: Fira Code
    font-size: 12px
    opacity: .5
    color: grey
    text-align: right
    float: left
    width: 40px
    padding-right: 10px
    margin-top: 4px

  .task
    font-size: 14px
    font-weight: 100
    line-height: 1.5
    color: #E0FFFF

"""

render: (output) ->
  "<div>#{output}</div>"
