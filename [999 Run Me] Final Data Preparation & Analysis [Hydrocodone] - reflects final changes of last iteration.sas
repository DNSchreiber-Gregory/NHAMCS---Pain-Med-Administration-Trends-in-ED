libname NHAMCS "H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets";

/* NOTE: RUN FORMATS CODE FIRST */
/* Array Code: https://support.sas.com/resources/papers/proceedings/proceedings/sugi29/259-29.pdf */

data Dataset1;
	set NHAMCS.TrimDataset;
run;

proc contents data=Dataset1;
run;

/* Note: all data adjustments were performed with individual if-then-else statements for ease in identification and clarity/transparency of design */

/* Dataset Trim per new variables from 2021.05.05 */
/* Drug Type */
data Dataset1;
	set Dataset1;
	length Drug_Hydrocodone $60.; 
	length Drug_Hydro_COMSTAT1 $60.; length Drug_Hydro_COMSTAT2 $60.; length Drug_Hydro_COMSTAT3 $60.; length Drug_Hydro_COMSTAT4 $60.; 
	length Drug_Hydro_GPMED1 $60.; length Drug_Hydro_GPMED2 $60.; length Drug_Hydro_GPMED3 $60.; length Drug_Hydro_GPMED4 $60.; 
	length Drug_Hydro_PRESCR1 $60.; length Drug_Hydro_PRESCR2 $60.; length Drug_Hydro_PRESCR3 $60.; length Drug_Hydro_PRESCR4 $60.; length Drug_Hydro_PRESCR5 $60.; length Drug_Hydro_PRESCR6 $60.; 
	length Drug_APAP_Hydrocodone $60.;
	length Drug_APAP_COMSTAT1 $60.; length Drug_APAP_COMSTAT2 $60.; length Drug_APAP_COMSTAT3 $60.; length Drug_APAP_COMSTAT4 $60.; 
	length Drug_APAP_GPMED1 $60.; length Drug_APAP_GPMED2 $60.; length Drug_APAP_GPMED3 $60.; length Drug_APAP_GPMED4 $60.; 
	length Drug_APAP_PRESCR1 $60.; length Drug_APAP_PRESCR2 $60.; length Drug_APAP_PRESCR3 $60.; length Drug_APAP_PRESCR4 $60.; length Drug_APAP_PRESCR5 $60.; length Drug_APAP_PRESCR6 $60.; 
	length Drug_IBP_Hydrocodone $60.;
	length Drug_IBP_COMSTAT1 $60.; length Drug_IBP_COMSTAT2 $60.; length Drug_IBP_COMSTAT3 $60.; length Drug_IBP_COMSTAT4 $60.; 
	length Drug_IBP_GPMED1 $60.; length Drug_IBP_GPMED2 $60.; length Drug_IBP_GPMED3 $60.; length Drug_IBP_GPMED4 $60.; 
	length Drug_IBP_PRESCR1 $60.; length Drug_IBP_PRESCR2 $60.; length Drug_IBP_PRESCR3 $60.; length Drug_IBP_PRESCR4 $60.; length Drug_IBP_PRESCR5 $60.; length Drug_IBP_PRESCR6 $60.; 
	array drug (30)  DRUGID1 - DRUGID30;
	array comstatfa (30) COMSTAT1 - COMSTAT30;
	array gpmedfa (30) GPMED1 - GPMED30;
	array prescrfa (30) PRESCR1 - PRESCR30;
	/* APAP is acetaminophen, ASA is aspirin, IBP is ibuprofen */
	do i = 1 to 30;
		if (drug(i)="d03075") then Drug_Hydrocodone="Hydrocodone";
			if (drug(i)="d03075" and comstatfa(i)=1) then Drug_Hydro_COMSTAT1="Hydrocodone - Single Entity Drug";
			if (drug(i)="d03075" and comstatfa(i)=2) then Drug_Hydro_COMSTAT2="Hydrocodone - Combination Drug";
			if (drug(i)="d03075" and comstatfa(i)=3) then Drug_Hydro_COMSTAT3="Hydrocodone - Composition Status Undetermined";
			if (drug(i)="d03075" and comstatfa(i)=.) then Drug_Hydro_COMSTAT4="Hydrocodone - Composition Status N/A";
			if (drug(i)="d03075" and gpmedfa(i)=1) then Drug_Hydro_GPMED1="Hydrocodone - Given in ED";
			if (drug(i)="d03075" and gpmedfa(i)=2) then Drug_Hydro_GPMED2="Hydrocodone - Rx at Discharge";
			if (drug(i)="d03075" and gpmedfa(i)=3) then Drug_Hydro_GPMED3="Hydrocodone - Both given and Rx Marked";
			if (drug(i)="d03075" and gpmedfa(i)<0) then Drug_Hydro_GPMED4="Hydrocodone - Med Given Type N/A";
			if (drug(i)="d03075" and prescrfa(i)=1) then Drug_Hydro_PRESCR1="Hydrocodone - Status: Prescription Drug";
			if (drug(i)="d03075" and prescrfa(i)=2) then Drug_Hydro_PRESCR2="Hydrocodone - Status: Nonprescription Drug";
			if (drug(i)="d03075" and prescrfa(i)=3) then Drug_Hydro_PRESCR3="Hydrocodone - Status: Undetermined";
			if (drug(i)="d03075" and prescrfa(i)=4) then Drug_Hydro_PRESCR4="Hydrocodone - Status: Illicit";
			if (drug(i)="d03075" and prescrfa(i)=5) then Drug_Hydro_PRESCR5="Hydrocodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d03075" and prescrfa(i)=.) then Drug_Hydro_PRESCR6="Hydrocodone - Status: N/A";
		if (drug(i)="d03428") then Drug_APAP_Hydrocodone="APAP Hydrocodone";
			if (drug(i)="d03428" and comstatfa(i)=1) then Drug_APAP_COMSTAT1="APAP Hydrocodone - Single Entity Drug";
			if (drug(i)="d03428" and comstatfa(i)=2) then Drug_APAP_COMSTAT2="APAP Hydrocodone - Combination Drug";
			if (drug(i)="d03428" and comstatfa(i)=3) then Drug_APAP_COMSTAT3="APAP Hydrocodone - Composition Status Undetermined";
			if (drug(i)="d03428" and comstatfa(i)=.) then Drug_APAP_COMSTAT4="APAP Hydrocodone - Composition Status N/A";
			if (drug(i)="d03428" and gpmedfa(i)=1) then Drug_APAP_GPMED1="APAP Hydrocodone - Given in ED";
			if (drug(i)="d03428" and gpmedfa(i)=2) then Drug_APAP_GPMED2="APAP Hydrocodone - Rx at Discharge";
			if (drug(i)="d03428" and gpmedfa(i)=3) then Drug_APAP_GPMED3="APAP Hydrocodone - Both given and Rx Marked";
			if (drug(i)="d03428" and gpmedfa(i)<0) then Drug_APAP_GPMED4="APAP Hydrocodone - Med Given Type N/A";
			if (drug(i)="d03428" and prescrfa(i)=1) then Drug_APAP_PRESCR1="APAP Hydrocodone - Status: Prescription Drug";
			if (drug(i)="d03428" and prescrfa(i)=2) then Drug_APAP_PRESCR2="APAP Hydrocodone - Status: Nonprescription Drug";
			if (drug(i)="d03428" and prescrfa(i)=3) then Drug_APAP_PRESCR3="APAP Hydrocodone - Status: Undetermined";
			if (drug(i)="d03428" and prescrfa(i)=4) then Drug_APAP_PRESCR4="APAP Hydrocodone - Status: Illicit";
			if (drug(i)="d03428" and prescrfa(i)=5) then Drug_APAP_PRESCR5="APAP Hydrocodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d03428" and prescrfa(i)=.) then Drug_APAP_PRESCR6="APAP Hydrocodone - Status: N/A";
		if (drug(i)="d04225") then Drug_IBP_Hydrocodone="IBP Hydrocodone";
			if (drug(i)="d04225" and comstatfa(i)=1) then Drug_IBP_COMSTAT1="IBP Hydrocodone - Single Entity Drug";
			if (drug(i)="d04225" and comstatfa(i)=2) then Drug_IBP_COMSTAT2="IBP Hydrocodone - Combination Drug";
			if (drug(i)="d04225" and comstatfa(i)=3) then Drug_IBP_COMSTAT3="IBP Hydrocodone - Composition Status Undetermined";
			if (drug(i)="d04225" and comstatfa(i)=.) then Drug_IBP_COMSTAT4="IBP Hydrocodone - Composition Status N/A";
			if (drug(i)="d04225" and gpmedfa(i)=1) then Drug_IBP_GPMED1="IBP Hydrocodone - Given in ED";
			if (drug(i)="d04225" and gpmedfa(i)=2) then Drug_IBP_GPMED2="IBP Hydrocodone - Rx at Discharge";
			if (drug(i)="d04225" and gpmedfa(i)=3) then Drug_IBP_GPMED3="IBP Hydrocodone - Both given and Rx Marked";
			if (drug(i)="d04225" and gpmedfa(i)<0) then Drug_IBP_GPMED4="IBP Hydrocodone - Med Given Type N/A";
			if (drug(i)="d04225" and prescrfa(i)=1) then Drug_IBP_PRESCR1="IBP Hydrocodone - Status: Prescription Drug";
			if (drug(i)="d04225" and prescrfa(i)=2) then Drug_IBP_PRESCR2="IBP Hydrocodone - Status: Nonprescription Drug";
			if (drug(i)="d04225" and prescrfa(i)=3) then Drug_IBP_PRESCR3="IBP Hydrocodone - Status: Undetermined";
			if (drug(i)="d04225" and prescrfa(i)=4) then Drug_IBP_PRESCR4="IBP Hydrocodone - Status: Illicit";
			if (drug(i)="d04225" and prescrfa(i)=5) then Drug_IBP_PRESCR5="IBP Hydrocodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d04225" and prescrfa(i)=.) then Drug_IBP_PRESCR6="IBP Hydrocodone - Status: N/A";
	end;
	drop i;
