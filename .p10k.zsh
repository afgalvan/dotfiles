'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
    emulate -L zsh -o extended_glob

    unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

    autoload -Uz is-at-least && is-at-least 5.1 || return

    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        os_icon                 # os identifier
        dir                     # current directory
        vcs                     # git status
        docker
        # =========================[ Line #2 ]=========================
        newline                 # \n
        prompt_char             # prompt symbol
    )

    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        context                 # user@hostname
        status                  # exit code of the last command
        command_execution_time  # duration of the last command
        background_jobs         # presence of background jobs
        direnv                  # direnv status (https://direnv.net/)
        # asdf                  # asdf version manager (https://github.com/asdf-vm/asdf)
        package                 # name@version from package.json (https://docs.npmjs.com/files/package.json)
        virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
        gcc_version             # GCC/G++ compiler versions
        anaconda                # conda environment (https://conda.io/)
        pyenv                   # python environment (https://github.com/pyenv/pyenv)
        goenv                   # go environment (https://github.com/syndbg/goenv)
        nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
        nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
        nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
        node_version            # node.js version
        go_version              # go version (https://golang.org)
        rust_version            # rustc version (https://www.rust-lang.org)
        dotnet_version          # .NET version (https://dotnet.microsoft.com)
        php_version             # php version (https://www.php.net/)
        laravel_version         # laravel php framework version (https://laravel.com/)
        java_version            # java version (https://www.java.com/)
        rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
        rvm                     # ruby version from rvm (https://rvm.io)
        fvm                     # flutter version management (https://github.com/leoafarias/fvm)
        luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
        jenv                    # java version from jenv (https://github.com/jenv/jenv)
        plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
        phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
        scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
        haskell_stack           # haskell version from stack (https://haskellstack.org/)
        kubecontext             # current kubernetes context (https://kubernetes.io/)
        terraform               # terraform workspace (https://www.terraform.io)
        aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
        aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
        azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
        gcloud                  # google cloud cli account and project (https://cloud.google.com/)
        google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
        nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
        ranger                  # ranger shell (https://github.com/ranger/ranger)
        nnn                     # nnn shell (https://github.com/jarun/nnn)
        vim_shell               # vim shell indicator (:sh)
        midnight_commander      # midnight commander shell (https://midnight-commander.org/)
        nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
        # vpn_ip                # virtual private network indicator
        # load                    # CPU load
        # disk_usage            # disk usage
        # ram                   # free RAM
        # swap                  # used swap
        todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
        # timewarrior           # timewarrior tracking status (https://timewarrior.net/)
        # taskwarrior           # taskwarrior task count (https://taskwarrior.org/)
        # time                  # current time
        # =========================[ Line #2 ]=========================
        newline
        # ip                    # ip address and bandwidth usage for a specified network interface
        # public_ip             # public IP address
        # proxy                 # system-wide http/https/ftp proxy
        # battery               # internal battery
        # wifi                  # wifi speed
    )

    # Defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
    # When set to `moderate`, some icons will have an extra space after them. This is meant to avoid
    # icon overlap when using non-monospace fonts. When set to `none`, spaces are not added.
    typeset -g POWERLEVEL9K_ICON_PADDING=moderate

    # Basic style options that define the overall look of your prompt. You probably don't want to
    # change them.
    typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
    typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
    typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
    typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol

    # When set to true, icons appear before content on both sides of the prompt. When set
    # to false, icons go after content. If empty or not set, icons go before content in the left
    # prompt and after content in the right prompt.
    #
    # You can also override it for a specific segment:
    #
    #   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
    #
    # Or for a specific segment in specific state:
    #
    #   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
    typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true

    # Add an empty line before each prompt.
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    # Connect left prompt lines with these symbols.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
    # Connect right prompt lines with these symbols.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

    # The left end of left prompt.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
    # The right end of right prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=

    # Ruler, a.k.a. the horizontal line before each prompt. If you set it to true, you'll
    # probably want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false above and
    # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' ' below.
    typeset -g POWERLEVEL9K_SHOW_RULER=false
    typeset -g POWERLEVEL9K_RULER_CHAR='─'        # reasonable alternative: '·'
    typeset -g POWERLEVEL9K_RULER_FOREGROUND=242

    # Filler between left and right prompt on the first prompt line. You can set it to '·' or '─'
    # to make it easier to see the alignment between left and right prompt and to separate prompt
    # from command output. It serves the same purpose as ruler (see above) without increasing
    # the number of prompt lines. You'll probably want to set POWERLEVEL9K_SHOW_RULER=false
    # if using this. You might also like POWERLEVEL9K_PROMPT_ADD_NEWLINE=false for more compact
    # prompt.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
    if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
        # The color of the filler.
        typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=242
        # Add a space between the end of left prompt and the filler.
        typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
        # Add a space between the filler and the start of right prompt.
        typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
        # Start filler from the edge of the screen if there are no left segments on the first line.
        typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
        # End filler on the edge of the screen if there are no right segments on the first line.
        typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
    fi

    #################################[ os_icon: os identifier ]##################################
    # OS identifier color.
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=
    # Make the icon bold.
    typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT}'

    ################################[ prompt_char: prompt symbol ]################################
    # Green prompt symbol if the last command succeeded.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=156
    # Red prompt symbol if the last command failed.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=1
    # Default prompt symbol.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='%Bλ'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='%B✗'
    # Prompt symbol in visual vi mode.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
    # Prompt symbol in overwrite vi mode.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
    # No line terminator if prompt_char is the last segment.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
    # No line introducer if prompt_char is the first segment.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

    ##################################[ dir: current directory ]##################################
    # Default current directory color.
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=12
    typeset -g POWERLEVEL9K_DIR_CONTENT_EXPANSION='%B${P9K_CONTENT}'
    # If directory is too long, shorten some of its segments to the shortest possible unique
    # prefix. The shortened directory can be tab-completed to the original.
    typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
    # Replace removed segment suffixes with this symbol.
    typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
    # Color of the shortened directory segments.
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
    # Color of the anchor directory segments. Anchor segments are never shortened. The first
    # segment is always an anchor.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
    # Display anchor directory segments in bold.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
    # Don't shorten directories that contain any of these files. They are anchors.
    local anchor_files=(
        .bzr
        .citc
        .git
        .hg
        .node-version
        .python-version
        .go-version
        .ruby-version
        .lua-version
        .java-version
        .perl-version
        .php-version
        .tool-version
        .shorten_folder_marker
        .svn
        .terraform
        CVS
        Cargo.toml
        composer.json
        go.mod
        package.json
        stack.yaml
    )
    typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
    typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

    # Enable special styling for non-writable directories. See POWERLEVEL9K_LOCK_ICON and
    # POWERLEVEL9K_DIR_CLASSES below.
    typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v2

    #####################################[ vcs: git status ]######################################
    # Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
    typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON='%255F\uF408 ' # White logo
    typeset -g POWERLEVEL9K_VCS_GIT_GITLAB_ICON='%208F\uF296 ' # Orange logo
    typeset -g POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON='%26F\uF5a7 ' # Blue logo

    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

    function my_git_formatter() {
        emulate -L zsh

        if [[ -n $P9K_CONTENT ]]; then
            # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
            # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
            typeset -g my_git_format=$P9K_CONTENT
            return
        fi

        if (( $1 )); then
            # Styling for up-to-date Git status.
            local       meta='%f'     # default foreground
            local      clean='%255F'   # white foreground
            local   modified='%221F'  # yellow foreground
            local  untracked='%12F'   # blue foreground
            local conflicted='%196F'  # red foreground
        else
            # Styling for incomplete and stale Git status.
            local       meta='%244F'  # grey foreground
            local      clean='%244F'  # grey foreground
            local   modified='%244F'  # grey foreground
            local  untracked='%244F'  # grey foreground
            local conflicted='%244F'  # grey foreground
        fi

        local res
        local where  # branch or tag
        if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
            res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}"
            where=${(V)VCS_STATUS_LOCAL_BRANCH}
            elif [[ -n $VCS_STATUS_TAG ]]; then
            res+="${meta}#"
            where=${(V)VCS_STATUS_TAG}
        fi

        # If local branch name or tag is at most 32 characters long, show it in full.
        # Otherwise show the first 12 … the last 12.
        # Tip: To always show local branch name in full without truncation, delete the next line.
        (( $#where > 32 )) && where[13,-13]="…"

        res+="${clean}${where//\%/%%}"  # escape %

        # Display the current Git commit if there is no branch or tag.
        # Tip: To always display the current Git commit, remove `[[ -z $where ]] &&` from the next line.
        [[ -z $where ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

        # Show tracking branch name if it differs from local branch.
        if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
            res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"  # escape %
        fi

        # ⇣42 if behind the remote.
        (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
        # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
        (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
        # ⇠42 if behind the push remote.
        (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
        (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
        # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
        (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
        # *42 if have stashes.
        (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
        # 'merge' if the repo is in an unusual state.
        [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
        # ~42 if have merge conflicts.
        (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
        # +42 if have staged changes.
        (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
        # !42 if have unstaged changes.
        (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
        # ?42 if have untracked files. It's really a question mark, your font isn't broken.
        # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
        # Remove the next line if you don't want to see untracked files at all.
        (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
        # "─" if the number of unstaged files is unknown. This can happen due to
        # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
        # than the number of files in the Git index, or due to bash.showDirtyState being set to false
        # in the repository config. The number of staged and untracked files may also be unknown
        # in this case.
        (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

        typeset -g my_git_format=$res
    }
    functions -M my_git_formatter 2>/dev/null

    # Don't count the number of unstaged, untracked and conflicted files in Git repositories with
    # more than this many files in the index. Negative value means infinity.
    #
    # If you are working in Git repositories with tens of millions of files and seeing performance
    # sagging, try setting POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY to a number lower than the output
    # of `git ls-files | wc -l`. Alternatively, add `bash.showDirtyState = false` to the repository's
    # config: `git config bash.showDirtyState false`.
    typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

    # Don't show Git status in prompt for repositories whose workdir matches this pattern.
    # For example, if set to '~', the Git repository at $HOME/.git will be ignored.
    # Multiple patterns can be combined with '|': '~(|/foo)|/bar/baz/*'.
    typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

    # Disable the default Git status formatting.
    typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    # Install our own Git status formatter.
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='%B${$((my_git_formatter(1)))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
    # Enable counters for staged, unstaged, etc.
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

    # Icon color.
    typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=202
    typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244

    typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

    # These settings are used for repositories other than Git or when gitstatus fails and
    # Powerlevel10k has to fall back to using vcs_info.
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=119
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=119
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=229

    ##########################[ status: exit code of the last command ]###########################
    # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
    # style them independently from the regular OK and ERROR state.
    typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

    # Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
    # it will signify success by turning green.
    typeset -g POWERLEVEL9K_STATUS_OK=false
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
    typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

    # Status when some part of a pipe command fails but the overall exit status is zero. It may look
    # like this: 1|0.
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=70
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

    # Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
    # it will signify error by turning red.
    typeset -g POWERLEVEL9K_STATUS_ERROR=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
    typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

    # Status when the last command was terminated by a signal.
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
    # Use terse signal names: "INT" instead of "SIGINT(2)".
    typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'

    # Status when some part of a pipe command fails and the overall exit status is also non-zero.
    # It may look like this: 1|0.
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=160
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'

    ###################[ command_execution_time: duration of the last command ]###################
    # Show duration of the last command if takes at least this many seconds.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
    # Show this many fractional digits. Zero means round to seconds.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
    # Execution time color.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
    # Duration format: 1d 2h 3m 4s.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

    #######################[ background_jobs: presence of background jobs ]#######################
    # Don't show the number of background jobs.
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
    # Background jobs color.
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=70
    # Custom icon.
    # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######################[ direnv: direnv status (https://direnv.net/) ]########################
    # Direnv color.
    typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=178
    # Custom icon.
    # typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
    # Default asdf color. Only used to display tools for which there is no color override (see below).
    # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_FOREGROUND.
    typeset -g POWERLEVEL9K_ASDF_FOREGROUND=66

    typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

    typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

    typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

    typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

    # Ruby version from asdf.
    typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=168
    # typeset -g POWERLEVEL9K_ASDF_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Python version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=24
    # typeset -g POWERLEVEL9K_ASDF_PYTHON_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PYTHON_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Go version from asdf.
    typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=81
    # typeset -g POWERLEVEL9K_ASDF_GOLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_GOLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Node.js version from asdf.
    typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=70
    # typeset -g POWERLEVEL9K_ASDF_NODEJS_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Rust version from asdf.
    typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=1
    # typeset -g POWERLEVEL9K_ASDF_RUST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_RUST_SHOW_ON_UPGLOB='*.foo|*.bar'

    # .NET Core version from asdf.
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=134
    # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_DOTNET_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Flutter version from asdf.
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=38
    # typeset -g POWERLEVEL9K_ASDF_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Lua version from asdf.
    typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=32
    # typeset -g POWERLEVEL9K_ASDF_LUA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_LUA_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Java version from asdf.
    typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=32
    # typeset -g POWERLEVEL9K_ASDF_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Perl version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=67
    # typeset -g POWERLEVEL9K_ASDF_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Erlang version from asdf.
    typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=125
    # typeset -g POWERLEVEL9K_ASDF_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Elixir version from asdf.
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=129
    # typeset -g POWERLEVEL9K_ASDF_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Postgres version from asdf.
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=31
    # typeset -g POWERLEVEL9K_ASDF_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_POSTGRES_SHOW_ON_UPGLOB='*.foo|*.bar'

    # PHP version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=99
    # typeset -g POWERLEVEL9K_ASDF_PHP_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PHP_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Haskell version from asdf.
    typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=172
    # typeset -g POWERLEVEL9K_ASDF_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Julia version from asdf.
    typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=70
    # typeset -g POWERLEVEL9K_ASDF_JULIA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_JULIA_SHOW_ON_UPGLOB='*.foo|*.bar'

    ##########[ nordvpn: nordvpn connection status, linux only (https://nordvpn.com/) ]###########
    # NordVPN connection indicator color.
    typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=39
    # Hide NordVPN connection indicator when not connected.
    typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
    typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
    # Custom icon.
    # typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #################[ ranger: ranger shell (https://github.com/ranger/ranger) ]##################
    # Ranger shell color.
    typeset -g POWERLEVEL9K_RANGER_FOREGROUND=178
    # Custom icon.
    # typeset -g POWERLEVEL9K_RANGER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################[ nnn: nnn shell (https://github.com/jarun/nnn) ]#######################
    # Nnn shell color.
    typeset -g POWERLEVEL9K_NNN_FOREGROUND=72
    # Custom icon.
    # typeset -g POWERLEVEL9K_NNN_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########################[ vim_shell: vim shell indicator (:sh) ]###########################
    # Vim shell indicator color.
    typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=34
    # Custom icon.
    # typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######[ midnight_commander: midnight commander shell (https://midnight-commander.org/) ]######
    # Midnight Commander shell color.
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=178
    # Custom icon.
    # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #[ nix_shell: nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html) ]##
    # Nix shell color.
    typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=74

    # Tip: If you want to see just the icon without "pure" and "impure", uncomment the next line.
    # typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=

    # Custom icon.
    # typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##################################[ disk_usage: disk usage ]##################################
    # Colors for different levels of disk usage.
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=35
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=220
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=160
    # Thresholds for different levels of disk usage (percentage points).
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
    # If set to true, hide disk usage when below $POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL percent.
    typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################################[ ram: free RAM ]#######################################
    # RAM color.
    typeset -g POWERLEVEL9K_RAM_FOREGROUND=66
    # Custom icon.
    # typeset -g POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #####################################[ swap: used swap ]######################################
    # Swap color.
    typeset -g POWERLEVEL9K_SWAP_FOREGROUND=96
    # Custom icon.
    # typeset -g POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################################[ load: CPU load ]######################################
    # Show average CPU load over this many last minutes. Valid values are 1, 5 and 15.
    typeset -g POWERLEVEL9K_LOAD_WHICH=5
    # Load color when load is under 50%.
    typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=66
    # Load color when load is between 50% and 70%.
    typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=178
    # Load color when load is over 70%.
    typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=166
    # Custom icon.
    # typeset -g POWERLEVEL9K_LOAD_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
    # Todo color.
    typeset -g POWERLEVEL9K_TODO_FOREGROUND=110
    # Hide todo when the total number of tasks is zero.
    typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
    # Hide todo when the number of tasks after filtering is zero.
    typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

    ###########[ timewarrior: timewarrior tracking status (https://timewarrior.net/) ]############
    # Timewarrior color.
    typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=110
    typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='%B${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_TIMEWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
    # Taskwarrior color.
    typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=74

    ##################################[ context: user@hostname ]##################################
    # Context color when running with privileges.
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=178
    # Context color in SSH without privileges.
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=180
    # Default context color (no privileges, no SSH).
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180

    # Context format when running with privileges: bold user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
    # Context format when in SSH without privileges: user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
    # Default context format (no privileges, no SSH): user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

    # Don't show context unless running with privileges or in SSH.
    # Tip: Remove the next line to always show context.
    typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

    ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
    # Python virtual environment color.
    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=24
    typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='%B${P9K_CONTENT}'
    # Don't show Python version next to the virtual environment name.
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
    # If set to "false", won't show virtualenv if pyenv is already shown.
    # If set to "if-different", won't show virtualenv if it's the same as pyenv.
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
    # Separate environment name from Python version only with a space.
    typeset -g POWERLEVEL9K_VIRTUALENV_LEFT_DELIMITER="%242Fon%24F "
    typeset -g POWERLEVEL9K_VIRTUALENV_RIGHT_DELIMITER=""
    # typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='🐍️'

    #####################[ anaconda: conda environment (https://conda.io/) ]######################
    # Anaconda environment color.
    typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=24

    typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='%B${${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}:-${CONDA_PREFIX:t}}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
    # Pyenv color.
    typeset -g POWERLEVEL9K_PYENV_FOREGROUND=24
    # Hide python version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
    # If set to false, hide python version if it's the same as global:
    # $(pyenv version-name) == $(pyenv global).
    typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide python version if it's equal to "system".
    typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

    typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='%B${P9K_CONTENT}${${P9K_PYENV_PYTHON_VERSION:#$P9K_CONTENT}:+ v$P9K_PYENV_PYTHON_VERSION}'

    # typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
    # Goenv color.
    typeset -g POWERLEVEL9K_GOENV_FOREGROUND=81
    typeset -g POWERLEVEL9K_GOENV_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    # Hide go version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
    # If set to false, hide go version if it's the same as global:
    # $(goenv version-name) == $(goenv global).
    typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide go version if it's equal to "system".
    typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
    # Nodenv color.
    typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70
    # Hide node version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
    # If set to false, hide node version if it's the same as global:
    # $(nodenv version-name) == $(nodenv global).
    typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide node version if it's equal to "system".
    typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
    # Nvm color.
    typeset -g POWERLEVEL9K_NVM_FOREGROUND=10
    typeset -g POWERLEVEL9K_NVM_VISUAL_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    # Custom icon.
    typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⬢ '

    ############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
    # Nodeenv color.

    typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=10
    # Don't show Node version next to the environment name.
    typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
    # Separate environment name from Node version only with a space.
    typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
    # Custom icon.
    typeset -g POWERLEVEL9K_NODE_VERSION_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⬢ '

    ##############################[ node_version: node.js version ]###############################
    # Node version color.
    typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=10
    typeset -g POWERLEVEL9K_NODE_VERSION_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    # Show node version only when in a directory tree containing package.json.
    typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
    # Custom icon.
    typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⬢ '

    #######################[ go_version: go version (https://golang.org) ]########################
    # Go version color.
    typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=81
    # Show go version only when in a go project subdirectory.
    typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
    # Rust version color.
    typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=1
    typeset -g POWERLEVEL9K_RUST_VERSION_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    # Show rust version only when in a rust project subdirectory.
    typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true
    # Custom icon.
    typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='🦀️'

    ###############[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]################
    # .NET version color.
    typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=134
    typeset -g POWERLEVEL9K_DOTNET_VERSION_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'

    # Show .NET version only when in a .NET project subdirectory.
    typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_DOTNET_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #####################[ php_version: php version (https://www.php.net/) ]######################
    # PHP version color.
    typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=99
    # Show PHP version only when in a PHP project subdirectory.
    typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PHP_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ laravel_version: laravel php framework version (https://laravel.com/) ]###########
    # Laravel version color.
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=161
    # Custom icon.
    # typeset -g POWERLEVEL9K_LARAVEL_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ####################[ java_version: java version (https://www.java.com/) ]####################
    # Java version color.
    typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=130
    typeset -g POWERLEVEL9K_JAVA_VERSION_CONTENT_EXPANSION='%Bv${P9K_CONTENT}'
    # Show java version only when in a java project subdirectory.
    typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
    # Show brief version.
    typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_JAVA_VERSION_VISUAL_IDENTIFIER_EXPANSION='☕️'

    ###[ package: name@version from package.json (https://docs.npmjs.com/files/package.json) ]####
    # Package color.
    typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=243
    # Package format. The following parameters are available within the expansion.
    #
    # - P9K_PACKAGE_NAME     The value of `name` field in package.json.
    # - P9K_PACKAGE_VERSION  The value of `version` field in package.json.
    #
    typeset -g POWERLEVEL9K_PACKAGE_CONTENT_EXPANSION='%B%9Fv${P9K_PACKAGE_VERSION//\%/%%} '
    # Custom icon.
    typeset -g POWERLEVEL9K_PACKAGE_VISUAL_IDENTIFIER_EXPANSION='%Bis 📦️' # │

    #############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
    # Rbenv color.
    typeset -g POWERLEVEL9K_RBENV_FOREGROUND=168
    # Hide ruby version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
    # If set to false, hide ruby version if it's the same as global:
    # $(rbenv version-name) == $(rbenv global).
    typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide ruby version if it's equal to "system".
    typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######################[ rvm: ruby version from rvm (https://rvm.io) ]########################
    # Rvm color.
    typeset -g POWERLEVEL9K_RVM_FOREGROUND=168
    # Don't show @gemset at the end.
    typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
    # Don't show ruby- at the front.
    typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ fvm: flutter version management (https://github.com/leoafarias/fvm) ]############
    # Fvm color.
    typeset -g POWERLEVEL9K_FVM_FOREGROUND=38
    # Custom icon.
    # typeset -g POWERLEVEL9K_FVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
    # Lua color.
    typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=32
    # Hide lua version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
    # If set to false, hide lua version if it's the same as global:
    # $(luaenv version-name) == $(luaenv global).
    typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide lua version if it's equal to "system".
    typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###############[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
    # Java color.
    typeset -g POWERLEVEL9K_JENV_FOREGROUND=32
    # Hide java version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
    # If set to false, hide java version if it's the same as global:
    # $(jenv version-name) == $(jenv global).
    typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide java version if it's equal to "system".
    typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ plenv: perl version from plenv (https://github.com/tokuhirom/plenv) ]############
    # Perl color.
    typeset -g POWERLEVEL9K_PLENV_FOREGROUND=67
    # Hide perl version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
    # If set to false, hide perl version if it's the same as global:
    # $(plenv version-name) == $(plenv global).
    typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide perl version if it's equal to "system".
    typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ############[ phpenv: php version from phpenv (https://github.com/phpenv/phpenv) ]############
    # PHP color.
    typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=99
    # Hide php version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
    # If set to false, hide php version if it's the same as global:
    # $(phpenv version-name) == $(phpenv global).
    typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide php version if it's equal to "system".
    typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PHPENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######[ scalaenv: scala version from scalaenv (https://github.com/scalaenv/scalaenv) ]#######
    # Scala color.
    typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND=160
    typeset -g POWERLEVEL9K_SCALAENV_SOURCES=(shell local global)
    typeset -g POWERLEVEL9K_SCALAENV_PROMPT_ALWAYS_SHOW=false
    typeset -g POWERLEVEL9K_SCALAENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_SCALAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ haskell_stack: haskell version from stack (https://haskellstack.org/) ]###########
    # Haskell color.
    typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=172
    # Hide haskell version if it doesn't come from one of these sources.
    #
    #   shell:  version is set by STACK_YAML
    #   local:  version is set by stack.yaml up the directory tree
    #   global: version is set by the implicit global project (~/.stack/global-project/stack.yaml)
    typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
    # If set to false, hide haskell version if it's the same as in the implicit global project.
    typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true
    # typeset -g POWERLEVEL9K_HASKELL_STACK_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
    typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile'
    typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
    '*'       DEFAULT)
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=134
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
    # Show P9K_KUBECONTEXT_CLOUD_CLUSTER if it's not empty and fall back to P9K_KUBECONTEXT_NAME.
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
    # Append the current context's namespace if it's not "default".
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

    # Custom prefix.
    # typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='%fat '

    ################[ terraform: terraform workspace (https://www.terraform.io) ]#################
    # Don't show terraform workspace if it's literally "default".
    typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
    typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
    '*'         OTHER)
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=38
    # typeset -g POWERLEVEL9K_TERRAFORM_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
    # Show aws only when the the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show aws.
    typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi|terragrunt'

    typeset -g POWERLEVEL9K_AWS_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
    '*'       DEFAULT)
    typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=208
    # typeset -g POWERLEVEL9K_AWS_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #[ aws_eb_env: aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/) ]#
    # AWS Elastic Beanstalk environment color.
    typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=70
    # typeset -g POWERLEVEL9K_AWS_EB_ENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ azure: azure account name (https://docs.microsoft.com/en-us/cli/azure) ]##########
    typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi|terragrunt'
    typeset -g POWERLEVEL9K_AZURE_FOREGROUND=32
    # typeset -g POWERLEVEL9K_AZURE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
    typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs'
    typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=32

    typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
    typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

    typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi|terragrunt'

    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
        # '*:*prod*:*'  PROD    # These values are examples that are unlikely
        # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
    '*'             DEFAULT)
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=32
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

    ###############################[ public_ip: public IP address ]###############################
    # Public IP color.
    typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=94
    # typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ########################[ vpn_ip: virtual private network indicator ]#########################
    typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=81
    typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
    typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(gpd|wg|(.*tun))[0-9]*'
    typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false
    # typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ ip: ip address and bandwidth usage for a specified network interface ]###########
    typeset -g POWERLEVEL9K_IP_FOREGROUND=38
    typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='$P9K_IP_IP${P9K_IP_RX_RATE:+ %70F⇣$P9K_IP_RX_RATE}${P9K_IP_TX_RATE:+ %215F⇡$P9K_IP_TX_RATE}'
    typeset -g POWERLEVEL9K_IP_INTERFACE='e.*'
    # typeset -g POWERLEVEL9K_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #########################[ proxy: system-wide http/https/ftp proxy ]##########################
    typeset -g POWERLEVEL9K_PROXY_FOREGROUND=68
    # typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################################[ battery: internal battery ]#################################
    # Show battery in red when it's below this level and not connected to power supply.
    typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
    typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=160
    # Show battery in green when it's charging or fully charged.
    typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=70
    # Show battery in yellow when it's discharging.
    typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=178
    # Battery pictograms going from low to high level of charge.
    typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
    # Don't show the remaining time to charge/discharge.
    typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

    #####################################[ wifi: wifi speed ]#####################################
    typeset -g POWERLEVEL9K_WIFI_FOREGROUND=68
    ####################################[ time: current time ]####################################
    # Current time color.
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
    typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
    typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

    function prompt_docker() {
        if [ ! -x "$(command -v docker)" ]; then
            return
        fi
        local docker_version=$(docker --version | grep -o -E "([0-9]*\.[0-9])+" | head -1)

        if [ $(exa -aF | grep -E "[^/]$" | grep -iE "docker|Docker") ] || [ $DOCKER_ON -ne 0 ]; then
            p10k segment -f 33 -i $' \uF308'  -t "%Bv$docker_version "
        fi
    }

    function instant_docker() {
        prompt_docker
    }

    function prompt_gcc_version() {
        local gcc_v=$(gcc --version | grep -o -E "([0-9]*\.[0-9])+" | head -1)

        if [ $(exa | grep -E "\.c$" | head -1) ]; then
            p10k segment -f 243 -i $'\uE61E'  -t "%Bv$gcc_v "
            elif [ $(exa | grep -E "\.cpp$" | head -1) ]; then
            p10k segment -f 125 -i $'\uE61D'  -t "%Bv$gcc_v "
        fi
    }

    function instant_gcc_version() {
        gcc_version
    }

    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

    typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

    (( ! $+functions[p10k] )) || p10k reload
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
