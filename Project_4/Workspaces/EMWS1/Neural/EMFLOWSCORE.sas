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
      label GRP_Age2 = 'Dummy: GRP_Age=2' ;

      label GRP_Age3 = 'Dummy: GRP_Age=3' ;

      label GRP_Age4 = 'Dummy: GRP_Age=4' ;

      label GRP_BasementType2 = 'Dummy: GRP_BasementType=2' ;

      label GRP_BasementType3 = 'Dummy: GRP_BasementType=3' ;

      label GRP_Baths3 = 'Dummy: GRP_Baths=3' ;

      label GRP_CentralAir2 = 'Dummy: GRP_CentralAir=2' ;

      label GRP_FirePlace2 = 'Dummy: GRP_FirePlace=2' ;

      label GRP_GarageSize2 = 'Dummy: GRP_GarageSize=2' ;

      label GRP_TotalArea2 = 'Dummy: GRP_TotalArea=2' ;

      label GRP_TotalArea3 = 'Dummy: GRP_TotalArea=3' ;

      label GRP_TotalArea4 = 'Dummy: GRP_TotalArea=4' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label P_SalePrice = 'Predicted: SalePrice' ;

      label R_SalePrice = 'Residual: SalePrice' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for GRP_Age ;
drop GRP_Age2 GRP_Age3 GRP_Age4 ;
if missing( GRP_Age ) then do;
   GRP_Age2 = .;
   GRP_Age3 = .;
   GRP_Age4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Age , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Age2 = 0.63245553203367;
      GRP_Age3 = 0.63245553203367;
      GRP_Age4 = 0.63245553203367;
   end;
   else if _dm12 = '4'  then do;
      GRP_Age2 = 0.63245553203367;
      GRP_Age3 = 0.63245553203367;
      GRP_Age4 = -0.63245553203367;
   end;
   else if _dm12 = '3'  then do;
      GRP_Age2 = 0.63245553203367;
      GRP_Age3 = -0.63245553203367;
      GRP_Age4 = -0.63245553203367;
   end;
   else if _dm12 = '2'  then do;
      GRP_Age2 = -0.63245553203367;
      GRP_Age3 = -0.63245553203367;
      GRP_Age4 = -0.63245553203367;
   end;
   else do;
      GRP_Age2 = .;
      GRP_Age3 = .;
      GRP_Age4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_BasementType ;
drop GRP_BasementType2 GRP_BasementType3 ;
if missing( GRP_BasementType ) then do;
   GRP_BasementType2 = .;
   GRP_BasementType3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_BasementType , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_BasementType2 = -0.75;
      GRP_BasementType3 = -0.75;
   end;
   else if _dm12 = '3'  then do;
      GRP_BasementType2 = 0.75;
      GRP_BasementType3 = -0.75;
   end;
   else if _dm12 = '4'  then do;
      GRP_BasementType2 = 0.75;
      GRP_BasementType3 = 0.75;
   end;
   else do;
      GRP_BasementType2 = .;
      GRP_BasementType3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Baths ;
drop GRP_Baths3 ;
if missing( GRP_Baths ) then do;
   GRP_Baths3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Baths , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_Baths3 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Baths3 = 1;
   end;
   else do;
      GRP_Baths3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_CentralAir ;
drop GRP_CentralAir2 ;
if missing( GRP_CentralAir ) then do;
   GRP_CentralAir2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_CentralAir , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_CentralAir2 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_CentralAir2 = 1;
   end;
   else do;
      GRP_CentralAir2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_FirePlace ;
drop GRP_FirePlace2 ;
if missing( GRP_FirePlace ) then do;
   GRP_FirePlace2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_FirePlace , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_FirePlace2 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_FirePlace2 = -1;
   end;
   else do;
      GRP_FirePlace2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_GarageSize ;
drop GRP_GarageSize2 ;
if missing( GRP_GarageSize ) then do;
   GRP_GarageSize2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_GarageSize , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_GarageSize2 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_GarageSize2 = -1;
   end;
   else do;
      GRP_GarageSize2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_TotalArea ;