run;

/* Medication Name */
data Dataset1;
	set Dataset1;
	length Med_Hydrocodone $60.; 
	length Med_Hydro_COMSTAT1 $60.; length Med_Hydro_COMSTAT2 $60.; length Med_Hydro_COMSTAT3 $60.; length Med_Hydro_COMSTAT4 $60.; 
	length Med_Hydro_GPMED1 $60.; length Med_Hydro_GPMED2 $60.; length Med_Hydro_GPMED3 $60.; length Med_Hydro_GPMED4 $60.; 
	length Med_Hydro_PRESCR1 $60.; length Med_Hydro_PRESCR2 $60.; length Med_Hydro_PRESCR3 $60.; length Med_Hydro_PRESCR4 $60.; length Med_Hydro_PRESCR5 $60.; length Med_Hydro_PRESCR6 $60.; 
	length Med_APAP_Hydrocodone $60.;
	length Med_APAP_COMSTAT1 $60.; length Med_APAP_COMSTAT2 $60.; length Med_APAP_COMSTAT3 $60.; length Med_APAP_COMSTAT4 $60.; 
	length Med_APAP_GPMED1 $60.; length Med_APAP_GPMED2 $60.; length Med_APAP_GPMED3 $60.; length Med_APAP_GPMED4 $60.; 
	length Med_APAP_PRESCR1 $60.; length Med_APAP_PRESCR2 $60.; length Med_APAP_PRESCR3 $60.; length Med_APAP_PRESCR4 $60.; length Med_APAP_PRESCR5 $60.; length Med_APAP_PRESCR6 $60.; 
	length Med_IBP_Hydrocodone $60.;
	length Med_IBP_COMSTAT1 $60.; length Med_IBP_COMSTAT2 $60.; length Med_IBP_COMSTAT3 $60.; length Med_IBP_COMSTAT4 $60.; 
	length Med_IBP_GPMED1 $60.; length Med_IBP_GPMED2 $60.; length Med_IBP_GPMED3 $60.; length Med_IBP_GPMED4 $60.; 
	length Med_IBP_PRESCR1 $60.; length Med_IBP_PRESCR2 $60.; length Med_IBP_PRESCR3 $60.; length Med_IBP_PRESCR4 $60.; length Med_IBP_PRESCR5 $60.; length Med_IBP_PRESCR6 $60.; 
	length Med_Hydrocodone_ER $60.;
	length Med_HydroER_COMSTAT1 $60.; length Med_HydroER_COMSTAT2 $60.; length Med_HydroER_COMSTAT3 $60.; length Med_HydroER_COMSTAT4 $60.; 
	length Med_HydroER_GPMED1 $60.; length Med_HydroER_GPMED2 $60.; length Med_HydroER_GPMED3 $60.; length Med_HydroER_GPMED4 $60.; 
	length Med_HydroER_PRESCR1 $60.; length Med_HydroER_PRESCR2 $60.; length Med_HydroER_PRESCR3 $60.; length Med_HydroER_PRESCR4 $60.; length Med_HydroER_PRESCR5 $60.; length Med_HydroER_PRESCR6 $60.; 
	array medic (30)  MED1 - MED30;
	array constatfb (30) COMSTAT1 - COMSTAT30;
	array gpmedfb (30) GPMED1 - GPMED30;
	array prescrb (30) PRESCR1 - PRESCR30;
	do i = 1 to 30;
		if ((medic(i)="14955")) then Med_Hydrocodone="Hydrocodone IR";
			if ((medic(i)="14955") and constatfb(i)=1) then Med_Hydro_COMSTAT1="Hydrocodone IR - Single Entity Drug";
			if ((medic(i)="14955") and constatfb(i)=2) then Med_Hydro_COMSTAT2="Hydrocodone IR - Combination Drug";
			if ((medic(i)="14955") and constatfb(i)=3) then Med_Hydro_COMSTAT3="Hydrocodone IR - Composition Status Undetermined";
			if ((medic(i)="14955") and constatfb(i)=.) then Med_Hydro_COMSTAT4="Hydrocodone IR - Composition Status N/A";
			if ((medic(i)="14955") and gpmedfb(i)=1) then Med_Hydro_GPMED1="Hydrocodone IR - Given in ED";
			if ((medic(i)="14955") and gpmedfb(i)=2) then Med_Hydro_GPMED2="Hydrocodone IR - Rx at Discharge";
			if ((medic(i)="14955") and gpmedfb(i)=3) then Med_Hydro_GPMED3="Hydrocodone IR - Both given and Rx Marked";
			if ((medic(i)="14955") and gpmedfb(i)<0) then Med_Hydro_GPMED4="Hydrocodone IR - Med Given Type N/A";
			if ((medic(i)="14955") and prescrb(i)=1) then Med_Hydro_PRESCR1="Hydrocodone IR - Status: Prescription Drug";
			if ((medic(i)="14955") and prescrb(i)=2) then Med_Hydro_PRESCR2="Hydrocodone IR - Status: Nonprescription Drug";
			if ((medic(i)="14955") and prescrb(i)=3) then Med_Hydro_PRESCR3="Hydrocodone IR - Status: Undetermined";
			if ((medic(i)="14955") and prescrb(i)=4) then Med_Hydro_PRESCR4="Hydrocodone IR - Status: Illicit";
			if ((medic(i)="14955") and prescrb(i)=5) then Med_Hydro_PRESCR5="Hydrocodone IR - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="14955") and prescrb(i)=.) then Med_Hydro_PRESCR6="Hydrocodone IR - Status: N/A";
		if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314")) then Med_APAP_Hydrocodone="APAP Hydrocodone";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and constatfb(i)=1) then Med_APAP_COMSTAT1="APAP Hydrocodone - Single Entity Drug";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and constatfb(i)=2) then Med_APAP_COMSTAT2="APAP Hydrocodone - Combination Drug";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and constatfb(i)=3) then Med_APAP_COMSTAT3="APAP Hydrocodone - Composition Status Undetermined";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and constatfb(i)=.) then Med_APAP_COMSTAT4="APAP Hydrocodone - Composition Status N/A";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and gpmedfb(i)=1) then Med_APAP_GPMED1="APAP Hydrocodone - Given in ED";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and gpmedfb(i)=2) then Med_APAP_GPMED2="APAP Hydrocodone - Rx at Discharge";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and gpmedfb(i)=3) then Med_APAP_GPMED3="APAP Hydrocodone - Both given and Rx Marked";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and gpmedfb(i)<0) then Med_APAP_GPMED4="APAP Hydrocodone - Med Given Type N/A";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and prescrb(i)=1) then Med_APAP_PRESCR1="APAP Hydrocodone - Status: Prescription Drug";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and prescrb(i)=2) then Med_APAP_PRESCR2="APAP Hydrocodone - Status: Nonprescription Drug";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and prescrb(i)=3) then Med_APAP_PRESCR3="APAP Hydrocodone - Status: Undetermined";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and prescrb(i)=4) then Med_APAP_PRESCR4="APAP Hydrocodone - Status: Illicit";
			if ((medic(i)="89039" or medic(i)="96028" or medic(i)="98036" or medic(i)="34110" or medic(i)="92180" or medic(i)="02314") and prescrb(i)=5) then Med_APAP_PRESCR5="APAP Hydrocodone - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="00283") and prescrb(i)=.) then Med_APAP_PRESCR6="APAP Hydrocodone - Status: N/A";
		if ((medic(i)="98043")) then Med_IBP_Hydrocodone="Hydrocodone IBP";
			if ((medic(i)="98043") and constatfb(i)=1) then Med_IBP_COMSTAT1="Hydrocodone IBP - Single Entity Drug";
			if ((medic(i)="98043") and constatfb(i)=2) then Med_IBP_COMSTAT2="Hydrocodone IBP - Combination Drug";
			if ((medic(i)="98043") and constatfb(i)=3) then Med_IBP_COMSTAT3="Hydrocodone IBP - Composition Status Undetermined";
			if ((medic(i)="98043") and constatfb(i)=.) then Med_IBP_COMSTAT4="Hydrocodone IBP - Composition Status N/A";
			if ((medic(i)="98043") and gpmedfb(i)=1) then Med_IBP_GPMED1="Hydrocodone IBP - Given in ED";
			if ((medic(i)="98043") and gpmedfb(i)=2) then Med_IBP_GPMED2="Hydrocodone IBP - Rx at Discharge";
			if ((medic(i)="98043") and gpmedfb(i)=3) then Med_IBP_GPMED3="Hydrocodone IBP - Both given and Rx Marked";
			if ((medic(i)="98043") and gpmedfb(i)<0) then Med_IBP_GPMED4="Hydrocodone IBP - Med Given Type N/A";
			if ((medic(i)="98043") and prescrb(i)=1) then Med_IBP_PRESCR1="Hydrocodone IBP - Status: Prescription Drug";
			if ((medic(i)="98043") and prescrb(i)=2) then Med_IBP_PRESCR2="Hydrocodone IBP - Status: Nonprescription Drug";
			if ((medic(i)="98043") and prescrb(i)=3) then Med_IBP_PRESCR3="Hydrocodone IBP - Status: Undetermined";
			if ((medic(i)="98043") and prescrb(i)=4) then Med_IBP_PRESCR4="Hydrocodone IBP - Status: Illicit";
			if ((medic(i)="98043") and prescrb(i)=5) then Med_IBP_PRESCR5="Hydrocodone IBP - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="98043") and prescrb(i)=.) then Med_IBP_PRESCR6="Hydrocodone IBP - Status: N/A";
		if (medic(i)="15043") then Med_Hydrocodone_ER="Hydrocodone ER";
			if (medic(i)="15043" and constatfb(i)=1) then Med_HydroER_COMSTAT1="Hydrocodone ER - Single Entity Drug";
			if (medic(i)="15043" and constatfb(i)=2) then Med_HydroER_COMSTAT2="Hydrocodone ER - Combination Drug";
			if (medic(i)="15043" and constatfb(i)=3) then Med_HydroER_COMSTAT3="Hydrocodone ER - Composition Status Undetermined";
			if (medic(i)="15043" and constatfb(i)=.) then Med_HydroER_COMSTAT4="Hydrocodone ER - Composition Status N/A";
			if (medic(i)="15043" and gpmedfb(i)=1) then Med_HydroER_GPMED1="Hydrocodone ER - Given in ED";
			if (medic(i)="15043" and gpmedfb(i)=2) then Med_HydroER_GPMED2="Hydrocodone ER - Rx at Discharge";
			if (medic(i)="15043" and gpmedfb(i)=3) then Med_HydroER_GPMED3="Hydrocodone ER - Both given and Rx Marked";
			if (medic(i)="15043" and gpmedfb(i)<0) then Med_HydroER_GPMED4="Hydrocodone ER - Med Given Type N/A";
			if (medic(i)="15043" and prescrb(i)=1) then Med_HydroER_PRESCR1="Hydrocodone ER - Status: Prescription Drug";
			if (medic(i)="15043" and prescrb(i)=2) then Med_HydroER_PRESCR2="Hydrocodone ER - Status: Nonprescription Drug";
			if (medic(i)="15043" and prescrb(i)=3) then Med_HydroER_PRESCR3="Hydrocodone ER - Status: Undetermined";
			if (medic(i)="15043" and prescrb(i)=4) then Med_HydroER_PRESCR4="Hydrocodone ER - Status: Illicit";
			if (medic(i)="15043" and prescrb(i)=5) then Med_HydroER_PRESCR5="Hydrocodone ER - Status: Prescription or Nonprescription Drug";
			if (medic(i)="15043" and prescrb(i)=.) then Med_HydroER_PRESCR6="Hydrocodone ER - Status: N/A";
	end;
	drop i;
