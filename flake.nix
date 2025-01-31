{
  description = "Pretext packaged precariously with nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    overlay = import ./pkgs;
    pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [
      overlay
    ];
  in {
    formatter.${system} = pkgs.alejandra;

    packages.${system} = {
      default = pkgs.pretext;
      pretext = pkgs.pretext;
    };

    overlays.default = overlay;

    templates.default = {
      path = ./templates/minimal;
      description = "Minimal example of using pretext with flakes";
    };
  };
}
