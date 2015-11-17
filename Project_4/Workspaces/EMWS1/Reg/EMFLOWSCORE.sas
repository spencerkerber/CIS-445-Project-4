*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = SalePrice ;

drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for GRP_Age ;
drop _0_0 _0_1 _0_2 ;
if missing( GRP_Age ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Age , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _0_0 = 1;
      _0_1 = 0;
      _0_2 = 0;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_BasementType ;
drop _1_0 _1_1 ;
if missing( GRP_BasementType ) then do;
   _1_0 = .;
   _1_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_BasementType , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 1;
      _1_1 = 0;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = 0;
      _1_1 = 1;
   end;
   else if _dm12 = '4'  then do;
      _1_0 = -1;
      _1_1 = -1;
   end;
   else do;
      _1_0 = .;
      _1_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Baths ;
drop _2_0 ;
if missing( GRP_Baths ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Baths , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_CentralAir ;
drop _3_0 ;
if missing( GRP_CentralAir ) then do;
   _3_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_CentralAir , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _3_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = -1;
   end;
   else do;
      _3_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_FirePlace ;
drop _4_0 ;
if missing( GRP_FirePlace ) then do;
   _4_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_FirePlace , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _4_0 = -1;
   end;
   else if _dm12 = '2'  then do;
      _4_0 = 1;
   end;
   else do;
      _4_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_GarageSize ;
drop _5_0 ;
if missing( GRP_GarageSize ) then do;
   _5_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_GarageSize , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _5_0 = -1;
   end;
   else if _dm12 = '2'  then do;
      _5_0 = 1;
   end;
   else do;
      _5_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_TotalArea ;
drop _6_0 _6_1 _6_2 ;
if missing( GRP_TotalArea ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_TotalArea , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _6_0 = -1;
      _6_1 = -1;
      _6_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _6_0 = 0;
      _6_1 = 0;
      _6_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _6_0 = 0;
      _6_1 = 1;
      _6_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _6_0 = 1;
      _6_1 = 0;
      _6_2 = 0;
   end;
   else do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     75017.5647668393;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_Age ;
_TEMP = 1;
_LP0 = _LP0 + (    4865.44088732322) * _TEMP * _0_0;
_LP0 = _LP0 + (   -568.165965743325) * _TEMP * _0_1;
_LP0 = _LP0 + (   -1497.38707585112) * _TEMP * _0_2;

***  Effect: GRP_BasementType ;
_TEMP = 1;
_LP0 = _LP0 + (    3919.57591308007) * _TEMP * _1_0;
_LP0 = _LP0 + (    1883.25615871246) * _TEMP * _1_1;

***  Effect: GRP_Baths ;
_TEMP = 1;
_LP0 = _LP0 + (   -694.297783815494) * _TEMP * _2_0;

***  Effect: GRP_CentralAir ;
_TEMP = 1;
_LP0 = _LP0 + (    1250.98870475304) * _TEMP * _3_0;

***  Effect: GRP_FirePlace ;
_TEMP = 1;
_LP0 = _LP0 + (   -2961.13158510614) * _TEMP * _4_0;

***  Effect: GRP_GarageSize ;
_TEMP = 1;
_LP0 = _LP0 + (   -3666.90689270789) * _TEMP * _5_0;

***  Effect: GRP_TotalArea ;
_TEMP = 1;
_LP0 = _LP0 + (   -2003.67479315007) * _TEMP * _6_0;
_LP0 = _LP0 + (   -3834.36786615035) * _TEMP * _6_1;
_LP0 = _LP0 + (    -1635.4807000685) * _TEMP * _6_2;
*--- Intercept ---*;
_LP0 = _LP0 + (    66921.6775629157);

REGDR1:

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
