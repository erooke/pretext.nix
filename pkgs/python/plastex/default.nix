{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  # Build
  setuptools,
  # Dependencies
  jinja2,
  unidecode,
  pillow,
  typing-extensions,
}: let
  version = "v3.0";
in
  buildPythonPackage {
    inherit version;
    pname = "plastex";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "plastex";
      repo = "plastex";
      rev = "3.0";
      hash = "sha256-dtZlTkjOJIb5tkUsebjzTYx8inYX2FuyOQlSQVM4uJs=";
    };

    build-system = [
      setuptools
    ];

    dependencies = [
      jinja2
      unidecode
      pillow
      typing-extensions
    ];

    # TODO: enable tests, they just needed more external packages than I wanted
    # to figure out right now
    doCheck = false;
  }
