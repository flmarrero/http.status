{
  description = "http.status";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
      flake-utils.lib.eachDefaultSystem
        (system:
          let pkgs = nixpkgs.legacyPackages.${system}; in
          {
            inherit pkgs;
            devShells.default = pkgs.mkShell {
                buildInputs = [
                  (pkgs.haskell.packages.ghc948.ghcWithPackages (pkgs: with pkgs; [ 
                    stack
                    cabal-install
                    haskell-language-server
                    ormolu
                    hlint
                  ]))
                ];
              };
          }
        );
}
