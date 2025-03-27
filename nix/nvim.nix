{pkgs}:
let
    nvimRtp = pkgs.stdenv.mkDerivation {
        name = "Custom Neovim Config"; 
        src = ../.;
        phases = ["buildPhase"];
        buildPhase = ''
            mkdir -p $out
            cp -r $src/lua $out
        '';
    };
    customRC  = ''
            lua << EOF
            vim.opt.rtp:prepend('${nvimRtp}')
            require("keymaps")
            require("options")
            require("plugins.init")
            vim.cmd("colorscheme minimal")
    '';
in
{
    inherit nvimRtp customRC;
}
