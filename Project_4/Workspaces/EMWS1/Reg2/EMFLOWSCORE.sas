*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = SalePrice ;

drop _DM_BAD;
_DM_BAD=0;

*** Check Age for missing values ;
if missing( Age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Basement for missing values ;
if missing( Basement ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Baths for missing values ;
if missing( Baths ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check ConstructionType for missing values ;
if missing( ConstructionType ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check FirePlace for missing values ;
if missing( FirePlace ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check FirstFloor for missing values ;
if missing( FirstFloor ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check GarageSize for missing values ;
if missing( GarageSize ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check SecondFloor for missing values ;
if missing( SecondFloor ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TotalArea for missing values ;
if missing( TotalArea ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for BasementType ;
drop _0_0 _0_1 ;
if missing( BasementType ) then do;
   _0_0 = .;
   _0_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( BasementType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _0_0 = -1;
      _0_1 = -1;
   end;
   else if _dm12 = '1'  then do;
      _0_0 = 0;
      _0_1 = 1;
   end;
   else if _dm12 = '0'  then do;
      _0_0 = 1;
      _0_1 = 0;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for CentralAir ;
drop _1_0 ;
if missing( CentralAir ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( CentralAir , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _1_0 = -1;
   end;
   else if _dm12 = '0'  then do;
      _1_0 = 1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GarageType ;
drop _2_0 _2_1 _2_2 _2_3 _2_4 ;
*** encoding is sparse, initialize to zero;
_2_0 = 0;
_2_1 = 0;
_2_2 = 0;
_2_3 = 0;
_2_4 = 0;
if missing( GarageType ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   _2_3 = .;
   _2_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GarageType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _2_2 = 1;
   end;
   else if _dm12 = '0'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _2_3 = 1;
   end;
   else if _dm12 = '1'  then do;
      _2_1 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_4 = 1;
   end;
   else if _dm12 = '5'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
      _2_3 = -1;
      _2_4 = -1;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      _2_3 = .;
      _2_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for LotSize ;
drop _3_0 _3_1 ;
if missing( LotSize ) then do;
   _3_0 = .;
   _3_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( LotSize , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _3_0 = 1;
      _3_1 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 0;
      _3_1 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = -1;
      _3_1 = -1;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Neighborhood ;
drop _4_0 ;
if missing( Neighborhood ) then do;
   _4_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Neighborhood , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _4_0 = 1;
   end;
   else if _dm12 = '2'  then do;
      _4_0 = -1;
   end;
   else do;
      _4_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for WallType ;
drop _5_0 _5_1 ;
if missing( WallType ) then do;
   _5_0 = .;
   _5_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( WallType , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _5_0 = 0;
      _5_1 = 1;
   end;
   else if _dm12 = '1'  then do;
      _5_0 = 1;
      _5_1 = 0;
   end;
   else if _dm12 = '3'  then do;
      _5_0 = -1;
      _5_1 = -1;
   end;
   else do;
      _5_0 = .;
      _5_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     75984.2752293578;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (   -457.308363045004 * _TEMP);

***  Effect: Basement ;
_TEMP = Basement ;
_LP0 = _LP0 + (    2.10794648258119 * _TEMP);

***  Effect: BasementType ;
_TEMP = 1;
_LP0 = _LP0 + (   -8343.67039162431) * _TEMP * _0_0;
_LP0 = _LP0 + (    4298.86837666394) * _TEMP * _0_1;

***  Effect: Baths ;
_TEMP = Baths ;
_LP0 = _LP0 + (    645.299517163889 * _TEMP);

***  Effect: CentralAir ;
_TEMP = 1;
_LP0 = _LP0 + (   -1113.04062659418) * _TEMP * _1_0;

***  Effect: ConstructionType ;
_TEMP = ConstructionType ;
_LP0 = _LP0 + (    6202.96257223998 * _TEMP);

***  Effect: FirePlace ;
_TEMP = FirePlace ;
_LP0 = _LP0 + (   -722.431702806575 * _TEMP);

***  Effect: FirstFloor ;
_TEMP = FirstFloor ;
_LP0 = _LP0 + (    6.93668172482667 * _TEMP);

***  Effect: GarageSize ;
_TEMP = GarageSize ;
_LP0 = _LP0 + (    4232.29226936744 * _TEMP);

***  Effect: GarageType ;
_TEMP = 1;
_LP0 = _LP0 + (    3436.32276226755) * _TEMP * _2_0;
_LP0 = _LP0 + (    343.256097444966) * _TEMP * _2_1;
_LP0 = _LP0 + (    3055.32165725639) * _TEMP * _2_2;
_LP0 = _LP0 + (    6455.11696856413) * _TEMP * _2_3;
_LP0 = _LP0 + (   -15827.2636520668) * _TEMP * _2_4;

***  Effect: LotSize ;
_TEMP = 1;
_LP0 = _LP0 + (    -1045.3531193127) * _TEMP * _3_0;
_LP0 = _LP0 + (    -9247.8725449665) * _TEMP * _3_1;

***  Effect: Neighborhood ;
_TEMP = 1;
_LP0 = _LP0 + (   -149.622369894703) * _TEMP * _4_0;

***  Effect: SecondFloor ;
_TEMP = SecondFloor ;
_LP0 = _LP0 + (   -7.39388359659266 * _TEMP);

***  Effect: TotalArea ;
_TEMP = TotalArea ;
_LP0 = _LP0 + (    6.47789843184519 * _TEMP);

***  Effect: WallType ;
_TEMP = 1;
_LP0 = _LP0 + (   -2085.56984033522) * _TEMP * _5_0;
_LP0 = _LP0 + (   -3462.66967593739) * _TEMP * _5_1;
*--- Intercept ---*;
_LP0 = _LP0 + (      64444.03978831);

REG2DR1:

*** Predicted Value, Error, and Residual;
label P_SalePrice = 'Predicted: SalePrice' ;
P_SalePrice = _LP0;

drop _R;
if _Y = . then do;
   R_SalePrice = .;
end;
else do;
   _R = _Y - _LP0;
    label R_SalePrice = 'Residual: SalePrice' ;
   R_SalePrice = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
