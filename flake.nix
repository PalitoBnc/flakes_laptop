{
  description = "Henry's NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		nixpkgs.url = "github:PalitoBnc/nixvim";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
      ];
    };
  };
}
