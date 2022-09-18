{ lib, buildPythonPackage, fetchpatch, fetchPypi, pythonOlder, typing-extensions
, cython, cmake, python3Packages }:

buildPythonPackage rec {
  pname = "sewar";
  version = "0.4.5";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qAwWDczKFVBdDZE41dE7l8I4eaYs/k5gu5hvmNGmcJg=";
  };

  propagatedBuildInputs = with python3Packages; [ pillow scipy ];

  checkInputs = with python3Packages; [ nose ];

  meta = with lib; {
    description =
      "Sewar is a python package for image quality assessment using different metrics.";
    license = licenses.mit;
    homepage = "https://github.com/andrewekhalel/sewar";
    maintainers = with maintainers; [ oliverevans96 ];
  };
}
