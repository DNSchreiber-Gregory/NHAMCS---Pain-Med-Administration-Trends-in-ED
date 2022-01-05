libname NHAMCS "H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets";

/* NOTE: RUN FORMATS CODE FIRST */

data NHAMCS.FullDataset;
	set NHAMCS.ED2007 NHAMCS.ED2008 NHAMCS.ED2009 NHAMCS.ED2010 NHAMCS.ED2011 NHAMCS.ED2012
		NHAMCS.ED2013 NHAMCS.ED2014 NHAMCS.ED2015 NHAMCS.ED2016	NHAMCS.ED2017 NHAMCS.ED2018;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Full Dataset Contents &sysdate..pdf";

proc contents data=NHAMCS.FullDataset;
run;

ods pdf close;

data NHAMCS.TrimDataset;
	set NHAMCS.FullDataset;
	keep AGE AGEFL AGER SEX SEXFL ETHIM ETHNICFL ETHUN RACEETH RACEFL RACEIM RACER RACERETH RACERFL RACEUN
			DIAG1 DIAG2 DIAG3 DIAG4 DIAG5 DIAG13D DIAG1R DIAG23D DIAG2R DIAG33D DIAG3R DIAG43D DIAG4R DIAG53D DIAG5R
			HDDIAG HDDIAG1 HDDIAG2 HDDIAG3 HDDIAG4 HDDIAG5 HDDIAG13D HDDIAG1R HDDIAG23D HDDIAG2R HDDIAG33D HDDIAG3R HDDIAG43D HDDIAG4R HDDIAG53D HDDIAG5R
			RFV1 RFV2 RFV3 RFV4 RFV5 RFV13D RFV23D RFV33D RFV43D RFV53D
			PAIN PAINSCALE VYEAR YEAR
			PAYDK PAYHITH PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYTYPE PAYTYPER PAYWKCMP PAYYRH REGION FIPSSTHOSP
			DRUGID1 DRUGID2 DRUGID3 DRUGID4 DRUGID5 DRUGID6 DRUGID7 DRUGID8 DRUGID9 DRUGID10 DRUGID11 DRUGID12 DRUGID13 DRUGID14 DRUGID15 DRUGID16 DRUGID17 DRUGID18 DRUGID19 DRUGID20
				DRUGID21 DRUGID22 DRUGID23 DRUGID24 DRUGID25 DRUGID26 DRUGID27 DRUGID28 DRUGID29 DRUGID30
			COMSTAT1 COMSTAT2 COMSTAT3 COMSTAT4 COMSTAT5 COMSTAT6 COMSTAT7 COMSTAT8 COMSTAT9 COMSTAT10 COMSTAT11 COMSTAT12 COMSTAT13 COMSTAT14 COMSTAT15 COMSTAT16 COMSTAT17 COMSTAT18
				COMSTAT19 COMSTAT20 COMSTAT21 COMSTAT22 COMSTAT23 COMSTAT24 COMSTAT25 COMSTAT26 COMSTAT27 COMSTAT28 COMSTAT29 COMSTAT30
			CONTSUB1 CONTSUB2 CONTSUB3 CONTSUB4 CONTSUB5 CONTSUB6 CONTSUB7 CONTSUB8 CONTSUB9 CONTSUB10 CONTSUB11 CONTSUB12 CONTSUB13 CONTSUB14 CONTSUB15 CONTSUB16 CONTSUB17 CONTSUB18
				CONTSUB19 CONTSUB20 CONTSUB21 CONTSUB22 CONTSUB23 CONTSUB24 CONTSUB25 CONTSUB26 CONTSUB27 CONTSUB28 CONTSUB29 CONTSUB30
			GPMED1 GPMED2 GPMED3 GPMED4 GPMED5 GPMED6 GPMED7 GPMED8 GPMED9 GPMED10 GPMED11 GPMED12 GPMED13 GPMED14 GPMED15 GPMED16 GPMED17 GPMED18 GPMED19 GPMED20
				GPMED21 GPMED22 GPMED23 GPMED24 GPMED25 GPMED26 GPMED27 GPMED28 GPMED29 GPMED30
			MED MED1 MED2 MED3 MED4 MED5 MED6 MED7 MED8 MED9 MED10 MED11 MED12 MED13 MED14 MED15 MED16 MED17 MED18 MED19 MED20 MED21 MED22 MED23 MED24 MED25 MED26 MED27 MED28 MED29 MED30
			PRESCR1 PRESCR2 PRESCR3 PRESCR4 PRESCR5 PRESCR6 PRESCR7 PRESCR8 PRESCR9 PRESCR10 PRESCR11 PRESCR12 PRESCR13 PRESCR14 PRESCR15 PRESCR16 PRESCR17 PRESCR18 PRESCR19 PRESCR20
				PRESCR21 PRESCR22 PRESCR23 PRESCR24 PRESCR25 PRESCR26 PRESCR27 PRESCR28 PRESCR29 PRESCR30
			ADISP ADMIT ADMITHOS OBSDIS OBSHOS HDDIAGR HDSTAT STAY24 RETPRN RETREFFU RETRNED
			DRUGID1 DRUGID2 DRUGID3 DRUGID4 DRUGID5 DRUGID6 DRUGID7 DRUGID8 DRUGID9 DRUGID10 DRUGID11 DRUGID12 DRUGID13 DRUGID14 DRUGID15 DRUGID16 DRUGID17 DRUGID18 DRUGID19
				DRUGID20 DRUGID21 DRUGID22 DRUGID23 DRUGID24 DRUGID25 DRUGID26 DRUGID27 DRUGID28 DRUGID29 DRUGID30
			COMSTAT1 COMSTAT2 COMSTAT3 COMSTAT4 COMSTAT5 COMSTAT6 COMSTAT7 COMSTAT8 COMSTAT9 COMSTAT10 COMSTAT11 COMSTAT12 COMSTAT13 COMSTAT14 COMSTAT15 COMSTAT16 COMSTAT17 COMSTAT18 COMSTAT19
				COMSTAT20 COMSTAT21 COMSTAT22 COMSTAT23 COMSTAT24 COMSTAT25 COMSTAT26 COMSTAT27 COMSTAT28 COMSTAT29 COMSTAT30 
			CONTSUB1 CONTSUB2 CONTSUB3 CONTSUB4 CONTSUB5 CONTSUB6 CONTSUB7 CONTSUB8 CONTSUB9 CONTSUB10 CONTSUB11 CONTSUB12 CONTSUB13 CONTSUB14 CONTSUB15 CONTSUB16 CONTSUB17 CONTSUB18 CONTSUB19
				CONTSUB20 CONTSUB21 CONTSUB22 CONTSUB23 CONTSUB24 CONTSUB25 CONTSUB26 CONTSUB27 CONTSUB28 CONTSUB29 CONTSUB30
			GPMED1 GPMED2 GPMED3 GPMED4 GPMED5 GPMED6 GPMED7 GPMED8 GPMED9 GPMED10 GPMED11 GPMED12 GPMED13 GPMED14 GPMED15 GPMED16 GPMED17 GPMED18 GPMED19
				GPMED20 GPMED21 GPMED22 GPMED23 GPMED24 GPMED25 GPMED26 GPMED27 GPMED28 GPMED29 GPMED30
			MED1 MED2 MED3 MED4 MED5 MED6 MED7 MED8 MED9 MED10 MED11 MED12 MED13 MED14 MED15 MED16 MED17 MED18 MED19 MED20 MED21 MED22 MED23 MED24 MED25 MED26 MED27 MED28 MED29 MED30
			PRESCR1 PRESCR2 PRESCR3 PRESCR4 PRESCR5 PRESCR6 PRESCR7 PRESCR8 PRESCR9 PRESCR10 PRESCR11 PRESCR12 PRESCR13 PRESCR14 PRESCR15 PRESCR16 PRESCR17 PRESCR18 PRESCR19
				PRESCR20 PRESCR21 PRESCR22 PRESCR23 PRESCR24 PRESCR25 PRESCR26 PRESCR27 PRESCR28 PRESCR29 PRESCR30;

