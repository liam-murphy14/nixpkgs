{ callPackage }:

let
  mkChromedriver = callPackage ./generic.nix { };
in
rec {
  electron-chromedriver = electron-chromedriver_29;

  electron-chromedriver_30 = mkChromedriver "30.0.2" {
    armv7l-linux = "e89719043b6ececa7bdef70783556455b8c2aae1b6e20fb4d9328ed46bc590e8";
    aarch64-linux = "689054694b1a8d17e189e5ab1c0beb3331acc3f272fcb3f3b55f58032b22118c";
    x86_64-linux = "5eebd7b53585ee20666212ee349a81f6e45aa37e0741ccaf99eb644d2c1859fc";
    x86_64-darwin = "d92d32e23fc6a2375a1b533e39f3c9ee0fdf4a152d94229ad69536faf9017825";
    aarch64-darwin = "34821b97ec9fe527e6641a3e836233dc9d619972328f487bce68a0af671222cd";
  };

  electron-chromedriver_29 = mkChromedriver "29.3.2" {
    armv7l-linux = "58e8fa6fd7f72330aa897f99f761e171506534459a9f1e2063da43d70eed5212";
    aarch64-linux = "caca0da3e68040865abf5fd9677c8fbdb8ad859874476b5b26a8e884c5d6cd71";
    x86_64-linux = "8501f99f1dc333778efe5947230bd9a3a80e15c2ee6828e46c2d0a62c232af42";
    x86_64-darwin = "043123135a003b6998a11bc71c48ef1276b0499960edb9b898e02811434bc2c9";
    aarch64-darwin = "f0834bb2168b2b6e8a778ec336b25bde8ecdafb0ea5611996b40a1c1af3e174b";
  };

  electron-chromedriver_28 = mkChromedriver "28.3.1" {
    armv7l-linux = "aa4b3951157d0a2b3f35b1c8122c3d0156f33304ea768afd3137e49251bbf48c";
    aarch64-linux = "09a1842368757614c88c79d31c46f03403481ad5348234634a727b89c89d3f2d";
    x86_64-linux = "f0566c9c6124911124ea337db05ad077ed9e3fcfde9fa3d9cf5d9358f751ec00";
    x86_64-darwin = "333f5c3978359553431c6da505d7c8f20f66b0d8b131395bba8ec72f9661be64";
    aarch64-darwin = "ef175c5f3f18e373ab67b863301d437d9ede98af5ce5030fa0e2f64013d1d47f";
  };

  electron-chromedriver_27 = mkChromedriver "27.3.11" {
    armv7l-linux = "cda967fd294aeb2a1a5fc97288f1033c0578f69c2e70575801d697f96a8389d4";
    aarch64-linux = "ebfaee21a1f0040408b27e060666f414844a1a9bd4d6eab75fd1a4448933fc48";
    x86_64-linux = "690fa0b38e029d09f0ef22b0bc3be6c1f0f938c5617449b6005199e4b379ff74";
    x86_64-darwin = "17f12a993835b487f1a3e8e8c7763b0bc50c17ec5ec09dc89c8d3d8383f3efff";
    aarch64-darwin = "d2cd100b7c320ca705268f855a5a71ad5784d43950460187bca25a538ded9f8c";
  };

  electron-chromedriver_24 = mkChromedriver "24.8.6" {
    armv7l-linux = "424b12412504b74bfad0bad2c20d615ead332c957bd57c35c4321e298db06f83";
    aarch64-linux = "4350e7a54e3275e19a52940f58b5cba45ef794fa69d010cec7bd24941612ee48";
    x86_64-linux = "b1fb3d01e71476b081e2bab4b58190abff1a2e329c8377919b39822c07e9f60b";
    x86_64-darwin = "163043ff64f2612e1a32a7cae16e2a4cfbd5b5f49a6f344d26dafd446ae6431e";
    aarch64-darwin = "cc8ed6c19e48197decd5f049f7a1744988cd1006d8a72a29c69bc61962d8896c";
  };
}
