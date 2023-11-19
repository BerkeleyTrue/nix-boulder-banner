{
  description = "A `flake-parts` module that adds banners to your nix dev shells";
  outputs = { ... } : {
    flakeModule = ./boulder;
  };
}
