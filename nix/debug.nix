{pkgs}:
let
customRC = (import ./nvim.nix{inherit pkgs;}).customRC;
in
pkgs.stdenv.mkDerivation {
  name = "Nvim Debug";
  phases = ["installPhase"];
  installPhase = ''
    mkdir -p $out
    echo -e "${customRC}" > $out/customRC.lua

  '';
}
