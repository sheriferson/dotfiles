# In an interactive session
# use rdoc's formatting of help/man pages
if (interactive()) {
  library(utils)
  rdoc::use_rdoc()
}

options(
    # color scheme see [here](https://help.farbox.com/pygments.html)
    # for a list of supported color schemes, default is `"native"`
    radian.color_scheme = "default",

    # either  `"emacs"` (default) or `"vi"`.
    radian.editing_mode = "vi",

    # auto match brackets and quotes
    radian.auto_match = TRUE,

    # auto indentation for new line and curly braces
    radian.auto_indentation = TRUE,
    radian.tab_size = 2,

    # pop up completion while typing
    radian.complete_while_typing = FALSE,
    # timeout in seconds to cancel completion if it takes too long
    # set it to 0 to disable it
    radian.complete_timeout = 0.05,

    # automatically adjust R buffer size based on terminal width
    radian.auto_width = TRUE,

    # insert new line between prompts
    radian.insert_new_line = TRUE,

    # when using history search (ctrl-r/ctrl-s in emacs mode), do not show duplicate results
    radian.history_search_no_duplicates = FALSE,

    # custom prompt for different modes
    radian.prompt = "\033[0;34mr$>\033[0m ",
    radian.shell_prompt = "\033[0;31m#!>\033[0m ",
    radian.browse_prompt = "\033[0;33mBrowse[{}]>\033[0m ",

    # supress the loading message for reticulate
    radian.suppress_reticulate_message = TRUE,
    # enable reticulate prompt and trigger `~`
    radian.enable_reticulate_prompt = FALSE
)

# set up lintr options for use with coc-r-lsp
setHook(
    packageEvent("languageserver", "onLoad"),
    function(...) {
        options(languageserver.default_linters = lintr::with_defaults(
            line_length_linter = lintr::line_length_linter(100),
            single_quotes_linter = NULL
        ))
    }
)
