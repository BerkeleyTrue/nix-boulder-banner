{
  description = "A `flake-parts` module that adds banners to your nix dev shells";
  output = { ... } : {
    flakeModule = ./nix/flake-module.nix;
  };
}
