{pkgs, pkgs-unstable, ...}: with pkgs-unstable; [
    curl #for godbolt
    fzf

    # LSP
    asm-lsp
    cmake-language-server
    arduino-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages_latest.typescript-language-server
    sqls
    nil
    nixd
    vscode-extensions.rust-lang.rust-analyzer
    lua-language-server
    python312Packages.python-lsp-server
    ols
    bash-language-server
    shellcheck
    vue-language-server
    matlab-language-server
    java-language-server
    wasm-language-tools
    texlab
    clang-tools

    # Formatter
    alejandra

] ++ (with pkgs; [
])
