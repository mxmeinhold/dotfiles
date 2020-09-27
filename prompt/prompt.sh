##############################
### Main Prompt Formatting ###
##############################

# $1= text, $2= foreground, $3= background, $4= next bg colour
function prompt_section {
	local prompt_section_div=' '
	echo "${fg[$2]}${bg[$3]}$1${fg[$3]}${bg[$4]}$prompt_section_div$colour_reset"
}

# Standard PS1: green \# grey \A white \u@\h:\W \$
function prompt_std_ps1 {
	local ps_command=$( prompt_section '\#' bright_yellow green bright_black )
	local ps_time=$( prompt_section '\A' white bright_black bright_white )
	#Doesn't assign a next background to leave it as shell default.
	local ps_location=$( prompt_section '\u@\h:\W \$' black bright_white black )

    echo -n $ps_command$ps_time$ps_location
}

# TODO temp until we have git.
PS1=`prompt_std_ps1`

if [ "$SSH_AGENT_SETTING" == "gpg" ] ; then
    PS1="$(prompt_section 'gpg' bright_white bright_red green)$PS1"
elif [ "$(ssh-add -l 2> /dev/null)" ]; then
    PS1="$(prompt_section '!!!' bright_white bright_red green)$PS1"
fi

function radar_prompt {
    local radar_result=`git-radar --bash`
    if [ -z "$radar_result" ]; then
        echo -n ""
    else
        echo $radar_result
    fi
}

# Check if variable is set
if [ -z ${PROMPT_GIT_RADAR+x} ]; then
    # fg: bright cyan, bg: purple, next bg: black
    export GIT_RADAR_COLOR_BRANCH="\\033[0;96m\\033[45m"
    export GIT_RADAR_COLOR_BRANCH_RESET="\\033[0;35m\\033[100m"
    export GIT_RADAR_COLOR_LOCAL_RESET="\\033[0;97m\\033[100m"
    export GIT_RADAR_COLOR_REMOTE_RESET="\\033[0;97m\\033[100m"
    export GIT_RADAR_COLOR_CHANGES_RESET="\\033[0;97m\\033[100m"
    export GIT_RADAR_FORMAT="%{${GIT_RADAR_COLOR_BRANCH}git::branch: }\\033[0;97m\\033[100m %{local}%{changes}%{stash}\\033[90m\\033[40m \\033[0m"
    PROMPT_COMMAND=radar_prompt
fi
