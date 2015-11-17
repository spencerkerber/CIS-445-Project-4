*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS1.BINNING_TRAIN(keep=
GRP_Age GRP_BasementType GRP_Baths GRP_CentralAir GRP_FirePlace GRP_GarageSize
GRP_TotalArea SalePrice);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    GRP_Age(ASC) GRP_BasementType(ASC) GRP_Baths(ASC) GRP_CentralAir(ASC)
   GRP_FirePlace(ASC) GRP_GarageSize(ASC) GRP_TotalArea(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    SalePrice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
SalePrice
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS1.BINNING_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
GRP_Age
GRP_BasementType
GRP_Baths
GRP_CentralAir
GRP_FirePlace
GRP_GarageSize
GRP_TotalArea
;
model SalePrice =
GRP_Age
GRP_BasementType
GRP_Baths
GRP_CentralAir
GRP_FirePlace
GRP_GarageSize
GRP_TotalArea
/error=normal
coding=DEVIATION
nodesignprint
;
;
code file="C:\Users\sakerb01\Desktop\SAS EM 12.3 Tutorials _ Projects\Project_4\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\sakerb01\Desktop\SAS EM 12.3 Tutorials _ Projects\Project_4\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
