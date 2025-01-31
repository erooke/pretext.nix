{
  description = "A minimal flake loading pretext";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pretext.url = "github:erooke/pretext.nix";
  };

  outputs = {
    self,
    nixpkgs,
    pretext,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [pretext.overlays.default];
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.pretext
      ];
    };
  };
}
