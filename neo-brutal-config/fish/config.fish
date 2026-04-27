if status is-interactive
    # Neobrut Dark theme colors
    set -g fish_color_normal CDD6F4
    set -g fish_color_command 89B4FA
    set -g fish_color_keyword CBA6F7
    set -g fish_color_quote A6E3A1
    set -g fish_color_redirection FAB387
    set -g fish_color_end CBA6F7
    set -g fish_color_error FF6B6B
    set -g fish_color_param A6E3A1
    set -g fish_color_option FAB387
    set -g fish_color_comment 6C7086
    set -g fish_color_match --background=313244
    set -g fish_color_selection CDD6F4 --bold --background=313244
    set -g fish_color_search_match --bold --background=313244
    set -g fish_color_history_current --bold
    set -g fish_color_operator CBA6F7
    set -g fish_color_escape FAB387
    set -g fish_color_cwd A6E3A1
    set -g fish_color_cwd_root FF6B6B
    set -g fish_color_valid_path --underline
    set -g fish_color_autosuggestion 6C7086
    set -g fish_color_user FF6B6B
    set -g fish_color_host FFD93D
    set -g fish_color_cancel FF6B6B
    set -g fish_pager_color_completion CDD6F4
    set -g fish_pager_color_description 6C7086
    set -g fish_pager_color_prefix FFD93D --bold --underline
    set -g fish_pager_color_progress 89B4FA

    set -g fish_prompt_pwd_dir_length 1
end

set -gx EDITOR vim
set -gx COLORTERM truecolor
