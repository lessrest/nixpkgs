{ stdenv, fetchFromGitHub, perl, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  name = "parity-${version}";
  version = "1.4.9";

  src = fetchFromGitHub {
    owner = "ethcore";
    repo = "parity";
    rev = "v${version}";
    sha256 = "0r61sms436p6nyf19hpbx00va1cm2crc5y19hans68c13dbi6vyy";
  };

  buildInputs = [ perl ];
  depsSha256 = "1bc9saxc0cp2y29v01qy8d9zq50gxbrsjmrvvzmci3p9ngdchay9";

  meta = {
    description = "Fast, light, robust Ethereum implementation";
    homepage = http://ethcore.io/parity;
    license = stdenv.lib.licenses.gpl3;
    inherit version;
  };
}
