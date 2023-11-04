{
  description = "A `flake-parts` module that adds banners to your nix dev shells";
  outputs = { ... } : {
    flakeModule = ./nix/flake-module.nix;
  };
}