run;

data Dataset1;
	set Dataset1;
	length Reason_Abdominal_Pain $60.;
	length Reason_Back_Pain $60.;
	length Reason_Chest_Pain $60.;
	length Reason_Headache $60.;
	length Reason_Musculoskeletal_Pain $60.;
	length Reason_Dental_Pain $60.;
	array mainreason (10)  RFV1 RFV2 RFV3 RFV4 RFV5 RFV13D RFV23D RFV33D RFV43D RFV53D;
	do i = 1 to 10;
		if (mainreason(i)="10552" or mainreason(i)="15450" or mainreason(i)="15451" or mainreason(i)="15452" or mainreason(i)="15453" or mainreason(i)="1545") then Reason_Abdominal_Pain="Abdominal Pain";
		if (mainreason(i)="19051" or mainreason(i)="19101") then Reason_Back_Pain="Back Pain";
		if (mainreason(i)="10500" or mainreason(i)="10501" or mainreason(i)="1050") then Reason_Chest_Pain="Chest Pain";
		if (mainreason(i)="12100" or mainreason(i)="23650" or mainreason(i)="1210" or mainreason(i)="2365") then Reason_Headache="Headache";
		if (mainreason(i)="10551" or mainreason(i)="10553" or mainreason(i)="17751" or mainreason(i)="19001" or mainreason(i)="19151" or mainreason(i)="19201"
			or mainreason(i)="19251" or mainreason(i)="19301" or mainreason(i)="19351" or mainreason(i)="19401" or mainreason(i)="19451" or mainreason(i)="19501"
			or mainreason(i)="19551" or mainreason(i)="19601" or mainreason(i)="19651" or mainreason(i)="19701" or mainreason(i)="26755") then Reason_Musculoskeletal_Pain="Musculoskeletal Pain";
		if (mainreason(i)="15000" or mainreason(i)="15001" or mainreason(i)="15002" or mainreason(i)="15003" 
			or mainreason(i)="87362" or mainreason(i)="87363" or mainreason(i)="87372" or mainreason(i)="87383") then Reason_Dental_Pain="Dental Pain";
	end;
	drop i;
