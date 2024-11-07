{ stdenv, dpkg, glibc, gcc-unwrapped, autoPatchelfHook, fetchurl }:
let

  version = "1.8.2";

  src = fetchurl {
    url = "https://apps.athenacrisis.com/athena-crisis-linux.deb";
  };

in stdenv.mkDerivation {
  name = "athenacrisis-${version}";

  system = "x86_64-linux";

  inherit src;

  # Required for compilation
  nativeBuildInputs = [
    autoPatchelfHook # Automatically setup the loader, and do the magic
    dpkg
  ];

  # Required at running time
  buildInputs = [
    glibc
    gcc-unwrapped
  ];

  unpackPhase = "true";

  # Extract and copy executable in $out/bin
  installPhase = ''
    mkdir -p $out
    dpkg -x $src $out
    cp -av $out/opt/Wolfram/WolframScript/* $out
    rm -rf $out/opt
  '';

  meta = with stdenv.lib; {
    description = "Athena Crisis";
    homepage = https://athencrisis.com/;
    license = licenses.unfree;
    maintainers = with stdenv.lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}
