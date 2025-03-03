{
    description = "A nixvim configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        nixvim.url = "github:nix-community/nixvim";
        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs =
        {
            nixvim,
            flake-parts,
            nixpkgs,
            ...
        }@inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [
                "x86_64-linux"
                "aarch64-linux"
                "x86_64-darwin"
                "aarch64-darwin"
            ];

            perSystem =
                { system, ... }:
                let
                    nixvimLib = nixvim.lib.${system};
                    nixvim' = nixvim.legacyPackages.${system};
                    nixfmt-overlay = import ./nixfmt.nix;
                    pkgs = import nixpkgs {
                        inherit system;
                        overlays = [ nixfmt-overlay ];
                    };
                    nixvimModule = {
                        inherit pkgs;
                        module = import ./config;
                        extraSpecialArgs = { };
                    };
                    nvim = nixvim'.makeNixvimWithModule nixvimModule;
                in
                {
                    formatter.x86_64-linux = nixpkgs.nixfmt-rfc-style;
                    checks = {
                        default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
                    };
                    packages = {
                        # Lets you run `nix run .` to start nixvim
                        default = nvim;
                    };
                };
        };
}
