{
  description = "TODO...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    outputs = flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
        ];
      };
    in rec {
      # packages exported by the flake
      packages = rec {
      };

      # nix fmt
      formatter = pkgs.alejandra;

      # nix develop -c $SHELL
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gnucobol
          gcc14
        ];

        packages = with pkgs; [
        ];

        shellHook = ''
          export IN_NIX_DEVSHELL=1;
        '';
      };
    });
  in
    outputs;
}