run;

data Dataset_Final;
	set Dataset1;
	length All_Pain_Med $100.;
		All_Pain_Med = cats(Med_Hydrocodone,'/',Med_Hydrocodone_ER,'/',Med_APAP_Hydrocodone,'/',Med_IBP_Hydrocodone);
	length All_Pain_DrugType $100.;
		All_Pain_DrugType = cats(Drug_Hydrocodone,'/',Drug_APAP_Hydrocodone,'/',Drug_IBP_Hydrocodone);
	length Reason_4_Visit $100.;
		Reason_4_Visit = cats(Reason_Abdominal_Pain,'/',Reason_Back_Pain,'/',Reason_Chest_Pain,'/',Reason_Headache,'/',Reason_Musculoskeletal_Pain,'/',Reason_Dental_Pain);
	if (missing(Med_Hydrocodone) and missing(Med_Hydrocodone_ER) and missing(Med_APAP_Hydrocodone)
		 and missing(Med_IBP_Hydrocodone)
		and missing(Drug_Hydrocodone) and missing(Drug_APAP_Hydrocodone) and missing(Drug_IBP_Hydrocodone)) then delete;
	if Reason_4_Visit = "/////" then delete;
run;

/* Overall Tables of Main Variables - 1) Drug Type, 2) Med Name, 3) Reason for Visit */
ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med by Visit Reason - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  
			Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	title "Individual Drugs & Drug Types";
