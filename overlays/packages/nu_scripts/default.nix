{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "nu_scripts";
  version = "main";

  src = fetchFromGitHub {
    owner = "nushell";
    repo = "nu_scripts";
    rev = "2d12532495dc7ca92554568197dbb61ccf94005d";
    fetchSubmodules = false;
    sha256 = "sha256-hTdy4TpdaWNeqRsBudL/26CWhNhHBZaUAG81GJSTXSo=";
  };

  installPhase = ''
    mkdir -p $out
    mv ./* $out/
  '';
}
