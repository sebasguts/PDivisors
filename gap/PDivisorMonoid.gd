#############################################################################
##
##  PDivisorMonoid.gd         PDivisor package         Sebastian Gutsche
##
##  Copyright 2011 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  The monoid of PDivisors.
##
#############################################################################

DeclareCategory( "IsPDivisorMonoid",
                 IsObject );

####################################
##
## Attributes
##
####################################

DeclareAttribute( "Variety",
                  IsPDivisorMonoid );

DeclareAttribute( "CommonTailCone",
                  IsPDivisorMonoid );

DeclareOperation( "PrimeDivisorsOfMonoid",
                  [ IsPDivisorMonoid ] );

DeclareOperation( "AddPrimeDivisorList",
                  [ IsPDivisorMonoid, IsList ] );

DeclareOperation( "AddPrimeDivisor",
                  [ IsPDivisorMonoid, IsObject ] );

DeclareOperation( "ContainedPDivisors",
                  [ IsPDivisorMonoid ] );

DeclareOperation( "AddContainedPDivisor",
                  [ IsPDivisorMonoid, IsObject ] );

####################################
##
## Constructors
##
####################################

DeclareOperation( "PDivisorMonoid",
                  [ IsCone ] );

DeclareOperation( "PDivisorMonoid",
                  [ IsObject, IsCone ] );