run;

proc freq data=Dataset_Final;
	table All_Pain_Med All_Pain_DrugType;
	title "Overall All Pain Med or Drug Type Combinations";
run;

proc freq data=Dataset_Final;
	table Reason_4_Visit;
	title "Reason for Visit Combinations";
run;

proc freq data=Dataset_Final;
	table Reason_4_Visit * All_Pain_Med;
	title "Reason for Visit Combinations by Pain Med Combinations";
run;

proc freq data=Dataset_Final;
	table Reason_4_Visit * All_Pain_DrugType;
	title "Reason for Visit Combinations by Drug Type Combinations";
run;

ods pdf close;

proc sort data=Dataset_Final;
	by YEAR Reason_4_Visit ;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med by Visit Reason by YEAR Reason_4_Visit - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  
			Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	by YEAR Reason_4_Visit;
	title "Individual Drugs & Drug Types";
run;

proc freq data=Dataset_Final;
	table All_Pain_Med All_Pain_DrugType;
	by YEAR Reason_4_Visit;
	title "Overall All Pain Med or Drug Type Combinations";
run;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med Name Only - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_Med Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  ;
	var AGE ;
	title "Distribution of Raw Age";
run;

%macro demographicsfreq1;
proc freq data=Dataset_Final;
	tables &medvariable * (AGER SEX ETHIM RACER RACERETH REGION);
	title "&medvariable by Demographics";
