 
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
