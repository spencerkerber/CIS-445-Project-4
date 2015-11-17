 
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
