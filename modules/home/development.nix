{
  config.flake.homeModules.development =
    { pkgs, ... }:

    {
      programs.cargo = {
        enable = true;
        settings = {
          build.rustc-wrapper = "sccache";

          target = {
            "x86_64-unknown-linux-gnu" = {
              linker = "clang";
              rustflags = [ "-Clink-arg=--ld-path=${pkgs.wild}/bin/wild" ];
            };

            "aarch64-unknown-linux-gnu" = {
              linker = "${pkgs.pkgsCross.aarch64-multiplatform.buildPackages.gcc}/bin/gcc";
            };
          };
        };
      };
    };
}
