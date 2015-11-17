*------------------------------------------------------------*;
* MBR2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.SalePrice(label="SalePrice");
  length   SalePrice                            8
           ;

  label    SalePrice="SalePrice"
           ;
 SalePrice=5014;
output;
 SalePrice=135363;
output;
 SalePrice=75984.2752293578;
output;
;
run;
proc datasets lib=work nolist;
modify SalePrice(type=PROFIT label=SalePrice);
run;
quit;
*------------------------------------------------------------* ;
* MBR2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* MBR2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age Basement Baths ConstructionType FirePlace FirstFloor GarageSize SalePrice
   SecondFloor TotalArea UpperArea
%mend DMDBVar;
*------------------------------------------------------------*;
* MBR2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Part_TRAIN
dmdbcat=WORK.MBR2_DMDB
maxlevel = 513
;
id
_dataobs_
;
var %DMDBVar;
target
SalePrice
;
run;
quit;
*------------------------------------------------------------* ;
* MBR2: Interval Variables Macro ;
*------------------------------------------------------------* ;
%macro pmbrvar;
    Age Basement Baths ConstructionType FirePlace FirstFloor GarageSize
   SecondFloor TotalArea UpperArea
%mend pmbrvar;
proc pmbr data=EMWS1.Part_TRAIN dmdbcat=WORK.MBR2_DMDB
validata = EMWS1.PART_VALIDATE
outest = EMWS1.MBR2_ESTIMATE
k = 16
epsilon = 0
buckets = 8
method = RDTREE
weighted
neighbors
;
var %pmbrvar;
target SalePrice;
score data=EMWS1.PART_TRAIN
out=EMWS1.MBR2_TRAIN
role = TRAIN
;
id _dataobs_;
run;
quit;
*------------------------------------------------------------* ;
* MBR2: Interval Variables Macro ;
*------------------------------------------------------------* ;
%macro pmbrvar;
    Age Basement Baths ConstructionType FirePlace FirstFloor GarageSize
   SecondFloor TotalArea UpperArea
%mend pmbrvar;
proc pmbr data=EMWS1.Part_TRAIN dmdbcat=WORK.MBR2_DMDB
outest = WORK.MBR2_OUTEST
k = 16
epsilon = 0
buckets = 8
method = RDTREE
weighted
neighbors
;
var %pmbrvar;
target SalePrice;
score data=EMWS1.PART_VALIDATE
out=EMWS1.MBR2_VALIDATE
role = VALID
;
id _dataobs_;
run;
quit;
