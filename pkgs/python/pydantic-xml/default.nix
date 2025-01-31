{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  # Build
  poetry-core,
  # Dependencies
  pydantic,
  pydantic-core,
  # Check
  pytestCheckHook,
  xmldiff,
}: let
  version = "v2.14.1";
in
  buildPythonPackage {
    inherit version;
    pname = "pydantic-xml";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "dapper91";
      repo = "pydantic-xml";
      rev = version;
      hash = "sha256-m6z3IDAe/hjT3GCKMX+S7UdrUBMEGsi8mc0Km5XWgAU=";
    };

    build-system = [
      poetry-core
    ];

    dependencies = [
      pydantic
      pydantic-core
    ];

    nativeCheckInputs = [
      pytestCheckHook
      xmldiff
    ];
  }
