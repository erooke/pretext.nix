{
  lib,
  buildPythonApplication,
  pythonOlder,
  fetchPypi,
  # Build
  poetry-core,
  # Dependencies
  gitpython,
  pypdf25,
  click,
  click-log,
  ghp-import,
  jinja2,
  lxml,
  playwright,
  psutil,
  pymupdf,
  qrcode7,
  requests,
  single-version,
  plastex,
  pydantic-xml,
  pdfcropmargins,
  # Check
}: let
  version = "2.12.0";
in
  buildPythonApplication {
    inherit version;
    pname = "pretext";
    pyproject = true;

    disabled = pythonOlder "3.8.5";

    src = fetchPypi {
      inherit version;
      pname = "pretext";
      hash = "sha256-7rEqEh2ZO1xDoMCY7SYZRUL5XNawSZJGbVOtReVhfqk=";
    };

    build-system = [
      poetry-core
    ];

    dependencies = [
      gitpython
      pypdf25
      click
      click-log
      ghp-import
      jinja2
      lxml
      playwright
      psutil
      pymupdf
      qrcode7
      requests
      single-version
      plastex
      pydantic-xml
      pdfcropmargins
    ];
  }
