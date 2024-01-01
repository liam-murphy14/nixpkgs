{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, selenium
, requests
, websockets
, electron-chromedriver_30
, python3
}:

let patchPythonPath = ./patchChromedriver.py;
in

buildPythonPackage {
  pname = "undetected-chromedriver";
  version = "3.5.5";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "ultrafunkamsterdam";
    repo = "undetected-chromedriver";
    rev = "0aa5fbe252370b4cb2b95526add445392cad27ba";
    hash = "sha256-Qe+GrsUPnhjJMDgjdUCloapjj0ggFlm/Dr42WLcmb1o=";
  };

  disabled = pythonOlder "3.7";

  buildInputs = [
    electron-chromedriver_30
  ];

  propagatedBuildInputs = [
    selenium
    requests
    websockets
  ];

  # remove items that cause build failures on NixOS
  postConfigure = ''
    substituteInPlace undetected_chromedriver/patcher.py \
      --replace "os.makedirs(self.data_path, exist_ok=True)" "print('test 1')" \
      --replace "os.makedirs(self.zip_path, mode=0o755, exist_ok=True)" "print('test 2')"
  '';

  # run the patch script now since chromedriver won't be writeable after this
  # need to use glob wildcard because electron chromedriver is packaged with extra
  # libraries on darwin platforms that must be copied to $out/bin
  postFixup = ''
    mkdir mutableChromedriverBin
    cp ${electron-chromedriver_30.out}/bin/* mutableChromedriverBin
    chmod +w mutableChromedriverBin/chromedriver
    ${python3.out}/bin/python3 ${patchPythonPath} mutableChromedriverBin/chromedriver
    mkdir $out/bin
    cp mutableChromedriverBin/* $out/bin
  '';

  pythonImportsCheck = [
    "undetected_chromedriver"
  ];

  meta = with lib; {
    homepage = "https://github.com/UltrafunkAmsterdam/undetected-chromedriver";
    changelog = "https://github.com/ultrafunkamsterdam/undetected-chromedriver/blob/master/README.md";
    license = licenses.gpl3Only;
    description = ''
      Selenium.webdriver.Chrome replacement with compatiblity for Brave, and other Chromium based browsers.
    '';
    # undetected-chromedriver will attempt to install a compatible chromedriver binary
    # when undetected-chromedriver.Chrome is instantiated if one is not found in
    # $PATH or passed explicitly as an argument to the constructor
    # this will fail on nixos, so we also install and add the patched version of
    # chromedriver to path with this library
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    maintainers = with maintainers; [ liammurphy14 ];
  };
}

