source ~/.prompt/colour.sh


# $1= text, $2= foreground, $3= background, $4= bg colour as foreground, $5= next bg colour
function prompt_section {
	local prompt_section_div=' '
	echo $2$3$1$4$5$prompt_section_div$colour_reset
}

# Standard PS1: green \# grey \A white \u@\h:\W \$
function prompt_std_ps1 {
	local ps_command=$( prompt_section '\#' $colour_bright_yellow $colour_background_green $colour_green $colour_background_bright_black )
	local ps_time=$( prompt_section '\A' $colour_white $colour_background_bright_black $colour_bright_black $colour_background_bright_white )
	#Doesn't assign a next background to leave it as shell default.
	local ps_location=$( prompt_section '\u@\h:\W \$' $colour_black $colour_background_bright_white $colour_bright_white '' )

	prompt_ps1=$ps_command$ps_time$ps_location
}

# TODO temp until we have git.
prompt_std_ps1
PS1=$prompt_ps1
