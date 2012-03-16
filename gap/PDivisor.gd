#############################################################################
##
##  PDivisor.gd         PDivisor package         Sebastian Gutsche
##
##  Copyright 2011 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  The P-Divisors.
##
#############################################################################

DeclareCategory( "IsPDivisor",
                 IsObject );

##################################
##
## Attributes
##
##################################

DeclareAttribute( "ContainingMonoid",
                  IsPDivisor );

##################################
##
## Properties
##
##################################

##################################
##
## Structure
##
##################################

DeclareOperation( "Summands",
                  [ IsPDivisor ] );

DeclareOperation( "SetSummands",
                  [ IsPDivisor, IsList ] );

DeclareOperation( "Evaluate",
                  [ IsPDivisor ] );

DeclareOperation( "Evaluate",
                  [ IsPDivisor, IsList ] );

DeclareOperation( "\+",
                  [ IsPDivisor, IsPDivisor ] );

##################################
##
## Constructors
##
##################################

DeclareOperation( "PDivisor",
                 [ IsPolytope, IsObject, IsPDivisorMonoid ] );

DeclareOperation( "PDivisor",
                  [ IsPolyhedron, IsObject, IsPDivisorMonoid ] );
