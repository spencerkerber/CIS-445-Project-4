 
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
