{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    plastex = pkgs.python3Packages.callPackage ./plastex.nix {};
    pydantic-xml = pkgs.python3Packages.callPackage ./pydantic-xml.nix {};
    pypdf2 = pkgs.python3Packages.callPackage ./pypdf2.nix {};
    pdfcropmargins = pkgs.python3Packages.callPackage ./pdfcropmargins.nix {inherit pypdf2;};
    qrcode = pkgs.python3Packages.callPackage ./qrcode.nix {};
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system}.default = pkgs.python3Packages.callPackage ./pretext.nix {
      inherit
        plastex
        pydantic-xml
        pdfcropmargins
        pypdf2
        qrcode
        ;
    };
  };
}
