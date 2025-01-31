{
  description = "A minimal flake loading pretext";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pretext.url = "github:erooke/pretext.nvim";
  };

  outputs = {
    self,
    nixpkgs,
    pretext,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacy.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pretext.pkgs.${system}.pretext
      ];
    };
  };
}