run; 
%mend demographicsfreq1;
%let medvariable=All_Pain_Med; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Hydrocodone; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Hydrocodone_ER; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_APAP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_IBP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq1;

proc means data=Dataset_Final;
	class All_Pain_Med Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  ;
	var PAIN PAINSCALE;
	title "Presenting Pain / Pain Scale";
run;

%macro logisticsfreq1;
proc freq data=Dataset_Final;
	tables &medvariable * (PAYYRH PAYHITH PAYTYPER PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP 
							OBSDIS OBSHOS ADMITHOS ADMIT HDSTAT ADISP STAY24 RETPRN RETREFFU RETRNED MED);
	title "&medvariable by Payment or Hospital Variables";
run;
%mend logisticsfreq1;
%let medvariable=All_Pain_Med; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Hydrocodone; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Hydrocodone_ER; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_APAP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_IBP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq1;

ods pdf close;

proc sort data=Dataset_Final;
	by YEAR Reason_4_Visit;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med Name Only by Year - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_Med Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  ;
	var AGE ;
	by YEAR Reason_4_Visit;
	title "Distribution of Raw Age";
run;

%macro demographicsfreq2;
proc freq data=Dataset_Final;
	tables &medvariable * (AGER SEX ETHIM RACER RACERETH REGION);
	by YEAR Reason_4_Visit;
	title "&medvariable by Demographics";
