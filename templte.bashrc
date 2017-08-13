

### KAWAII-TERMINAL!
### .bashrcの最後尾に追加してください
export TERM=xterm-256color
FREE_MEM()
{
   python3 $HOME/kawaii-term/kawaii-term.py --mem
}
CPU_USAGE() 
{ 
  python3 $HOME/kawaii-term/kawaii-term.py --vmstat
}
DISK_USAGE(){
  python3 $HOME/kawaii-term/kawaii-term.py --disk
}
GET_WEATHER() {
  python3 $HOME/kawaii-term/weather.py
}
RIGHT_PRONPT()
{
  # パディング幅を%*s ${COLUMNS}で指定できるが、tmux経由だと、よく破綻しているので、ハードコードでもいいかもしれない
  printf "%*s" 210 "$(tput setaf 199)$(tput bold)$(CPU_USAGE)$(tput sgr0) $(tput setaf 2)$(DISK_USAGE) $(tput setaf 123)[TENKI:$(GET_WEATHER)]$(tput sgr0)"
}

export PS1='$(free_mem) prompt > '
GREEN="\[$(tput setaf 2)\]"
PINK="\[$(tput setaf 199)\]"
YELLOW="\[$(tput setaf 220)\]"
ORANGE="\[$(tput setaf 202)\]"
BLUE="\[$(tput setaf 33)\]"
CYAN="\[$(tput setaf 111)\]"
RESET="\[$(tput sgr0)\]"
ULINE="\[$(tput smul)\]"
EULINE="\[$(tput rmul)\]"
BOLD="\[$(tput bold)\]"
STIM="\[$(tput sitm)\]" # 斜線開始
RTIM="\[$(tput ritm)\]" # 斜線終了
BCC_T="\[$(tput setb 7)\]"
WHOAMI="⚡ "
export PS1="\[\$(tput sc; RIGHT_PRONPT; tput rc)\]$WHOAMI${BCC_T}${BOLD}${YELLOW}@${RESET} ${STIM}${CYAN}[\$(FREE_MEM)]${RESET}${RTIM} ${ULINE}${ORANGE}192.168.15.104${RESET}${EULINE} ${BOLD}${BLUE}=>${RESET}"
