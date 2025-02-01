# pretext.nix

Nix flake packaging the [pretext](https://pretextbook.org/) cli. To start a new
project run:

```nix
nix flake init -t github:erooke/pretext.nix
nix develop
```

This will drop you into an environment with the pretext cli. From there you can
run the pretext cli as outlined in their
[documentation](https://pretextbook.org/doc/guide/html/processing-CLI.html). 

Right now this doesn't setup any other executables. You can modify the
generated `flake.nix` to install latex or whatever else you might need.

## todo

I am not sure if it will be possible to upstream this to nixpkgs due to pretext
relying on out of date libraries. It would be nice to upstream it if possible.
Before that happens there are a couple things which need to happen.

- [ ] enable testing for plastex, this should be easy
- [ ] enable testing for pretext. I am not 100% on the best way to do this.
  Pretext does some very not-nix-friendly fetching of dependencies at build
  time and some node building as well. Right now to get around that we pull the
  source from pypi which has all that done already... however this means the
  test suite is gone. We could either figure out how to do all the fetching and
  what not or pull the test suite in from github. I don't know what the best
  thing for nixpkgs would be.
