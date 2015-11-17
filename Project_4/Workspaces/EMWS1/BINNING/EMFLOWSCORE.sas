length _UFormat $200;
drop _UFormat;
_UFormat='';
 
*------------------------------------------------------------*;
* Variable: Age;
*------------------------------------------------------------*;
LABEL GRP_Age =
'Grouped: Age';
 
if MISSING(Age) then do;
GRP_Age = 1;
end;
else if NOT MISSING(Age) then do;
if Age < 43 then do;
GRP_Age = 2;
end;
else
if 43 <= Age AND Age < 46 then do;
GRP_Age = 3;
end;
else
if 46 <= Age AND Age < 50 then do;
GRP_Age = 4;
end;
else
if 50 <= Age then do;
GRP_Age = 5;
end;
end;
 
*------------------------------------------------------------*;
* Variable: Baths;
*------------------------------------------------------------*;
LABEL GRP_Baths =
'Grouped: Baths';
 
if MISSING(Baths) then do;
GRP_Baths = 1;
end;
else if NOT MISSING(Baths) then do;
if Baths < 1 then do;
GRP_Baths = 2;
end;
else
if 1 <= Baths AND Baths < 2 then do;
GRP_Baths = 3;
end;
else
if 2 <= Baths then do;
GRP_Baths = 4;
end;
end;
 
*------------------------------------------------------------*;
* Variable: FirePlace;
*------------------------------------------------------------*;
LABEL GRP_FirePlace =
'Grouped: FirePlace';
 
if MISSING(FirePlace) then do;
GRP_FirePlace = 1;
end;
else if NOT MISSING(FirePlace) then do;
if FirePlace < 1 then do;
GRP_FirePlace = 2;
end;
else
if 1 <= FirePlace then do;
GRP_FirePlace = 3;
end;
end;
 
*------------------------------------------------------------*;
* Variable: GarageSize;
*------------------------------------------------------------*;
LABEL GRP_GarageSize =
'Grouped: GarageSize';
 
if MISSING(GarageSize) then do;
GRP_GarageSize = 1;
end;
else if NOT MISSING(GarageSize) then do;
if GarageSize < 1 then do;
GRP_GarageSize = 2;
end;
else
if 1 <= GarageSize then do;
GRP_GarageSize = 3;
end;
end;
 
*------------------------------------------------------------*;
* Variable: TotalArea;
*------------------------------------------------------------*;
LABEL GRP_TotalArea =
'Grouped: TotalArea';
 
if MISSING(TotalArea) then do;
GRP_TotalArea = 1;
end;
else if NOT MISSING(TotalArea) then do;
if TotalArea < 1154 then do;
GRP_TotalArea = 2;
end;
else
if 1154 <= TotalArea AND TotalArea < 1357 then do;
GRP_TotalArea = 3;
end;
else
if 1357 <= TotalArea AND TotalArea < 1566 then do;
GRP_TotalArea = 4;
end;
else
if 1566 <= TotalArea then do;
GRP_TotalArea = 5;
end;
end;
 
*------------------------------------------------------------*;
* Variable: BasementType;
*------------------------------------------------------------*;
LABEL GRP_BasementType =
'Grouped: BasementType';
 
_UFormat = put(BasementType,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_BasementType = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '2'
) then do;
GRP_BasementType = 2;
end;
else
if (_UFORMAT eq '1'
) then do;
GRP_BasementType = 3;
end;
else
if (_UFORMAT eq '0'
) then do;
GRP_BasementType = 4;
end;
else do;
GRP_BasementType = 1;
end;
end;
 
*------------------------------------------------------------*;
* Variable: CentralAir;
*------------------------------------------------------------*;
LABEL GRP_CentralAir =
'Grouped: CentralAir';
 
_UFormat = put(CentralAir,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_CentralAir = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '1'
) then do;
GRP_CentralAir = 2;
end;
else
if (_UFORMAT eq '0'
) then do;
GRP_CentralAir = 3;
end;
else do;
GRP_CentralAir = 1;
end;
end;
 
*------------------------------------------------------------*;
* Mean Cutoff Binary Transformation for Target;
*------------------------------------------------------------*;
if SalePrice = . then BIN_SalePrice = .;
else do;
   if SalePrice > 75017.56 then BIN_SalePrice=1;
   else BIN_SalePrice=0;
end;
label BIN_SalePrice = 'Binary: SalePrice';
