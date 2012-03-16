#############################################################################
##
##  PDivisorMonoid.gi         PDivisor package         Sebastian Gutsche
##
##  Copyright 2011 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  The monoid of PDivisors.
##
#############################################################################

DeclareRepresentation( "IsPDivisorMonoidRep",
                       IsPDivisorMonoid and IsAttributeStoringRep,
                       [ ]
                      );

####################################
##
## Types and Families
##
####################################


BindGlobal( "TheFamilyOfPDivisorMonoids",
        NewFamily( "TheFamilyOfPDivisorMonoids" , IsPDivisorMonoid ) );

BindGlobal( "TheTypePDivisorMonoid",
        NewType( TheFamilyOfPDivisorMonoids,
                 IsPDivisorMonoid and IsPDivisorMonoidRep ) );

####################################
##
## Attributes
##
####################################

##
InstallMethod( Variety,
               "has to be setted",
               [ IsPDivisorMonoid ],
               
  function( monoid )
    
    Error( "no variety specified\n" );
    
end );

##
InstallMethod( PrimeDivisorsOfMonoid,
               "for p-div-monoids",
               [ IsPDivisorMonoid ],
               
  function( monoid )
    
    monoid!.primedivisors := Unique( monoid!.primedivisors );
    
    return monoid!.primedivisors;
    
end );

##
InstallMethod( AddPrimeDivisorList,
               "for p-div-monoids",
               [ IsPDivisorMonoid, IsList ],
               
  function( monoid, divisors )
    local i;
    
    for i in divisors do
        
        Add( monoid!.primedivisors, i );
        
    od;
    
end );


##
InstallMethod( AddPrimeDivisor,
               "for p-div-monoids",
               [ IsPDivisorMonoid, IsObject ],
               
  function( monoid, divisor )
    
    Add( monoid!.primedivisors, divisor );
    
end );

##
InstallMethod( ContainedPDivisors,
               "for p-div-monoids",
               [ IsPDivisorMonoid ],
               
  function( monoid )
    
    return monoid!.pdivisors;
    
end );

##
InstallMethod( AddContainedPDivisor,
               "for p-div-monoids",
               [ IsPDivisorMonoid, IsObject ],
               
  function( monoid, divisor )
    
    Add( monoid!.pdivisors, divisor );
    
end );

##################################
##
## Constructors
##
##################################

##
InstallMethod( PDivisorMonoid,
               "constructor",
               [ IsCone ],
               
  function( cone )
    local monoid;
    
    monoid := rec( primedivisors := Set( [ ] ),
                   pdivisors := WeakPointerObj( [ ] )
              );
    
    ObjectifyWithAttributes( monoid, TheTypePDivisorMonoid,
                             CommonTailCone, cone );
    
    return monoid;
    
end );

##
InstallMethod( PDivisorMonoid,
               "constructor",
               [ IsObject, IsCone ],
               
  function( variety, cone )
    local monoid;
    
    monoid := rec( primedivisors := Set( [ ] ),
                   pdivisors := WeakPointerObj( [ ] )
              );
    
    ObjectifyWithAttributes( monoid, TheTypePDivisorMonoid,
                             CommonTailCone, cone,
                             Variety, variety
                           );
    
    return monoid;
    
end );

############################################
##
## Display and View
##
############################################

##
InstallMethod( ViewObj,
               "for p-div-mon",
               [ IsPDivisorMonoid ],
               
  function( monoid )
    
    Print( "<A" );
    
    Print( " P-Divisor Monoid" );
    
    Print( ">" );
    
end );


##
InstallMethod( Display,
               "for p-div-mon",
               [ IsPDivisorMonoid ],
               
  function( monoid )
    
    Print( "A" );
    
    Print( " P-Divisor Monoid" );
    
    Print( "\n" );
    
end );