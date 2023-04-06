{
  description = "Sid's NixOS redesigning";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    sinur.url = "github:XaydBayeck/Sinur";
    sinur.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, sinur, emacs-overlay, ... } @ inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      overlays = {
        nixpkgs.overlays = [
          # (import ./overlays/teaks.nix)
          (self: super: { sinur = sinur.packages.${system}; })
          emacs-overlay.overlays.emacs
        ];
      };
      home-manager-config = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = inputs // { inherit system; };
        };
      };
    in
    {
      nixosConfigurations.sixos = lib.nixosSystem {
        inherit system;
        specialArgs = inputs // { inherit system; };
        modules = [
          overlays
          ./profiles/sixos/configuration.nix
          home-manager.nixosModules.home-manager
          home-manager-config
        ];
      };
    };
}
