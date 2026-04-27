function fish_prompt
    set -l last_status $status

    set -l neobrut_user FF6B6B
    set -l neobrut_at CDD6F4
    set -l neobrut_host FFD93D
    set -l neobrut_path A6E3A1
    set -l neobrut_git CBA6F7
    set -l neobrut_arrow 89B4FA
    set -l neobrut_error FF6B6B

    # user@host
    set_color $neobrut_user
    printf '%s' $USER
    set_color $neobrut_at
    printf '@'
    set_color $neobrut_host
    printf '%s ' (prompt_hostname)

    # path
    set_color --bold $neobrut_path
    printf '%s' (prompt_pwd)

    # git branch
    if command -sq git
        if git rev-parse --is-inside-work-tree &>/dev/null
            set_color $neobrut_git
            printf ' (%s)' (git branch --show-current 2>/dev/null; or echo "detached")
        end
    end

    # newline + arrow
    printf '\n'
    if test $last_status -ne 0
        set_color --bold $neobrut_error
    else
        set_color --bold $neobrut_arrow
    end
    printf '> '
    set_color normal
end
