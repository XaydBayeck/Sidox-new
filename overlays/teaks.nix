self: super:

{
  nushell = super.nushell.override { additionalFeatures = (p: p ++ [ "dataframe" ]); };
}