drop GRP_TotalArea2 GRP_TotalArea3 GRP_TotalArea4 ;
if missing( GRP_TotalArea ) then do;
   GRP_TotalArea2 = .;
   GRP_TotalArea3 = .;
   GRP_TotalArea4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_TotalArea , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_TotalArea2 = 0.63245553203367;
      GRP_TotalArea3 = 0.63245553203367;
      GRP_TotalArea4 = 0.63245553203367;
   end;
   else if _dm12 = '4'  then do;
      GRP_TotalArea2 = 0.63245553203367;
      GRP_TotalArea3 = 0.63245553203367;
      GRP_TotalArea4 = -0.63245553203367;
   end;
   else if _dm12 = '3'  then do;
      GRP_TotalArea2 = 0.63245553203367;
      GRP_TotalArea3 = -0.63245553203367;
      GRP_TotalArea4 = -0.63245553203367;
   end;
   else if _dm12 = '2'  then do;
      GRP_TotalArea2 = -0.63245553203367;
      GRP_TotalArea3 = -0.63245553203367;
      GRP_TotalArea4 = -0.63245553203367;
   end;
   else do;
      GRP_TotalArea2 = .;
      GRP_TotalArea3 = .;
      GRP_TotalArea4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;
*** *************************;
*** Writing the Node ord ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     1.46896891824831 * GRP_Age2  +      1.4120184149645 * GRP_Age3
          +     0.78709480654268 * GRP_Age4  +     1.62592446323429 *
        GRP_BasementType2  +     1.25683006752767 * GRP_BasementType3
          +  1.0000000827403E-10 * GRP_Baths3  +     2.79654741294973 *
        GRP_CentralAir2  +     0.58351634441628 * GRP_FirePlace2
          +     0.40144882842762 * GRP_GarageSize2  +  1.0000000133514E-10 *
        GRP_TotalArea2  +  1.0000000827403E-10 * GRP_TotalArea3
          +  9.9999994396249E-11 * GRP_TotalArea4 ;
   H12  =  1.0000000827403E-10 * GRP_Age2  +  1.0000000827403E-10 * GRP_Age3
          +  1.0000000827403E-10 * GRP_Age4  +  1.0000000827403E-10 *
        GRP_BasementType2  +     0.18293288183824 * GRP_BasementType3
          +     0.50585264116567 * GRP_Baths3  +  1.0000000133514E-10 *
        GRP_CentralAir2  +     0.53654340101728 * GRP_FirePlace2
          +     2.65057139322475 * GRP_GarageSize2  +     0.34864793246853 *
        GRP_TotalArea2  +      0.9905211965455 * GRP_TotalArea3
          +      1.9302717232928 * GRP_TotalArea4 ;
   H13  =  9.9999999600419E-11 * GRP_Age2  +  1.0000000827403E-10 * GRP_Age3
          +  1.0000000827403E-10 * GRP_Age4  +  9.9999994396249E-11 *
        GRP_BasementType2  +  1.0000000133514E-10 * GRP_BasementType3
          +     0.12104772247969 * GRP_Baths3  +     0.55774907919595 *
        GRP_CentralAir2  +     0.54589079462563 * GRP_FirePlace2
          +     1.05224248057152 * GRP_GarageSize2  +      0.1139447024623 *
        GRP_TotalArea2  +     0.07091229722309 * GRP_TotalArea3
          +     1.75701034828765 * GRP_TotalArea4 ;
   H11  =     2.31994814941257 + H11 ;
   H12  =    -1.17926560641982 + H12 ;
   H13  =    -0.88752932173467 + H13 ;
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
   P_SalePrice  =    -2461.50422899813 * H11  +     2244.19600867762 * H12
          +     5022.16016225532 * H13 ;
   P_SalePrice  =     75326.0209544962 + P_SalePrice ;
END;
ELSE DO;
   P_SalePrice  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_SalePrice  =     75017.5647668393;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( SalePrice ) THEN R_SalePrice  = . ;
ELSE R_SalePrice  = SalePrice  - P_SalePrice ;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
