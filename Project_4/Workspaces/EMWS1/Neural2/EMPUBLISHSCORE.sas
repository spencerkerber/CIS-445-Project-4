***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
;
      label S_Age = 'Standard: Age' ;

      label S_Basement = 'Standard: Basement' ;

      label S_Baths = 'Standard: Baths' ;

      label S_ConstructionType = 'Standard: ConstructionType' ;

      label S_FirePlace = 'Standard: FirePlace' ;

      label S_FirstFloor = 'Standard: FirstFloor' ;

      label S_GarageSize = 'Standard: GarageSize' ;

      label S_SecondFloor = 'Standard: SecondFloor' ;

      label S_TotalArea = 'Standard: TotalArea' ;

      label S_UpperArea = 'Standard: UpperArea' ;

      label CentralAir0 = 'Dummy: CentralAir=0' ;

      label BasementType0 = 'Dummy: BasementType=0' ;

      label BasementType1 = 'Dummy: BasementType=1' ;

      label GarageType0 = 'Dummy: GarageType=0' ;

      label GarageType1 = 'Dummy: GarageType=1' ;

      label GarageType2 = 'Dummy: GarageType=2' ;

      label GarageType3 = 'Dummy: GarageType=3' ;

      label GarageType4 = 'Dummy: GarageType=4' ;

      label LotSize1 = 'Dummy: LotSize=1' ;

      label LotSize2 = 'Dummy: LotSize=2' ;

      label Neighborhood1 = 'Dummy: Neighborhood=1' ;

      label WallType1 = 'Dummy: WallType=1' ;

      label WallType2 = 'Dummy: WallType=2' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label P_SalePrice = 'Predicted: SalePrice' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for CentralAir ;
