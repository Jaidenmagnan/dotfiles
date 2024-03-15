{

    description = "My configuration flake";

    inputs = {
	    nixpkgs = "nixpkgs/nixos-unstable";
        };
    outputs = {self, nixpkgs, ...};
    let
	lib = nixpkgs.lib;
    in {
	nixosConfigurations = {
	    jaiden = lib.nixosSystem {
		system = "x86_64-linux";
		modules = [ ./configuration.nix ];
	    };
	};
    };

}
