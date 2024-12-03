{
  lib,
  fetchzip,
  stdenv,
  ...
}:

stdenv.mkDerivation rec {
  pname = "tetrs";
  version = "v0.2.4";

  src = fetchzip {
    url = "https://github.com/Strophox/tetrs/releases/download/${version}/x86_64-unknown-linux-gnu.zip";
    hash = "sha256-9PDOyrJ8v12vSayCyFOmrBRK9+L7aMwujcEHkC1zgpc=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp tetrs_tui $out/bin/tetrs
  '';

  meta = {
    description = "Tetris Terminal Application in Rust";
    homepage = "https://github.com/Strophox/tetrs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
