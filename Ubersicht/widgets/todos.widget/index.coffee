command: "bash /Users/sherif/dotfiles/Ubersicht/widgets/todos.widget/renderToday.sh"

refreshFrequency: '1m'

style: """
  font-family: -apple-system
  background: rgba(0, 0, 0, .8)
  border-radius: 5px
  bottom: 40px
  right: 30px
  padding: 20px

  .prefix
    font-family: Fira Code
    font-size: 12px
    color: grey
    text-align: right
    float: left
    width: 20px
    padding-right: 10px
    margin-top: 4px

  .task
    font-size: 14px
    font-weight: 100
    line-height: 1.5
    color: #E0FFFF
    padding-left: 30px

"""

render: (output) ->
  "<div>#{output}</div>"
