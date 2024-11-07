{ lib, fetchurl, appimageTools }:

let 
  version = "latest";
  pname = "hiddify";

  src = fetchurl {
    url = "https://github.com/hiddify/hiddify-next/releases/${version}/download/Hiddify-Linux-x64.AppImage"
  };

  appimageContents = appimageTools.extract { inherit pname version src; };

in appimageTools.wrapType2 {
  inherit pname version src;


  extraInstallCommands = ''
    instal -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = {
    description = "Cross Platform Multi Protocol Proxy Frontend";
    homepage = "https://hiddify.com";
    platforms = [ "x86_64-linux" ];
  }
}
