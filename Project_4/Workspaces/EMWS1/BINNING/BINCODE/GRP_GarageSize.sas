 
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
