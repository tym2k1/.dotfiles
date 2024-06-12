{ inputs, pkgs, config, ... }: {

programs.starship = {
  enable = true;
  enableZshIntegration = true;
  settings = {
    };
  };

home.file.".config/starship.toml".text =
  ''
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](fg:color_acc1)\
$os\
$username\
[](fg:color_acc1 bg:color_acc2)\
$directory\
[](fg:color_acc2 bg:color_acc3)\
$git_branch\
$git_status\
$git_state\
[](fg:color_acc3 bg:color_acc4)\
$c\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:color_acc4 bg:color_acc5)\
$nix_shell\
$docker_context\
$container\
$conda\
[](fg:color_acc5 bg:color_acc6)\
$time\
[ ](fg:color_acc6)\
$line_break$character"""

palette = 'gruvbox_dark'

[palettes.gruvbox_dark]
color_fg = '#${config.lib.stylix.colors.base07}'
color_acc1 = '#${config.lib.stylix.colors.base08}'
color_acc2 = '#${config.lib.stylix.colors.base09}'
color_acc3 = '#${config.lib.stylix.colors.base0A}'
color_acc4 = '#${config.lib.stylix.colors.base0B}'
color_acc5 = '#${config.lib.stylix.colors.base0C}'
color_acc6 = '#${config.lib.stylix.colors.base0D}'
color_acc7 = '#${config.lib.stylix.colors.base0E}'
color_acc8 = '#${config.lib.stylix.colors.base0F}'

[os]
disabled = false
style = "bg:color_acc1 fg:color_fg"

[os.symbols]
NixOS = " "
Windows = "󰍲 "
Ubuntu = "󰕈 "
SUSE = " "
Raspbian = " "
Mint = "󰣭 "
Manjaro = " "
Linux = "󰌽 "
Gentoo = "󰣨 "
Fedora = "󰣛 "
Alpine = " "
Amazon = " "
Android = " "
Arch = "󰣇 "
Artix = "󰣇 "
CentOS = " "
Debian = "󰣚 "
Redhat = "󱄛 "
RedHatEnterprise = "󱄛 "
Kali = " "

[username]
show_always = false
style_user = "bg:color_acc1 fg:color_fg"
style_root = "bg:color_acc1 fg:color_fg"
format = '[ $user ]($style)'

[directory]
style = "fg:color_fg bg:color_acc2"
before_repo_root_style = "fg:color_fg bg:color_acc2"
repo_root_style = "bold fg:color_fg bg:color_acc2"
read_only_style = "fg:color_acc1 bg:color_acc2"
repo_root_format = '[ $before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($repo_root_style)[$read_only ]($read_only_style)'
format = '[ $path]($style)[$read_only ]($read_only_style)'
truncate_to_repo = false
truncation_length = 5
truncation_symbol ="…/"
read_only = " "

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Desktop" = " "

[git_branch]
symbol = ""
style = "bg:color_acc3"
format = '[[ $symbol $branch ](fg:color_fg bg:color_acc3)]($style)'

[git_status]
style = "bg:color_acc3"
format = '[[($all_status$ahead_behind )](fg:color_fg bg:color_acc3)]($style)'

[git_state]
style = "bg:color_acc3"
format = '[$state($progress_current/$progress_total )]($style)'
cherry_pick = ' '
merge = ' '
am = ' '
bisect = '󰃕 '
rebase = ' '
am_or_rebase = ' / '

[nodejs]
symbol = ""
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[c]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[rust]
symbol = "󱘗"
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[golang]
symbol = ""
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[php]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[java]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[kotlin]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[haskell]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[python]
symbol = " "
style = "bg:color_acc4"
format = '[[ $symbol( $version) ](fg:color_fg bg:color_acc4)]($style)'

[nix_shell]
symbol = ""
impure_msg = ""
pure_msg = " 󰕥 "
style = "bg:color_acc5"
format = '[[ $symbol($state $name) ](fg:color_fg bg:color_acc5)]($style)'

[docker_context]
symbol = " "
style = "bg:color_acc5"
format = '[[ $symbol( $context) ](fg:color_fg bg:color_acc5)]($style)'

[container]
symbol = " "
style = "bg:color_acc5"
format = '[[ $symbol( $name) ](fg:color_fg bg:color_acc5)]($style)'

[conda]
style = "bg:color_acc5"
format = '[[ $symbol( $environment) ](fg:color_fg bg:color_acc5)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:color_acc6"
format = '[[  $time ](fg:color_fg bg:color_acc6)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:color_acc3)'
error_symbol = '[](bold fg:color_acc6)'
vimcmd_symbol = '[](bold fg:color_acc3)'
vimcmd_replace_one_symbol = '[](bold fg:color_acc5)'
vimcmd_replace_symbol = '[](bold fg:color_acc5)'
vimcmd_visual_symbol = '[](bold fg:color_acc7)'
  '';

}
