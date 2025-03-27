{pkgs}:
let 
    customRC = (import ./nvim.nix{inherit pkgs;}).customRC;
in
{
    neovim = pkgs.neovim.override
    {
        configure = {
            inherit customRC;
            packages.all.start = with pkgs.vimPlugins; [
                lazy-nvim
            ];
        };
    };
    vimPlugins = pkgs.vimPlugins // {
        # ouroboros-nvim = pkgs.vimUtils.buildVimPlugin {
        #     name = "Ouroborus-nvim";
        #     src = builtins.fetchGit{
        #         ref = "master";
        #         rev = "936af28729542298e7d24f4d2df7600c7b2a1efa";
        #         url = "https://github.com/jakemason/ouroboros.nvim";
        #     };
        # };
    };
}
