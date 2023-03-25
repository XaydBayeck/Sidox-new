self: super:

{
  leftwm = super.leftwm.overrideAttrs (oldAttrs:
    let
      rpathLibs = oldAttrs.buildInputs;
    in
    {
      postInstall = ''
        for p in $out/bin/left*; do
          patchelf --set-rpath "${super.lib.makeLibraryPath rpathLibs}" $p
        done
      '';
    });
}
