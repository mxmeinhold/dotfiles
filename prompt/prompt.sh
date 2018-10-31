source ~/.prompt/colour.sh

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
