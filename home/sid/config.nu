# let carapace_completer = {|spans| 
#   carapace $spans.0 nushell $spans | from json
# }

let fish_completer = {|spans|
  fish --command $'complete "--do-complete=($spans | str join " ")"' | str trim | split row "\n" | each { |line| $line | split column "\t" value description } | flatten
}

let-env config = ($env.config | default {} completions)
let-env config = ($env.config | update completions {
    external: {
      enable: true
      max_results: 100
      completer: $fish_completer
    }
  }
)

# alias
alias ll=ls -l
alias la=ls -la
