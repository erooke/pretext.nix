{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  # Build
  setuptools,
  # Dependencies
  pillow,
  pymupdf,
  wheel,
  pypdf25,
}: let
  version = "1.0.9";
in
  buildPythonPackage {
    inherit version;
    pname = "pdfcropmargins";
    pyproject = true;

    src = fetchPypi {
      inherit version;
      pname = "pdfCropMargins";
      hash = "sha256-6bEwTgeVXusKO0QFNPXujA2En/mN1DPbDO4TRr5KBeI=";
    };

    build-system = [
      setuptools
    ];

    dependencies = [
      pillow
      pymupdf
      wheel
      pypdf25
    ];
  }
