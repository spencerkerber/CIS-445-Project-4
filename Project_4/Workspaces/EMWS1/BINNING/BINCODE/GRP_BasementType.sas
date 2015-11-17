 
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
