{
  description = "Sid's NixOS redesigning";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # sinur.url = "github:XaydBayeck/Sinur";
    # sinur.inputs.nixpkgs.follows = "nixpkgs";

    # wezterm.url = "github:wez/wezterm/main?dir=nix";
    # wezterm.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-generators,... } @ inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      overlays = {
        nixpkgs.overlays = [
          (import ./overlays/teaks.nix)
          (import ./overlays/packages.nix)
          # (self: super: { 
          #   sinur = sinur.packages.${system}; 
          #   wezterm = wezterm.packages.${system}.default;
          # })
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
        packages.${system} = {
          doimg = nixos-generators.nixosGenerate {
            inherit system;
            specialArgs = inputs // { inherit system; };
            modules = [
              ./profiles/doimage/configuration.nix
            ];
            format = "do";
          };
        };
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
        nixosConfigurations.pythonix = lib.nixosSystem {
          inherit system;
          specialArgs = inputs // { inherit system; };
          modules = [
            overlays
            ./profiles/pythonix/configuration.nix
            home-manager.nixosModules.home-manager
            home-manager-config
            "${inputs.nixpkgs}/nixos/modules/virtualisation/virtualbox-image.nix"
          ];
        };
        nixosConfigurations.doimage = lib.nixosSystem {
          inherit system;
          specialArgs = inputs // { inherit system; };
          modules = [ 
            ./profiles/doimage/configuration.nix
          ];
        };
      };
}
