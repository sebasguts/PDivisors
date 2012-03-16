#############################################################################
##
##  PDivisor.gd         PDivisor package         Sebastian Gutsche
##
##  Copyright 2011 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  The P-Divisors.
##
#############################################################################

DeclareRepresentation( "IsPDivisorRep",
                       IsPDivisor and IsAttributeStoringRep,
                       [ ]
                      );

####################################
##
## Types and Families
##
####################################


BindGlobal( "TheFamilyOfPDivisors",
        NewFamily( "TheFamilyOfPDivisors" , IsPDivisor ) );

BindGlobal( "TheTypePDivisor",
        NewType( TheFamilyOfPDivisors,
                 IsPDivisor and IsPDivisorRep ) );

####################################
##
## Methods
##
####################################

##
InstallMethod( \+,
               "for p divisors",
               [ IsPDivisor, IsPDivisor ],
               
  function( div1, div2 )
    local new_divisor;
    
    if not IsIdenticalObj( ContainingMonoid( div1 ), ContainingMonoid( div2 ) ) then
        
        Error( "cannot add these two divisors" );
        
    fi;
    
    new_divisor := rec( summands := Concatenation( Summands( div1 ), Summands( div2 ) ) );
    
    ObjectifyWithAttributes( new_divisor, TheTypePDivisor,
                             ContainingMonoid, ContainingMonoid( div1 )
                            );
    
    return new_divisor;
    
end );

##
InstallMethod( Summands,
               "for pdivisors",
               [ IsPDivisor ],
               
  function( divisor )
    
    return divisor!.summands;
    
end );

##
InstallMethod( SetSummands,
               "for pdivisors",
               [ IsPDivisor, IsList ],
               
  function( divisor, summand )
    
    divisor!.summands := summand;
    
end );

##
InstallMethod( Evaluate,
               "for p divisors",
               [ IsPDivisor ],
               
  function( divisor )
    local summands, summand_list, new_polytope, new_list, i;
    
    new_list := [ ];
    
    summands := Summands( divisor );
    
    for i in PrimeDivisorsOfMonoid( ContainingMonoid( divisor ) ) do
        
        summand_list := Filtered( summands, j -> IsIdenticalObj( j[2], i ) );
        
        Apply( summand_list, j -> j[1] );
        
        new_polytope := Sum( summand_list );
        
        Add( new_list, [ new_polytope, i ] );
        
    od;
    
    SetSummands( divisor, new_list );
    
end );

##
InstallMethod( Evaluate,
               "for p divisors",
               [ IsPDivisor, IsList ],
               
  function( divisor, functional )
    local rays, summands, new_summands;
    
    rays := RayGenerators( CommonTailCone( ContainingMonoid( divisor ) ) );
    
    if not ForAll( rays, i -> i*functional >= 0 ) then
        
        Error( "functional not posivite on common tail cone\n" );
        
    fi;
    
    summands := Summands( divisor );
    
    new_summands := List( summands, i -> [ Vertices( i[ 1 ] ), i[ 2 ] ] );
    
    Apply( new_summands, i -> [ Minimum( List( i[ 1 ], j -> j*functional ) ), i[ 2 ] ] );
    
    Apply( new_summands, i -> i[ 1 ] * i[ 2 ] );
    
    return Sum( new_summands );
    
end );

####################################
##
## Constructor
##
####################################

##
InstallMethod( PDivisor,
               "for a polytope and a prime divisor",
               [ IsPolytope, IsObject, IsPDivisorMonoid ],
               
  function( polytope, primediv, monoid )
    local divisor;
    
#     if not Variety( primediv ) = Variety( monoid ) then
#         
#         Error( "prime divisor not compatible\n" );
#         
#     fi;
    
    AddPrimeDivisor( monoid, primediv );
    
    divisor := rec( summands := [ [ polytope, primediv ] ] );
    
    ObjectifyWithAttributes( divisor, TheTypePDivisor,
                             ContainingMonoid, monoid );
    
    AddContainedPDivisor( monoid, divisor );
    
    return divisor;
    
end );

InstallMethod( PDivisor,
               "for a polytope and a prime divisor",
               [ IsPolyhedron, IsObject, IsPDivisorMonoid ],
               
  function( polytope, primediv, monoid )
    local divisor;
    
#     if not Variety( primediv ) = Variety( monoid ) then
#         
#         Error( "prime divisor not compatible\n" );
#         
#     fi;
    
    if not TailCone( polytope ) = CommonTailCone( monoid ) then
        
        Error( "polyhedron has wrong tail cone\n" );
        
    fi;
    
    AddPrimeDivisor( monoid, primediv );
    
    divisor := rec( summands := [ [ MainPolytope( polytope ), primediv ] ] );
    
    ObjectifyWithAttributes( divisor, TheTypePDivisor,
                             ContainingMonoid, monoid );
    
    AddContainedPDivisor( monoid, divisor );
    
    return divisor;
    
end );

####################################
##
## Display & View
##
####################################

##
InstallMethod( ViewObj,
               "for pdivisors",
               [ IsPDivisor ],
               
  function( divisor )
    
    Print( "<A" );
    
    Print( " p-divisor" );
    
    Print( ">" );
    
end );

##
InstallMethod( Display,
               "for pdivisors",
               [ IsPDivisor ],
               
  function( divisor )
    
    Print( "A" );
    
    Print( " p-divisor" );
    
    Print( "\n" );
    
end );