run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Trim Dataset Contents &sysdate..pdf";

proc means data=NHAMCS.TrimDataset;
	var AGE ;
	title "Distribution of Raw Age";
run;

proc freq data=NHAMCS.TrimDataset;
	tables AGER;
	title "Age Recode";
run;

proc freq data=NHAMCS.TrimDataset;
	tables AGEFL * AGER;
	title "Imputation Check for Age";
run;

proc freq data=NHAMCS.TrimDataset;
	tables SEX;
	title "Sex";
run;

proc freq data=NHAMCS.TrimDataset;
	tables SEXFL * SEX;
	title "Imputation Check for Sex";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHIM ETHUN; 
	title "Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHIM * ETHUN; 
	title "Imputation Check for Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL * (ETHIM ETHUN); 
	title "Imputation Check for Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEIM RACEUN;
	title "Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEIM * RACEUN;
	title "Imputation Check for Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEFL * (RACEIM RACEUN);
	title "Imputation Check for Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL RACEFL;
	title "Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL * RACEFL;
	title "Imputation Check for Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEETH * (ETHNICFL RACEFL);
	title "Imputation Check for Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERFL * RACER;
	title "Imputation Check for Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERETH;
	title "Ethnicity & Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERETH * (ETHNICFL RACERFL);
	title "Imputation Check for Ethnicity & Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAIN PAINSCALE;
	title "Pain Scales";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAIN * PAINSCALE;
	title "Pain Comparison";
run;

proc freq data=NHAMCS.TrimDataset;
	tables YEAR;
	title "Year Variable Distribution";
run;

proc freq data=NHAMCS.TrimDataset;
	tables VYEAR * YEAR;
	title "Year Variable Distribution";
