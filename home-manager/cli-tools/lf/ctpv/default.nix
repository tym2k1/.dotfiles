{ config, pkgs, ... }:
{


#home.packages = with pkgs; [
#  chafa
#];

home.file.".config/ctpv/config".text =
  ''
#set chafasixel
preview custom_text_preview text/* {{
    bat --style plain --color=always --pager never --theme base16 "''${f}"
}}
  '';

}
