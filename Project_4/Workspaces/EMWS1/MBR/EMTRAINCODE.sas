*------------------------------------------------------------*;
* MBR: Create decision matrix;
*------------------------------------------------------------*;
data WORK.SalePrice(label="SalePrice");
  length   SalePrice                            8
           ;

  label    SalePrice="SalePrice"
           ;
 SalePrice=44185;
output;
 SalePrice=121984;
output;
 SalePrice=75017.5647668393;
output;
;
run;
proc datasets lib=work nolist;
modify SalePrice(type=PROFIT label=SalePrice);
run;
quit;
*------------------------------------------------------------* ;
* MBR: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* MBR: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age Basement Baths ConstructionType FirePlace GarageSize SalePrice SecondFloor
   TotalArea
%mend DMDBVar;
*------------------------------------------------------------*;
* MBR: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.BINNING_TRAIN
dmdbcat=WORK.MBR_DMDB
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
* MBR: Interval Variables Macro ;
*------------------------------------------------------------* ;
%macro pmbrvar;
    Age Basement Baths ConstructionType FirePlace GarageSize SecondFloor TotalArea
%mend pmbrvar;
proc pmbr data=EMWS1.BINNING_TRAIN dmdbcat=WORK.MBR_DMDB
validata = EMWS1.BINNING_VALIDATE
outest = EMWS1.MBR_ESTIMATE
k = 10
epsilon = 0
buckets = 8
method = RDTREE
weighted
neighbors
;
var %pmbrvar;
target SalePrice;
score data=EMWS1.BINNING_TRAIN
out=EMWS1.MBR_TRAIN
role = TRAIN
;
id _dataobs_;
run;
quit;
*------------------------------------------------------------* ;
* MBR: Interval Variables Macro ;
*------------------------------------------------------------* ;
%macro pmbrvar;
    Age Basement Baths ConstructionType FirePlace GarageSize SecondFloor TotalArea
%mend pmbrvar;
proc pmbr data=EMWS1.BINNING_TRAIN dmdbcat=WORK.MBR_DMDB
outest = WORK.MBR_OUTEST
k = 10
epsilon = 0
buckets = 8
method = RDTREE
weighted
neighbors
;
var %pmbrvar;
target SalePrice;
score data=EMWS1.BINNING_VALIDATE
out=EMWS1.MBR_VALIDATE
role = VALID
;
id _dataobs_;
run;
quit;
