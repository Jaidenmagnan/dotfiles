{
  description = "A collection of project templates";

  outputs = {...}: {
    templates = {
      minimal = {
        path = ./minimal;
        description = "Minimal boilerplate with nix-systems";
      };
      flake-utils = {
        path = ./flake-utils;
        description = "A basic boilerplate with flake-utils";
      };
      python = {
	path = ./python;
	description = "Python development";
      };
      cpp = {
	path = ./cpp;
	description = "C++ development";
      };
      treefmt = {
        path = ./treefmt;
        description = "Basic flake with a treefmt integration";
      };
      rust = {
        path = ./rust;
        description = "Rust toolchain";
      };
      gleam = {
        path = ./gleam;
        description = "A minimal Gleam project";
      };
    };
  };
}
