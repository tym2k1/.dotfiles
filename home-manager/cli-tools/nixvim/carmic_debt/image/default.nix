{ inputs, ... }: {

    programs.nixvim = {
        extraLuaPackages = ps: [ ps.magick ];
        plugins = {
            image = {
                enable = true;
                backend = "ueberzug";
            };
        };
    };
}