run; 
%mend demographicsfreq2;
%let medvariable=All_Pain_Med; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Hydrocodone; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Hydrocodone_ER; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_APAP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_IBP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq2;

proc means data=Dataset_Final;
	class All_Pain_Med Med_Hydrocodone Med_Hydrocodone_ER   Med_APAP_Hydrocodone  Med_IBP_Hydrocodone  ;
	var PAIN PAINSCALE;
	by YEAR Reason_4_Visit;
	title "Presenting Pain / Pain Scale";
run;

%macro logisticsfreq2;
proc freq data=Dataset_Final;
	tables &medvariable * (PAYYRH PAYHITH PAYTYPER PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP 
							OBSDIS OBSHOS ADMITHOS ADMIT HDSTAT ADISP STAY24 RETPRN RETREFFU RETRNED MED);
	by YEAR Reason_4_Visit;
	title "&medvariable by Payment or Hospital Variables";
run;
%mend logisticsfreq2;
%let medvariable=All_Pain_Med; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Hydrocodone; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Hydrocodone_ER; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_APAP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_IBP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq2;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type Only - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	var AGE ;
	title "Distribution of Raw Age";
run;

%macro demographicsfreq3;
proc freq data=Dataset_Final;
	tables &medvariable * (AGER SEX ETHIM RACER RACERETH REGION);
	title "&medvariable by Demographics";
run; 
%mend demographicsfreq3;
%let medvariable=All_Pain_DrugType; %put medvariable=medvariable; %demographicsfreq3;
%let medvariable=Drug_Hydrocodone; %put medvariable=medvariable; %demographicsfreq3;
%let medvariable=Drug_APAP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq3;
%let medvariable=Drug_IBP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq3;

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	var PAIN PAINSCALE;
	title "Presenting Pain / Pain Scale";
run;

%macro logisticsfreq3;
proc freq data=Dataset_Final;
	tables &medvariable * (PAYYRH PAYHITH PAYTYPER PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP 
							OBSDIS OBSHOS ADMITHOS ADMIT HDSTAT ADISP STAY24 RETPRN RETREFFU RETRNED MED);
	title "&medvariable by Payment or Hospital Variables";
run;
%mend logisticsfreq3;
%let medvariable=All_Pain_DrugType; %put medvariable=medvariable; %logisticsfreq3;
%let medvariable=Drug_Hydrocodone; %put medvariable=medvariable; %logisticsfreq3;
%let medvariable=Drug_APAP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq3;
%let medvariable=Drug_IBP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq3;

ods pdf close;

proc sort data=Dataset_Final;
	by YEAR Reason_4_Visit;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type Only by Year - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	var AGE ;
	by YEAR Reason_4_Visit;
	title "Distribution of Raw Age";
run;

%macro demographicsfreq4;
proc freq data=Dataset_Final;
	tables &medvariable * (AGER SEX ETHIM RACER RACERETH REGION);
	by YEAR Reason_4_Visit;
	title "&medvariable by Demographics";
run; 
%mend demographicsfreq4;
%let medvariable=All_Pain_DrugType; %put medvariable=medvariable; %demographicsfreq4;
%let medvariable=Drug_Hydrocodone; %put medvariable=medvariable; %demographicsfreq4;
%let medvariable=Drug_APAP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq4;
%let medvariable=Drug_IBP_Hydrocodone; %put medvariable=medvariable; %demographicsfreq4;

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Hydrocodone Drug_APAP_Hydrocodone Drug_IBP_Hydrocodone;
	var PAIN PAINSCALE;
	by YEAR Reason_4_Visit;
	title "Presenting Pain / Pain Scale";
run;

%macro logisticsfreq4;
proc freq data=Dataset_Final;
	tables &medvariable * (PAYYRH PAYHITH PAYTYPER PAYDK PAYMCAID PAYMCARE PAYNOCHG PAYOTH PAYPRIV PAYSELF PAYWKCMP 
							OBSDIS OBSHOS ADMITHOS ADMIT HDSTAT ADISP STAY24 RETPRN RETREFFU RETRNED MED);
	by YEAR Reason_4_Visit;
	title "&medvariable by Payment or Hospital Variables";
