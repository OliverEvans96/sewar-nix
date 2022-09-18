{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        sewar = pkgs.python3.pkgs.callPackage ./default.nix { };
        pythonEnv = pkgs.python3.withPackages (p: [ sewar p.ipython ]);
      in {
        apps.ipython = {
          type = "app";
          program = "${pythonEnv}/bin/ipython";
        };
        packages.default = sewar;
      });
}
