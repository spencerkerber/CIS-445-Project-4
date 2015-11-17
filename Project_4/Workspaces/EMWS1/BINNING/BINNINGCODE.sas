*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if Age eq . then BIN_Age= .;
else do;
if Age < 43 then BIN_Age=1;
else if Age < 46 then BIN_Age=2;
else if Age < 50 then BIN_Age=3;
else if Age >= 50 then BIN_Age=4;
end;
if Basement eq . then BIN_Basement= .;
else do;
if Basement < 0 then BIN_Basement=1;
else if Basement >= 0 then BIN_Basement=2;
end;
if Baths eq . then BIN_Baths= .;
else do;
if Baths < 1 then BIN_Baths=1;
else if Baths < 2 then BIN_Baths=2;
else if Baths >= 2 then BIN_Baths=3;
end;
if ConstructionType eq . then BIN_ConstructionType= .;
else do;
if ConstructionType < 1 then BIN_ConstructionType=1;
else if ConstructionType >= 1 then BIN_ConstructionType=2;
end;
if FirePlace eq . then BIN_FirePlace= .;
else do;
if FirePlace < 1 then BIN_FirePlace=1;
else if FirePlace >= 1 then BIN_FirePlace=2;
end;
if GarageSize eq . then BIN_GarageSize= .;
else do;
if GarageSize < 1 then BIN_GarageSize=1;
else if GarageSize >= 1 then BIN_GarageSize=2;
end;
if SecondFloor eq . then BIN_SecondFloor= .;
else do;
if SecondFloor < 0 then BIN_SecondFloor=1;
else if SecondFloor >= 0 then BIN_SecondFloor=2;
end;
if TotalArea eq . then BIN_TotalArea= .;
else do;
if TotalArea < 1154 then BIN_TotalArea=1;
else if TotalArea < 1357 then BIN_TotalArea=2;
else if TotalArea < 1566 then BIN_TotalArea=3;
else if TotalArea >= 1566 then BIN_TotalArea=4;
end;
drop
Age
Basement
Baths
ConstructionType
FirePlace
GarageSize
SecondFloor
TotalArea
;
