{
  python3Packages,
  fetchPypi,
  ...
}:

python3Packages.buildPythonApplication rec {
  pname = "ricksay";
  version = "0.2.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-VTTJmyyCwDUR2hGZwBq5svKYH1I7LFD2zU8R1eDRLew=";
  };

  dependencies = with python3Packages; [ click ];
}
