# prediction
Import-Module PSReadLine

Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Alt+k -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord Alt+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord
Set-PSReadLineKeyHandler -Chord Ctrl+Spacebar -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete

# cd-utils
Import-Module cd-extras

# ls-icons
Import-Module Terminal-Icons

# fzf
Import-Module PSFzf
Set-PsFzfOption -PsReadlineChordProvider 'Ctrl+t' -PsReadlineChordReverseHistory 'Ctrl+r'

# aliases
Set-Alias open explorer
Set-Alias v vim
Set-Alias l ls
function ll { ls -Force }

# prompt
Invoke-Expression (&starship init powershell)
