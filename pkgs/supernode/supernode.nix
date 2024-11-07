{ stdenv, auto-patchelf }:
stdenv.stdenv.mkDerivation (finalAttrs: {
  pname = "supernode";
  version = "theonlyone";

  src = ./Supernode.x86;
  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -m 755 ./Supernode.x86 $out/bin
    runHook postInstall
  '';

})
