 
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
