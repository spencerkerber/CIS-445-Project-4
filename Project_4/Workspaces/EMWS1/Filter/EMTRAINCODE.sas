

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(GarageType,BEST.);
length _FILTERNORM1  $32;
drop _FILTERNORM1 ;
%dmnormcp(_FILTERFMT1,_FILTERNORM1);


length _FILTERFMT2  $200;
drop _FILTERFMT2 ;
_FILTERFMT2= put(LotSize,BEST.);
length _FILTERNORM2  $32;
drop _FILTERNORM2 ;
%dmnormcp(_FILTERFMT2,_FILTERNORM2);
if
_FILTERNORM1 not in ( '4' , '5')
 and
_FILTERNORM2 not in ( '2' , '3')
and
( Age eq . or (22.887167558<=Age) and (Age<=71.966043451))
and ( Basement eq . or (-747.89189<=Basement) and (Basement<=1043.1671194))
and ( Baths eq . or (-1.115123247<=Baths) and (Baths<=4.2986094852))
and ( ConstructionType eq . or (-0.534531265<=ConstructionType) and (ConstructionType<=3.2317789716))
and ( FirePlace eq . or (-0.423561472<=FirePlace) and (FirePlace<=2.1483321144))
and ( FirstFloor eq . or (460.8149598<=FirstFloor) and (FirstFloor<=1635.6621044))
and ( GarageSize eq . or (-0.616145439<=GarageSize) and (GarageSize<=2.7262371819))
and ( SecondFloor eq . or (-625.7857762<=SecondFloor) and (SecondFloor<=760.21696885))
and ( TotalArea eq . or (419.22056596<=TotalArea) and (TotalArea<=2421.2656726))
and ( UpperArea eq . or (-435.1874089<=UpperArea) and (UpperArea<=1044.7653905))
;
