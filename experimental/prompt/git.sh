# Specifies command to check if in a git repo.
# "eval $prompt_test_git_is_git" returns true if in a git repo
: ${prompt_test_git_find_dir:='git rev-parse --git-dir 2>/dev/null'}
: ${prompt_test_git_is_git:='[[ `eval $prompt_test_git_find_dir` = ".git" ]] && '}

# Icons # TODO 
: ${prompt_symbol_git_repo:=''} # Indicates we are in a git repo.
: ${prompt_symbol_git_add:='A'} # Indicates added files
: ${prompt_symbol_git_untracked:='U'} # Indicates untracked files
: ${prompt_symbol_git_mod:='M'} # Indicates unadded modification
: ${prompt_symbol_git_del:='D'} # Indicates unadded deletion.
: ${prompt_symbol_git_push:='P'} # Inducates commits that may be pushed