drop CentralAir0 ;
if missing( CentralAir ) then do;
   CentralAir0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( CentralAir , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      CentralAir0 = -1;
   end;
   else if _dm12 = '0'  then do;
      CentralAir0 = 1;
   end;
   else do;
      CentralAir0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for BasementType ;
drop BasementType0 BasementType1 ;
if missing( BasementType ) then do;
   BasementType0 = .;
   BasementType1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( BasementType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      BasementType0 = -1;
      BasementType1 = -1;
   end;
   else if _dm12 = '1'  then do;
      BasementType0 = 0;
      BasementType1 = 1;
   end;
   else if _dm12 = '0'  then do;
      BasementType0 = 1;
      BasementType1 = 0;
   end;
   else do;
      BasementType0 = .;
      BasementType1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GarageType ;
drop GarageType0 GarageType1 GarageType2 GarageType3 GarageType4 ;
*** encoding is sparse, initialize to zero;
GarageType0 = 0;
GarageType1 = 0;
GarageType2 = 0;
GarageType3 = 0;
GarageType4 = 0;
if missing( GarageType ) then do;
   GarageType0 = .;
   GarageType1 = .;
   GarageType2 = .;
   GarageType3 = .;
   GarageType4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GarageType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GarageType2 = 1;
   end;
   else if _dm12 = '0'  then do;
      GarageType0 = 1;
   end;
   else if _dm12 = '3'  then do;
      GarageType3 = 1;
   end;
   else if _dm12 = '1'  then do;
      GarageType1 = 1;
   end;
   else if _dm12 = '4'  then do;
      GarageType4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GarageType0 = -1;
      GarageType1 = -1;
      GarageType2 = -1;
      GarageType3 = -1;
      GarageType4 = -1;
   end;
   else do;
      GarageType0 = .;
      GarageType1 = .;
      GarageType2 = .;
      GarageType3 = .;
      GarageType4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for LotSize ;
drop LotSize1 LotSize2 ;
if missing( LotSize ) then do;
   LotSize1 = .;
   LotSize2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( LotSize , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      LotSize1 = 1;
      LotSize2 = 0;
   end;
   else if _dm12 = '2'  then do;
      LotSize1 = 0;
      LotSize2 = 1;
   end;
   else if _dm12 = '3'  then do;
      LotSize1 = -1;
      LotSize2 = -1;
   end;
   else do;
      LotSize1 = .;
      LotSize2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Neighborhood ;
drop Neighborhood1 ;
if missing( Neighborhood ) then do;
   Neighborhood1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Neighborhood , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      Neighborhood1 = 1;
   end;
   else if _dm12 = '2'  then do;
      Neighborhood1 = -1;
   end;
   else do;
      Neighborhood1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for WallType ;
drop WallType1 WallType2 ;
if missing( WallType ) then do;
   WallType1 = .;
   WallType2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( WallType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      WallType1 = 0;
      WallType2 = 1;
   end;
   else if _dm12 = '1'  then do;
      WallType1 = 1;
      WallType2 = 0;
   end;
   else if _dm12 = '3'  then do;
      WallType1 = -1;
      WallType2 = -1;
   end;
   else do;
      WallType1 = .;
      WallType2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Age ,
   Basement ,
   Baths ,
   ConstructionType ,
   FirePlace ,
   FirstFloor ,
   GarageSize ,
   SecondFloor ,
   TotalArea ,
   UpperArea   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Age  =    -5.79800632867022 +     0.12225218876584 * Age ;
   S_Basement  =    -0.49458207878395 +     0.00334997337812 * Basement ;
   S_Baths  =    -1.76411714218363 +     1.10829261382142 * Baths ;
   S_ConstructionType  =    -2.14845368821017 +     1.59307110214223 *
        ConstructionType ;
   S_FirePlace  =    -2.01186859107483 +     2.33291145135273 * FirePlace ;
   S_FirstFloor  =    -5.35340382063727 +     0.00510704735291 * FirstFloor ;
   S_GarageSize  =    -1.89394092412704 +     1.79512661504215 * GarageSize ;
   S_SecondFloor  =    -0.29097603119759 +      0.0043289957552 * SecondFloor
         ;
   S_TotalArea  =    -4.25637698545192 +     0.00299693547373 * TotalArea ;
   S_UpperArea  =    -1.23567045229017 +     0.00405418335138 * UpperArea ;
END;
ELSE DO;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -5.79800632867022 +     0.12225218876584 * Age ;
   IF MISSING( Basement ) THEN S_Basement  = . ;
   ELSE S_Basement  =    -0.49458207878395 +     0.00334997337812 * Basement ;
   IF MISSING( Baths ) THEN S_Baths  = . ;
   ELSE S_Baths  =    -1.76411714218363 +     1.10829261382142 * Baths ;
   IF MISSING( ConstructionType ) THEN S_ConstructionType  = . ;
   ELSE S_ConstructionType  =    -2.14845368821017 +     1.59307110214223 *
        ConstructionType ;
   IF MISSING( FirePlace ) THEN S_FirePlace  = . ;
   ELSE S_FirePlace  =    -2.01186859107483 +     2.33291145135273 * FirePlace
         ;
   IF MISSING( FirstFloor ) THEN S_FirstFloor  = . ;
   ELSE S_FirstFloor  =    -5.35340382063727 +     0.00510704735291 *
        FirstFloor ;
   IF MISSING( GarageSize ) THEN S_GarageSize  = . ;
   ELSE S_GarageSize  =    -1.89394092412704 +     1.79512661504215 *
        GarageSize ;
   IF MISSING( SecondFloor ) THEN S_SecondFloor  = . ;
   ELSE S_SecondFloor  =    -0.29097603119759 +      0.0043289957552 *
        SecondFloor ;
   IF MISSING( TotalArea ) THEN S_TotalArea  = . ;
   ELSE S_TotalArea  =    -4.25637698545192 +     0.00299693547373 * TotalArea
         ;
   IF MISSING( UpperArea ) THEN S_UpperArea  = . ;
   ELSE S_UpperArea  =    -1.23567045229017 +     0.00405418335138 * UpperArea
         ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     1.06685651888968 * S_Age  +    -1.27763914766514 * S_Basement
          +     1.38418752414407 * S_Baths  +     1.18548564330738 *
        S_ConstructionType  +     1.55116380147608 * S_FirePlace
          +    -1.08935008480036 * S_FirstFloor  +    -1.94191825758712 *
        S_GarageSize  +    -3.43491557430252 * S_SecondFloor
          +    -3.40468485201408 * S_TotalArea  +    -0.60398193302779 *
        S_UpperArea ;
   H12  =     1.29695285591365 * S_Age  +     2.18537187195511 * S_Basement
          +    -1.03627148253841 * S_Baths  +    -2.39688516505774 *
        S_ConstructionType  +     -2.7674326591648 * S_FirePlace
          +    -0.15307598913482 * S_FirstFloor  +     -2.5031960772721 *
        S_GarageSize  +     1.12268609470501 * S_SecondFloor
          +     0.52749638805329 * S_TotalArea  +     0.05734096855343 *
        S_UpperArea ;
   H13  =     3.97399585591696 * S_Age  +     0.82253750628121 * S_Basement
          +    -0.33311744423616 * S_Baths  +     -1.3134792554216 *
        S_ConstructionType  +      0.5508564912385 * S_FirePlace
          +    -0.78319468596624 * S_FirstFloor  +     2.15218942445766 *
        S_GarageSize  +    -0.05506609396709 * S_SecondFloor
          +     -0.5552620458472 * S_TotalArea  +    -0.17995456950546 *
        S_UpperArea ;
   H11  = H11  +     2.54846302946557 * CentralAir0 ;
   H12  = H12  +     0.49824688129894 * CentralAir0 ;
   H13  = H13  +     0.83081350289717 * CentralAir0 ;
   H11  = H11  +     1.98942066905849 * BasementType0
          +    -0.32595166725024 * BasementType1  +     0.91299294963347 *
        GarageType0  +     0.59753993123295 * GarageType1
          +    -0.02001007976178 * GarageType2  +    -1.66777466937618 *
        GarageType3  +     0.92834881170828 * GarageType4
          +     1.76633981664255 * LotSize1  +     0.19412605554477 * LotSize2
          +     0.74085966279354 * Neighborhood1  +     3.34715985880809 *
        WallType1  +     0.33555661180117 * WallType2 ;
   H12  = H12  +     1.29911795954644 * BasementType0
          +    -0.88953550348817 * BasementType1  +    -0.02188228363215 *
        GarageType0  +     -0.1977237040781 * GarageType1
          +    -0.97194332103763 * GarageType2  +    -1.84445605730689 *
        GarageType3  +    -0.45522191073106 * GarageType4
          +    -0.29313709399155 * LotSize1  +     1.01689506731413 * LotSize2
          +     0.19638165588322 * Neighborhood1  +      2.0364062896248 *
        WallType1  +    -1.11520697934295 * WallType2 ;
   H13  = H13  +     3.63168687394794 * BasementType0
          +     0.78139461418017 * BasementType1  +    -2.27563012542187 *
        GarageType0  +     0.54660636202026 * GarageType1
          +     2.22659429989476 * GarageType2  +     0.41993884878562 *
        GarageType3  +     0.00661212610979 * GarageType4
          +     0.92768302689797 * LotSize1  +     0.60505705653949 * LotSize2
          +     1.44556776159259 * Neighborhood1  +     0.17885014650603 *
        WallType1  +      1.2781337862321 * WallType2 ;
   H11  =     2.25178293780814 + H11 ;
   H12  =    -2.24537646656319 + H12 ;
   H13  =     2.44104789581043 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =    -4726.35648805491 * H11  +     -3500.8056741381 * H12
          +    -2942.51684569539 * H13 ;
   P_SalePrice  =     77560.3812170249 + P_SalePrice ;
END;
ELSE DO;
   P_SalePrice  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_SalePrice  =     75984.2752293578;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
drop S_:;
