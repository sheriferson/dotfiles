BEGIN {
  clipping = "";
  i=0;
  srand();
}
{
  if ($0 !~ /==========/) {
      clipping = clipping $0 "\n";
  } else {
  clippings[i++] = clipping "\n";
  clipping = "";
}
}
END {
  print clippings[int(rand()*i)];
}
