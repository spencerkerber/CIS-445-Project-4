 length _LABEL_ $200;
 label _LABEL_="%sysfunc(sasmsg(sashelp.dmine, rpt_groupvalues_vlabel , NOQUOTE))";
 
if DISPLAY_VAR='Age' and _GROUP_ = 2 then do;
_LABEL_='Age< 43';
UB=43;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 3 then do;
_LABEL_='43<= Age< 46';
UB=46;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 4 then do;
_LABEL_='46<= Age< 50';
UB=50;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 5 then do;
_LABEL_='50<= Age';
UB=.;
end;
 
if DISPLAY_VAR='Basement' and _GROUP_ = 2 then do;
_LABEL_='Basement< 0';
UB=0;
end;
else
if DISPLAY_VAR='Basement' and _GROUP_ = 3 then do;
_LABEL_='0<= Basement';
UB=.;
end;
 
if DISPLAY_VAR='Baths' and _GROUP_ = 2 then do;
_LABEL_='Baths< 1';
UB=1;
end;
else
if DISPLAY_VAR='Baths' and _GROUP_ = 3 then do;
_LABEL_='1<= Baths< 2';
UB=2;
end;
else
if DISPLAY_VAR='Baths' and _GROUP_ = 4 then do;
_LABEL_='2<= Baths';
UB=.;
end;
 
if DISPLAY_VAR='ConstructionType' and _GROUP_ = 2 then do;
_LABEL_='ConstructionType< 1';
UB=1;
end;
else
if DISPLAY_VAR='ConstructionType' and _GROUP_ = 3 then do;
_LABEL_='1<= ConstructionType';
UB=.;
end;
 
if DISPLAY_VAR='FirePlace' and _GROUP_ = 2 then do;
_LABEL_='FirePlace< 1';
UB=1;
end;
else
if DISPLAY_VAR='FirePlace' and _GROUP_ = 3 then do;
_LABEL_='1<= FirePlace';
UB=.;
end;
 
if DISPLAY_VAR='GarageSize' and _GROUP_ = 2 then do;
_LABEL_='GarageSize< 1';
UB=1;
end;
else
if DISPLAY_VAR='GarageSize' and _GROUP_ = 3 then do;
_LABEL_='1<= GarageSize';
UB=.;
end;
 
if DISPLAY_VAR='SecondFloor' and _GROUP_ = 2 then do;
_LABEL_='SecondFloor< 0';
UB=0;
end;
else
if DISPLAY_VAR='SecondFloor' and _GROUP_ = 3 then do;
_LABEL_='0<= SecondFloor';
UB=.;
end;
 
if DISPLAY_VAR='TotalArea' and _GROUP_ = 2 then do;
_LABEL_='TotalArea< 1154';
UB=1154;
end;
else
if DISPLAY_VAR='TotalArea' and _GROUP_ = 3 then do;
_LABEL_='1154<= TotalArea< 1357';
UB=1357;
end;
else
if DISPLAY_VAR='TotalArea' and _GROUP_ = 4 then do;
_LABEL_='1357<= TotalArea< 1566';
UB=1566;
end;
else
if DISPLAY_VAR='TotalArea' and _GROUP_ = 5 then do;
_LABEL_='1566<= TotalArea';
UB=.;
end;
 
if DISPLAY_VAR='BasementType' and _GROUP_ = 2 then
_LABEL_='2';
else
if DISPLAY_VAR='BasementType' and _GROUP_ = 3 then
_LABEL_='1';
else
if DISPLAY_VAR='BasementType' and _GROUP_ = 4 then
_LABEL_='0';
 
if DISPLAY_VAR='CentralAir' and _GROUP_ = 2 then
_LABEL_='1';
else
if DISPLAY_VAR='CentralAir' and _GROUP_ = 3 then
_LABEL_='0';
