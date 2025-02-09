{ pkgs, ... }: {

    programs.nixvim = {
        extraPlugins = [
            (pkgs.vimUtils.buildVimPlugin {
                name = "vim-graphical-preview";
                src = pkgs.fetchFromGitHub {
                    owner = "bytesnake";
                    repo = "vim-graphical-preview";
                    rev = "d5692493d33d5c9d776e94c9d77493741a3293c8";
                    hash = "sha256-17ieosWi5fffGl5qyS1hMpnNVxoNxmaFRTrpVIYh/PA=";
                };
            })
            (pkgs.vimUtils.buildVimPlugin {
                name = "libcallex-vim";
                src = pkgs.fetchFromGitHub {
                    owner = "mattn";
                    repo = "libcallex-vim";
                    rev = "5b1d636910f492239f52af641082dc54bd421acf";
                    hash = "sha256-kYNU1e1V8FRK6ayIpymOErYvEN10YIPb6g/mP4o0J58=";
                };
                nativeBuildInputs = [ pkgs.libffi ];
                postInstall = ''
                  make -C autoload
                  cp autoload/libcallex.so $out/autoload
                '';
            })
        ];
    };
}
