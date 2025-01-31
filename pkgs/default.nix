final: prev: {
  pythonPackagesExtensions =
    (prev.pythonPackagesExtensions or [])
    ++ [
      (import ./python)
    ];
  pretext = final.python3Packages.callPackage ./pretext {};
}
