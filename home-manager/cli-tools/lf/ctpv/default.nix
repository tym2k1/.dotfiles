{ config, pkgs, ... }:
{


home.packages = with pkgs; [
  chafa
];

home.file.".config/ctpv/config".text =
  ''
# set forcechafa
# set chafasixel
preview custom_text_preview text/* {{
    bat --style plain --color=always --pager never --theme base16 "''${f}"
}}

preview custom_image_preview image/* {{
    chafa -f sixel --margin-bottom=5 --margin-right=5 --optimize 9 "''${f}"
}}

  '';

}