run;

proc freq data=NHAMCS.TrimDataset;
	tables REGION FIPSSTHOSP;
	title "Region";
run;

proc freq data=NHAMCS.TrimDataset;
	tables REGION * FIPSSTHOSP;
	title "Region Check";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	PAYYRH	PAYHITH;
	title "Meaningful Use Payment Questions";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP PAYTYPE PAYTYPER;
	title "Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAYTYPE * (PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP);
	title "Expected Source of Payment by Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	PAYTYPER * (PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP);
	title "Recoded Source of Payment (Hierarchy) by Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables OBSDIS OBSHOS;
	title "Admission to Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	ADMITHOS ADMIT;
	title "Admitted to Hospital / Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	ADMITHOS * ADMIT;
	title "Admitted to Hospital by Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	HDSTAT ADISP STAY24;
	title "Discharge Status and Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	HDSTAT * (ADISP STAY24);
	title "Discharge Status by Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RETPRN RETREFFU RETRNED MED;
	title "Follow-Up Type / Medication";
run;

proc contents data=NHAMCS.TrimDataset;
run;

ods pdf close;

proc sort data=NHAMCS.TrimDataset;
	by YEAR ;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Trim Dataset Contents by Year &sysdate..pdf";

proc means data=NHAMCS.TrimDataset;
	var AGE ;
	by Year;
	title "Distribution of Raw Age";
run;

proc freq data=NHAMCS.TrimDataset;
	tables AGER;
	by Year;
	title "Age Recode";
run;

proc freq data=NHAMCS.TrimDataset;
	tables AGEFL * AGER;
	by Year;
	title "Imputation Check for Age";
run;

proc freq data=NHAMCS.TrimDataset;
	tables SEX;
	by Year;
	title "Sex";
run;

proc freq data=NHAMCS.TrimDataset;
	tables SEXFL * SEX;
	by Year;
	title "Imputation Check for Sex";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHIM ETHUN; 
	by Year;
	title "Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHIM * ETHUN; 
	by Year;
	title "Imputation Check for Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL * (ETHIM ETHUN); 
	by Year;
	title "Imputation Check for Ethnicity Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEIM RACEUN;
	by Year;
	title "Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEIM * RACEUN;
	by Year;
	title "Imputation Check for Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEFL * (RACEIM RACEUN);
	by Year;
	title "Imputation Check for Race Only";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL RACEFL;
	by Year;
	title "Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables ETHNICFL * RACEFL;
	by Year;
	title "Imputation Check for Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACEETH * (ETHNICFL RACEFL);
	by Year;
	title "Imputation Check for Ethnicity & Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERFL * RACER;
	by Year;
	title "Imputation Check for Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERETH;
	by Year;
	title "Ethnicity & Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RACERETH * (ETHNICFL RACERFL);
	by Year;
	title "Imputation Check for Ethnicity & Recoded Race";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAIN PAINSCALE;
	by Year;
	title "Pain Scales";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAIN * PAINSCALE;
	by Year;
	title "Pain Comparison";
run;

proc freq data=NHAMCS.TrimDataset;
	tables YEAR;
	by Year;
	title "Year Variable Distribution";
run;

proc freq data=NHAMCS.TrimDataset;
	tables VYEAR * YEAR;
	by Year;
	title "Year Variable Distribution";
run;

proc freq data=NHAMCS.TrimDataset;
	tables REGION FIPSSTHOSP;
	by Year;
	title "Region";
run;

proc freq data=NHAMCS.TrimDataset;
	tables REGION * FIPSSTHOSP;
	by Year;
	title "Region Check";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	PAYYRH	PAYHITH;
	by Year;
	title "Meaningful Use Payment Questions";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP PAYTYPE PAYTYPER;
	by Year;
	title "Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables PAYTYPE * (PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP);
	by Year;
	title "Expected Source of Payment by Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	PAYTYPER * (PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP);
	by Year;
	title "Recoded Source of Payment (Hierarchy) by Payment Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables OBSDIS OBSHOS;
	by Year;
	title "Admission to Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	ADMITHOS ADMIT;
	by Year;
	title "Admitted to Hospital / Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	ADMITHOS * ADMIT;
	by Year;
	title "Admitted to Hospital by Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	HDSTAT ADISP STAY24;
	by Year;
	title "Discharge Status and Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables 	HDSTAT * (ADISP STAY24);
	by Year;
	title "Discharge Status by Discharge Type";
run;

proc freq data=NHAMCS.TrimDataset;
	tables RETPRN RETREFFU RETRNED MED;
	by Year;
	title "Follow-Up Type / Medication";
run;

ods pdf close;

PROC EXPORT
  DATA=NHAMCS.TrimDataset
  DBMS=xlsx 
  OUTFILE="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets\NHAMCS Trim Dataset &sysdate..xlsx" 
  REPLACE;
  SHEET='Full Dataset';
RUN;