run;
%mend logisticsfreq4;
%let medvariable=All_Pain_DrugType; %put medvariable=medvariable; %logisticsfreq4;
%let medvariable=Drug_Hydrocodone; %put medvariable=medvariable; %logisticsfreq4;
%let medvariable=Drug_APAP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq4;
%let medvariable=Drug_IBP_Hydrocodone; %put medvariable=medvariable; %logisticsfreq4;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med by Med Information - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Med_Hydrocodone * (
		Med_Hydro_COMSTAT1 Med_Hydro_COMSTAT2 Med_Hydro_COMSTAT3 Med_Hydro_COMSTAT4 
		Med_Hydro_GPMED1 Med_Hydro_GPMED2 Med_Hydro_GPMED3 Med_Hydro_GPMED4 
		Med_Hydro_PRESCR1 Med_Hydro_PRESCR2 Med_Hydro_PRESCR3 Med_Hydro_PRESCR4 Med_Hydro_PRESCR5 Med_Hydro_PRESCR6 );
	title "Hydrocodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_APAP_Hydrocodone  * (
		Med_APAP_COMSTAT1 Med_APAP_COMSTAT2 Med_APAP_COMSTAT3 Med_APAP_COMSTAT4 
		Med_APAP_GPMED1 Med_APAP_GPMED2 Med_APAP_GPMED3 Med_APAP_GPMED4 
		Med_APAP_PRESCR1 Med_APAP_PRESCR2 Med_APAP_PRESCR3 Med_APAP_PRESCR4 Med_APAP_PRESCR5 Med_APAP_PRESCR6 );
	title "APAP Hydrocodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_IBP_Hydrocodone  * (
		Med_IBP_COMSTAT1 Med_IBP_COMSTAT2 Med_IBP_COMSTAT3 Med_IBP_COMSTAT4 
		Med_IBP_GPMED1 Med_IBP_GPMED2 Med_IBP_GPMED3 Med_IBP_GPMED4 
		Med_IBP_PRESCR1 Med_IBP_PRESCR2 Med_IBP_PRESCR3 Med_IBP_PRESCR4 Med_IBP_PRESCR5 Med_IBP_PRESCR6 );
	title "IBP Hydrocodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Hydrocodone_ER  * (
		Med_HydroER_COMSTAT1 Med_HydroER_COMSTAT2 Med_HydroER_COMSTAT3 Med_HydroER_COMSTAT4 
		Med_HydroER_GPMED1 Med_HydroER_GPMED2 Med_HydroER_GPMED3 Med_HydroER_GPMED4 
		Med_HydroER_PRESCR1 Med_HydroER_PRESCR2 Med_HydroER_PRESCR3 Med_HydroER_PRESCR4 Med_HydroER_PRESCR5 Med_HydroER_PRESCR6 );
	title "Hydrocodone ER by Med Information";
run;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type by Med Information - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Drug_Hydrocodone  * (
		Drug_Hydro_COMSTAT1  Drug_Hydro_COMSTAT2  Drug_Hydro_COMSTAT3  Drug_Hydro_COMSTAT4  
		Drug_Hydro_GPMED1  Drug_Hydro_GPMED2  Drug_Hydro_GPMED3  Drug_Hydro_GPMED4  
		Drug_Hydro_PRESCR1  Drug_Hydro_PRESCR2  Drug_Hydro_PRESCR3  Drug_Hydro_PRESCR4  Drug_Hydro_PRESCR5  Drug_Hydro_PRESCR6 );
	title "Hydrocodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Drug_APAP_Hydrocodone   * (
		Drug_APAP_COMSTAT1  Drug_APAP_COMSTAT2  Drug_APAP_COMSTAT3  Drug_APAP_COMSTAT4  
		Drug_APAP_GPMED1  Drug_APAP_GPMED2  Drug_APAP_GPMED3  Drug_APAP_GPMED4  
		Drug_APAP_PRESCR1  Drug_APAP_PRESCR2  Drug_APAP_PRESCR3  Drug_APAP_PRESCR4  Drug_APAP_PRESCR5  Drug_APAP_PRESCR6  );
	title "APAP Hydrocodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Drug_IBP_Hydrocodone   * (
		Drug_IBP_COMSTAT1  Drug_IBP_COMSTAT2  Drug_IBP_COMSTAT3  Drug_IBP_COMSTAT4  
		Drug_IBP_GPMED1  Drug_IBP_GPMED2  Drug_IBP_GPMED3  Drug_IBP_GPMED4  
		Drug_IBP_PRESCR1  Drug_IBP_PRESCR2  Drug_IBP_PRESCR3  Drug_IBP_PRESCR4  Drug_IBP_PRESCR5  Drug_IBP_PRESCR6   );
	title "IBP Hydrocodone by Med Information";
run;

ods pdf close;


PROC EXPORT
  DATA=Dataset_Final
  DBMS=xlsx 
  OUTFILE="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets\NHAMCS Trim Dataset - trimmedVR &sysdate..xlsx" 
  REPLACE;
  SHEET='Trimmed VR Dataset';
RUN;
