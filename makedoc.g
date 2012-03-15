##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

Read( "ListOfDocFiles.g" );

PrintTo( "VERSION", PackageInfo( "PDivisors" )[1].Version );

MakeGAPDocDoc( "doc", "PDivisors", list, "PDivisors" );

GAPDocManualLab( "PDivisors" );

quit;
