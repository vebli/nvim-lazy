{pkgs}:
let
    toLua = str: "lua << EOF\n${str}\nEOF\n;";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n;";
    nvimRtp = pkgs.stdenv.mkDerivation {
        name = "Custom Neovim Config"; 
        src = ../.;
        phases = ["buildPhase"];
        buildPhase = ''
            mkdir -p $out
            cp -r $src/lua $out
        '';
    };
in
{
    neovim = pkgs.neovim.override{
        configure = {
            customRC = '' 
            lua << EOF
            vim.opt.rtp:prepend('${nvimRtp}')
            require("keymaps")
            require("options")
            require("plugins.init")
            EOF

            '';

            packages.all.start = with pkgs.vimPlugins; [
                lazy-nvim
            ];
        };
    };
}
