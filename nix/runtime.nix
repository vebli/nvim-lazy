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
    nixd
    vscode-extensions.rust-lang.rust-analyzer
    lua-language-server
    pyright
    ols
    bash-language-server
    shellcheck
    vue-language-server
    matlab-language-server
    java-language-server
    wasm-language-tools
    texlab
    clang-tools
    glsl_analyzer

    # Formatter
    alejandra

] ++ (with pkgs; [
])
