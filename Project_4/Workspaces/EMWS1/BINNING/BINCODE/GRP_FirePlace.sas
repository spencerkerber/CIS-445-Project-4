 
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
