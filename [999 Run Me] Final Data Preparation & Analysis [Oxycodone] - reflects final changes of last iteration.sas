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
	length Drug_Oxycodone $60.; 
	length Drug_Oxy_COMSTAT1 $60.; length Drug_Oxy_COMSTAT2 $60.; length Drug_Oxy_COMSTAT3 $60.; length Drug_Oxy_COMSTAT4 $60.; 
	length Drug_Oxy_GPMED1 $60.; length Drug_Oxy_GPMED2 $60.; length Drug_Oxy_GPMED3 $60.; length Drug_Oxy_GPMED4 $60.; 
	length Drug_Oxy_PRESCR1 $60.; length Drug_Oxy_PRESCR2 $60.; length Drug_Oxy_PRESCR3 $60.; length Drug_Oxy_PRESCR4 $60.; length Drug_Oxy_PRESCR5 $60.; length Drug_Oxy_PRESCR6 $60.; 
	length Drug_APAP_Oxycodone $60.;
	length Drug_APAP_COMSTAT1 $60.; length Drug_APAP_COMSTAT2 $60.; length Drug_APAP_COMSTAT3 $60.; length Drug_APAP_COMSTAT4 $60.; 
	length Drug_APAP_GPMED1 $60.; length Drug_APAP_GPMED2 $60.; length Drug_APAP_GPMED3 $60.; length Drug_APAP_GPMED4 $60.; 
	length Drug_APAP_PRESCR1 $60.; length Drug_APAP_PRESCR2 $60.; length Drug_APAP_PRESCR3 $60.; length Drug_APAP_PRESCR4 $60.; length Drug_APAP_PRESCR5 $60.; length Drug_APAP_PRESCR6 $60.; 
	length Drug_ASA_Oxycodone $60.;
	length Drug_ASA_COMSTAT1 $60.; length Drug_ASA_COMSTAT2 $60.; length Drug_ASA_COMSTAT3 $60.; length Drug_ASA_COMSTAT4 $60.; 
	length Drug_ASA_GPMED1 $60.; length Drug_ASA_GPMED2 $60.; length Drug_ASA_GPMED3 $60.; length Drug_ASA_GPMED4 $60.; 
	length Drug_ASA_PRESCR1 $60.; length Drug_ASA_PRESCR2 $60.; length Drug_ASA_PRESCR3 $60.; length Drug_ASA_PRESCR4 $60.; length Drug_ASA_PRESCR5 $60.; length Drug_ASA_PRESCR6 $60.; 
	array drug (30)  DRUGID1 - DRUGID30;
	array comstatfa (30) COMSTAT1 - COMSTAT30;
	array gpmedfa (30) GPMED1 - GPMED30;
	array prescrfa (30) PRESCR1 - PRESCR30;
	do i = 1 to 30;
		if (drug(i)="d00329") then Drug_Oxycodone="Oxycodone";
			if (drug(i)="d00329" and comstatfa(i)=1) then Drug_Oxy_COMSTAT1="Oxycodone - Single Entity Drug";
			if (drug(i)="d00329" and comstatfa(i)=2) then Drug_Oxy_COMSTAT2="Oxycodone - Combination Drug";
			if (drug(i)="d00329" and comstatfa(i)=3) then Drug_Oxy_COMSTAT3="Oxycodone - Composition Status Undetermined";
			if (drug(i)="d00329" and comstatfa(i)=.) then Drug_Oxy_COMSTAT4="Oxycodone - Composition Status N/A";
			if (drug(i)="d00329" and gpmedfa(i)=1) then Drug_Oxy_GPMED1="Oxycodone - Given in ED";
			if (drug(i)="d00329" and gpmedfa(i)=2) then Drug_Oxy_GPMED2="Oxycodone - Rx at Discharge";
			if (drug(i)="d00329" and gpmedfa(i)=3) then Drug_Oxy_GPMED3="Oxycodone - Both given and Rx Marked";
			if (drug(i)="d00329" and gpmedfa(i)<0) then Drug_Oxy_GPMED4="Oxycodone - Med Given Type N/A";
			if (drug(i)="d00329" and prescrfa(i)=1) then Drug_Oxy_PRESCR1="Oxycodone - Status: Prescription Drug";
			if (drug(i)="d00329" and prescrfa(i)=2) then Drug_Oxy_PRESCR2="Oxycodone - Status: Nonprescription Drug";
			if (drug(i)="d00329" and prescrfa(i)=3) then Drug_Oxy_PRESCR3="Oxycodone - Status: Undetermined";
			if (drug(i)="d00329" and prescrfa(i)=4) then Drug_Oxy_PRESCR4="Oxycodone - Status: Illicit";
			if (drug(i)="d00329" and prescrfa(i)=5) then Drug_Oxy_PRESCR5="Oxycodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d00329" and prescrfa(i)=.) then Drug_Oxy_PRESCR6="Oxycodone - Status: N/A";
		if (drug(i)="d03431") then Drug_APAP_Oxycodone="APAP Oxycodone";
			if (drug(i)="d03431" and comstatfa(i)=1) then Drug_APAP_COMSTAT1="APAP Oxycodone - Single Entity Drug";
			if (drug(i)="d03431" and comstatfa(i)=2) then Drug_APAP_COMSTAT2="APAP Oxycodone - Combination Drug";
			if (drug(i)="d03431" and comstatfa(i)=3) then Drug_APAP_COMSTAT3="APAP Oxycodone - Composition Status Undetermined";
			if (drug(i)="d03431" and comstatfa(i)=.) then Drug_APAP_COMSTAT4="APAP Oxycodone - Composition Status N/A";
			if (drug(i)="d03431" and gpmedfa(i)=1) then Drug_APAP_GPMED1="APAP Oxycodone - Given in ED";
			if (drug(i)="d03431" and gpmedfa(i)=2) then Drug_APAP_GPMED2="APAP Oxycodone - Rx at Discharge";
			if (drug(i)="d03431" and gpmedfa(i)=3) then Drug_APAP_GPMED3="APAP Oxycodone - Both given and Rx Marked";
			if (drug(i)="d03431" and gpmedfa(i)<0) then Drug_APAP_GPMED4="APAP Oxycodone - Med Given Type N/A";
			if (drug(i)="d03431" and prescrfa(i)=1) then Drug_APAP_PRESCR1="APAP Oxycodone - Status: Prescription Drug";
			if (drug(i)="d03431" and prescrfa(i)=2) then Drug_APAP_PRESCR2="APAP Oxycodone - Status: Nonprescription Drug";
			if (drug(i)="d03431" and prescrfa(i)=3) then Drug_APAP_PRESCR3="APAP Oxycodone - Status: Undetermined";
			if (drug(i)="d03431" and prescrfa(i)=4) then Drug_APAP_PRESCR4="APAP Oxycodone - Status: Illicit";
			if (drug(i)="d03431" and prescrfa(i)=5) then Drug_APAP_PRESCR5="APAP Oxycodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d03431" and prescrfa(i)=.) then Drug_APAP_PRESCR6="APAP Oxycodone - Status: N/A";
		if (drug(i)="d03432") then Drug_ASA_Oxycodone="ASA Oxycodone";
			if (drug(i)="d03432" and comstatfa(i)=1) then Drug_ASA_COMSTAT1="ASA Oxycodone - Single Entity Drug";
			if (drug(i)="d03432" and comstatfa(i)=2) then Drug_ASA_COMSTAT2="ASA Oxycodone - Combination Drug";
			if (drug(i)="d03432" and comstatfa(i)=3) then Drug_ASA_COMSTAT3="ASA Oxycodone - Composition Status Undetermined";
			if (drug(i)="d03432" and comstatfa(i)=.) then Drug_ASA_COMSTAT4="ASA Oxycodone - Composition Status N/A";
			if (drug(i)="d03432" and gpmedfa(i)=1) then Drug_ASA_GPMED1="ASA Oxycodone - Given in ED";
			if (drug(i)="d03432" and gpmedfa(i)=2) then Drug_ASA_GPMED2="ASA Oxycodone - Rx at Discharge";
			if (drug(i)="d03432" and gpmedfa(i)=3) then Drug_ASA_GPMED3="ASA Oxycodone - Both given and Rx Marked";
			if (drug(i)="d03432" and gpmedfa(i)<0) then Drug_ASA_GPMED4="ASA Oxycodone - Med Given Type N/A";
			if (drug(i)="d03432" and prescrfa(i)=1) then Drug_ASA_PRESCR1="ASA Oxycodone - Status: Prescription Drug";
			if (drug(i)="d03432" and prescrfa(i)=2) then Drug_ASA_PRESCR2="ASA Oxycodone - Status: Nonprescription Drug";
			if (drug(i)="d03432" and prescrfa(i)=3) then Drug_ASA_PRESCR3="ASA Oxycodone - Status: Undetermined";
			if (drug(i)="d03432" and prescrfa(i)=4) then Drug_ASA_PRESCR4="ASA Oxycodone - Status: Illicit";
			if (drug(i)="d03432" and prescrfa(i)=5) then Drug_ASA_PRESCR5="ASA Oxycodone - Status: Prescription or Nonprescription Drug";
			if (drug(i)="d03432" and prescrfa(i)=.) then Drug_ASA_PRESCR6="ASA Oxycodone - Status: N/A";
	end;
	drop i;
run;

/* Medication Name */
data Dataset1;
	set Dataset1;
	length Med_Oxycodone $60.; 
	length Med_Oxy_COMSTAT1 $60.; length Med_Oxy_COMSTAT2 $60.; length Med_Oxy_COMSTAT3 $60.; length Med_Oxy_COMSTAT4 $60.; 
	length Med_Oxy_GPMED1 $60.; length Med_Oxy_GPMED2 $60.; length Med_Oxy_GPMED3 $60.; length Med_Oxy_GPMED4 $60.; 
	length Med_Oxy_PRESCR1 $60.; length Med_Oxy_PRESCR2 $60.; length Med_Oxy_PRESCR3 $60.; length Med_Oxy_PRESCR4 $60.; length Med_Oxy_PRESCR5 $60.; length Med_Oxy_PRESCR6 $60.; 
	length Med_APAP_Oxycodone $60.;
	length Med_APAP_COMSTAT1 $60.; length Med_APAP_COMSTAT2 $60.; length Med_APAP_COMSTAT3 $60.; length Med_APAP_COMSTAT4 $60.; 
	length Med_APAP_GPMED1 $60.; length Med_APAP_GPMED2 $60.; length Med_APAP_GPMED3 $60.; length Med_APAP_GPMED4 $60.; 
	length Med_APAP_PRESCR1 $60.; length Med_APAP_PRESCR2 $60.; length Med_APAP_PRESCR3 $60.; length Med_APAP_PRESCR4 $60.; length Med_APAP_PRESCR5 $60.; length Med_APAP_PRESCR6 $60.; 
	length Med_ASA_Oxycodone $60.;
	length Med_ASA_COMSTAT1 $60.; length Med_ASA_COMSTAT2 $60.; length Med_ASA_COMSTAT3 $60.; length Med_ASA_COMSTAT4 $60.; 
	length Med_ASA_GPMED1 $60.; length Med_ASA_GPMED2 $60.; length Med_ASA_GPMED3 $60.; length Med_ASA_GPMED4 $60.; 
	length Med_ASA_PRESCR1 $60.; length Med_ASA_PRESCR2 $60.; length Med_ASA_PRESCR3 $60.; length Med_ASA_PRESCR4 $60.; length Med_ASA_PRESCR5 $60.; length Med_ASA_PRESCR6 $60.; 
	length Med_Oxycodone_ER $60.;
	length Med_OxyER_COMSTAT1 $60.; length Med_OxyER_COMSTAT2 $60.; length Med_OxyER_COMSTAT3 $60.; length Med_OxyER_COMSTAT4 $60.; 
	length Med_OxyER_GPMED1 $60.; length Med_OxyER_GPMED2 $60.; length Med_OxyER_GPMED3 $60.; length Med_OxyER_GPMED4 $60.; 
	length Med_OxyER_PRESCR1 $60.; length Med_OxyER_PRESCR2 $60.; length Med_OxyER_PRESCR3 $60.; length Med_OxyER_PRESCR4 $60.; length Med_OxyER_PRESCR5 $60.; length Med_OxyER_PRESCR6 $60.; 
	length Med_Oxycontin $60.;
	length Med_Oxycontin_COMSTAT1 $60.; length Med_Oxycontin_COMSTAT2 $60.; length Med_Oxycontin_COMSTAT3 $60.; length Med_Oxycontin_COMSTAT4 $60.; 
	length Med_Oxycontin_GPMED1 $60.; length Med_Oxycontin_GPMED2 $60.; length Med_Oxycontin_GPMED3 $60.; length Med_Oxycontin_GPMED4 $60.; 
	length Med_Oxycontin_PRESCR1 $60.; length Med_Oxycontin_PRESCR2 $60.; length Med_Oxycontin_PRESCR3 $60.; length Med_Oxycontin_PRESCR4 $60.; length Med_Oxycontin_PRESCR5 $60.; length Med_Oxycontin_PRESCR6 $60.; 
	length Med_Oxycodone_APAP $60.;
	length Med_OxyAPAP_COMSTAT1 $60.; length Med_OxyAPAP_COMSTAT2 $60.; length Med_OxyAPAP_COMSTAT3 $60.; length Med_OxyAPAP_COMSTAT4 $60.; 
	length Med_OxyAPAP_GPMED1 $60.; length Med_OxyAPAP_GPMED2 $60.; length Med_OxyAPAP_GPMED3 $60.; length Med_OxyAPAP_GPMED4 $60.; 
	length Med_OxyAPAP_PRESCR1 $60.; length Med_OxyAPAP_PRESCR2 $60.; length Med_OxyAPAP_PRESCR3 $60.; length Med_OxyAPAP_PRESCR4 $60.; length Med_OxyAPAP_PRESCR5 $60.; length Med_OxyAPAP_PRESCR6 $60.; 
	length Med_Percocet $60.;
	length Med_Percocet_COMSTAT1 $60.; length Med_Percocet_COMSTAT2 $60.; length Med_Percocet_COMSTAT3 $60.; length Med_Percocet_COMSTAT4 $60.; 
	length Med_Percocet_GPMED1 $60.; length Med_Percocet_GPMED2 $60.; length Med_Percocet_GPMED3 $60.; length Med_Percocet_GPMED4 $60.; 
	length Med_Percocet_PRESCR1 $60.; length Med_Percocet_PRESCR2 $60.; length Med_Percocet_PRESCR3 $60.; length Med_Percocet_PRESCR4 $60.; length Med_Percocet_PRESCR5 $60.; length Med_Percocet_PRESCR6 $60.; 
	length Med_Oxycodone_ASA $60.;
	length Med_OxyASA_COMSTAT1 $60.; length Med_OxyASA_COMSTAT2 $60.; length Med_OxyASA_COMSTAT3 $60.; length Med_OxyASA_COMSTAT4 $60.; 
	length Med_OxyASA_GPMED1 $60.; length Med_OxyASA_GPMED2 $60.; length Med_OxyASA_GPMED3 $60.; length Med_OxyASA_GPMED4 $60.; 
	length Med_OxyASA_PRESCR1 $60.; length Med_OxyASA_PRESCR2 $60.; length Med_OxyASA_PRESCR3 $60.; length Med_OxyASA_PRESCR4 $60.; length Med_OxyASA_PRESCR5 $60.; length Med_OxyASA_PRESCR6 $60.; 
	length Med_Percodan $60.;
	length Med_Percodan_COMSTAT1 $60.; length Med_Percodan_COMSTAT2 $60.; length Med_Percodan_COMSTAT3 $60.; length Med_Percodan_COMSTAT4 $60.; 
	length Med_Percodan_GPMED1 $60.; length Med_Percodan_GPMED2 $60.; length Med_Percodan_GPMED3 $60.; length Med_Percodan_GPMED4 $60.; 
	length Med_Percodan_PRESCR1 $60.; length Med_Percodan_PRESCR2 $60.; length Med_Percodan_PRESCR3 $60.; length Med_Percodan_PRESCR4 $60.; length Med_Percodan_PRESCR5 $60.; length Med_Percodan_PRESCR6 $60.; 
	array medic (30)  MED1 - MED30;
	array constatfb (30) COMSTAT1 - COMSTAT30;
	array gpmedfb (30) GPMED1 - GPMED30;
	array prescrb (30) PRESCR1 - PRESCR30;
	do i = 1 to 30;
		if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152")) then Med_Oxycodone="Oxycodone";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and constatfb(i)=1) then Med_Oxy_COMSTAT1="Oxycodone - Single Entity Drug";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and constatfb(i)=2) then Med_Oxy_COMSTAT2="Oxycodone - Combination Drug";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and constatfb(i)=3) then Med_Oxy_COMSTAT3="Oxycodone - Composition Status Undetermined";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and constatfb(i)=.) then Med_Oxy_COMSTAT4="Oxycodone - Composition Status N/A";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and gpmedfb(i)=1) then Med_Oxy_GPMED1="Oxycodone - Given in ED";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and gpmedfb(i)=2) then Med_Oxy_GPMED2="Oxycodone - Rx at Discharge";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and gpmedfb(i)=3) then Med_Oxy_GPMED3="Oxycodone - Both given and Rx Marked";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and gpmedfb(i)<0) then Med_Oxy_GPMED4="Oxycodone - Med Given Type N/A";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=1) then Med_Oxy_PRESCR1="Oxycodone - Status: Prescription Drug";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=2) then Med_Oxy_PRESCR2="Oxycodone - Status: Nonprescription Drug";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=3) then Med_Oxy_PRESCR3="Oxycodone - Status: Undetermined";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=4) then Med_Oxy_PRESCR4="Oxycodone - Status: Illicit";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=5) then Med_Oxy_PRESCR5="Oxycodone - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="12028" or medic(i)="22303" or medic(i)="11254" or medic(i)="22305" or medic(i)="97181" or medic(i)="01288" or medic(i)="02333" or medic(i)="05091" or medic(i)="03152") and prescrb(i)=.) then Med_Oxy_PRESCR6="Oxycodone - Status: N/A";
		if ((medic(i)="00283")) then Med_APAP_Oxycodone="APAP Oxycodone";
			if ((medic(i)="00283") and constatfb(i)=1) then Med_APAP_COMSTAT1="APAP Oxycodone - Single Entity Drug";
			if ((medic(i)="00283") and constatfb(i)=2) then Med_APAP_COMSTAT2="APAP Oxycodone - Combination Drug";
			if ((medic(i)="00283") and constatfb(i)=3) then Med_APAP_COMSTAT3="APAP Oxycodone - Composition Status Undetermined";
			if ((medic(i)="00283") and constatfb(i)=.) then Med_APAP_COMSTAT4="APAP Oxycodone - Composition Status N/A";
			if ((medic(i)="00283") and gpmedfb(i)=1) then Med_APAP_GPMED1="APAP Oxycodone - Given in ED";
			if ((medic(i)="00283") and gpmedfb(i)=2) then Med_APAP_GPMED2="APAP Oxycodone - Rx at Discharge";
			if ((medic(i)="00283") and gpmedfb(i)=3) then Med_APAP_GPMED3="APAP Oxycodone - Both given and Rx Marked";
			if ((medic(i)="00283") and gpmedfb(i)<0) then Med_APAP_GPMED4="APAP Oxycodone - Med Given Type N/A";
			if ((medic(i)="00283") and prescrb(i)=1) then Med_APAP_PRESCR1="APAP Oxycodone - Status: Prescription Drug";
			if ((medic(i)="00283") and prescrb(i)=2) then Med_APAP_PRESCR2="APAP Oxycodone - Status: Nonprescription Drug";
			if ((medic(i)="00283") and prescrb(i)=3) then Med_APAP_PRESCR3="APAP Oxycodone - Status: Undetermined";
			if ((medic(i)="00283") and prescrb(i)=4) then Med_APAP_PRESCR4="APAP Oxycodone - Status: Illicit";
			if ((medic(i)="00283") and prescrb(i)=5) then Med_APAP_PRESCR5="APAP Oxycodone - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="00283") and prescrb(i)=.) then Med_APAP_PRESCR6="APAP Oxycodone - Status: N/A";
		if ((medic(i)="22307" or medic(i)="01099")) then Med_ASA_Oxycodone="Oxycodone ASA";
			if ((medic(i)="22307" or medic(i)="01099") and constatfb(i)=1) then Med_ASA_COMSTAT1="Oxycodone ASA - Single Entity Drug";
			if ((medic(i)="22307" or medic(i)="01099") and constatfb(i)=2) then Med_ASA_COMSTAT2="Oxycodone ASA - Combination Drug";
			if ((medic(i)="22307" or medic(i)="01099") and constatfb(i)=3) then Med_ASA_COMSTAT3="Oxycodone ASA - Composition Status Undetermined";
			if ((medic(i)="22307" or medic(i)="01099") and constatfb(i)=.) then Med_ASA_COMSTAT4="Oxycodone ASA - Composition Status N/A";
			if ((medic(i)="22307" or medic(i)="01099") and gpmedfb(i)=1) then Med_ASA_GPMED1="Oxycodone ASA - Given in ED";
			if ((medic(i)="22307" or medic(i)="01099") and gpmedfb(i)=2) then Med_ASA_GPMED2="Oxycodone ASA - Rx at Discharge";
			if ((medic(i)="22307" or medic(i)="01099") and gpmedfb(i)=3) then Med_ASA_GPMED3="Oxycodone ASA - Both given and Rx Marked";
			if ((medic(i)="22307" or medic(i)="01099") and gpmedfb(i)<0) then Med_ASA_GPMED4="Oxycodone ASA - Med Given Type N/A";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=1) then Med_ASA_PRESCR1="Oxycodone ASA - Status: Prescription Drug";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=2) then Med_ASA_PRESCR2="Oxycodone ASA - Status: Nonprescription Drug";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=3) then Med_ASA_PRESCR3="Oxycodone ASA - Status: Undetermined";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=4) then Med_ASA_PRESCR4="Oxycodone ASA - Status: Illicit";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=5) then Med_ASA_PRESCR5="Oxycodone ASA - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="22307" or medic(i)="01099") and prescrb(i)=.) then Med_ASA_PRESCR6="Oxycodone ASA - Status: N/A";
		if (medic(i)="08246") then Med_Oxycodone_ER="Oxycodone ER";
			if (medic(i)="08246" and constatfb(i)=1) then Med_OxyER_COMSTAT1="Oxycodone ER - Single Entity Drug";
			if (medic(i)="08246" and constatfb(i)=2) then Med_OxyER_COMSTAT2="Oxycodone ER - Combination Drug";
			if (medic(i)="08246" and constatfb(i)=3) then Med_OxyER_COMSTAT3="Oxycodone ER - Composition Status Undetermined";
			if (medic(i)="08246" and constatfb(i)=.) then Med_OxyER_COMSTAT4="Oxycodone ER - Composition Status N/A";
			if (medic(i)="08246" and gpmedfb(i)=1) then Med_OxyER_GPMED1="Oxycodone ER - Given in ED";
			if (medic(i)="08246" and gpmedfb(i)=2) then Med_OxyER_GPMED2="Oxycodone ER - Rx at Discharge";
			if (medic(i)="08246" and gpmedfb(i)=3) then Med_OxyER_GPMED3="Oxycodone ER - Both given and Rx Marked";
			if (medic(i)="08246" and gpmedfb(i)<0) then Med_OxyER_GPMED4="Oxycodone ER - Med Given Type N/A";
			if (medic(i)="08246" and prescrb(i)=1) then Med_OxyER_PRESCR1="Oxycodone ER - Status: Prescription Drug";
			if (medic(i)="08246" and prescrb(i)=2) then Med_OxyER_PRESCR2="Oxycodone ER - Status: Nonprescription Drug";
			if (medic(i)="08246" and prescrb(i)=3) then Med_OxyER_PRESCR3="Oxycodone ER - Status: Undetermined";
			if (medic(i)="08246" and prescrb(i)=4) then Med_OxyER_PRESCR4="Oxycodone ER - Status: Illicit";
			if (medic(i)="08246" and prescrb(i)=5) then Med_OxyER_PRESCR5="Oxycodone ER - Status: Prescription or Nonprescription Drug";
			if (medic(i)="08246" and prescrb(i)=.) then Med_OxyER_PRESCR6="Oxycodone ER - Status: N/A";
		if (medic(i)="96109") then Med_Oxycontin="Oxycontin";
			if (medic(i)="96109" and constatfb(i)=1) then Med_Oxycontin_COMSTAT1="Oxycontin - Single Entity Drug";
			if (medic(i)="96109" and constatfb(i)=2) then Med_Oxycontin_COMSTAT2="Oxycontin - Combination Drug";
			if (medic(i)="96109" and constatfb(i)=3) then Med_Oxycontin_COMSTAT3="Oxycontin - Composition Status Undetermined";
			if (medic(i)="96109" and constatfb(i)=.) then Med_Oxycontin_COMSTAT4="Oxycontin - Composition Status N/A";
			if (medic(i)="96109" and gpmedfb(i)=1) then Med_Oxycontin_GPMED1="Oxycontin - Given in ED";
			if (medic(i)="96109" and gpmedfb(i)=2) then Med_Oxycontin_GPMED2="Oxycontin - Rx at Discharge";
			if (medic(i)="96109" and gpmedfb(i)=3) then Med_Oxycontin_GPMED3="Oxycontin - Both given and Rx Marked";
			if (medic(i)="96109" and gpmedfb(i)<0) then Med_Oxycontin_GPMED4="Oxycontin - Med Given Type N/A";
			if (medic(i)="96109" and prescrb(i)=1) then Med_Oxycontin_PRESCR1="Oxycontin - Status: Prescription Drug";
			if (medic(i)="96109" and prescrb(i)=2) then Med_Oxycontin_PRESCR2="Oxycontin - Status: Nonprescription Drug";
			if (medic(i)="96109" and prescrb(i)=3) then Med_Oxycontin_PRESCR3="Oxycontin - Status: Undetermined";
			if (medic(i)="96109" and prescrb(i)=4) then Med_Oxycontin_PRESCR4="Oxycontin - Status: Illicit";
			if (medic(i)="96109" and prescrb(i)=5) then Med_Oxycontin_PRESCR5="Oxycontin - Status: Prescription or Nonprescription Drug";
			if (medic(i)="96109" and prescrb(i)=.) then Med_Oxycontin_PRESCR6="Oxycontin - Status: N/A";
		if (medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") then Med_Oxycodone_APAP="Oxycodone APAP";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and constatfb(i)=1) then Med_OxyAPAP_COMSTAT1="Oxycodone APAP - Single Entity Drug";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and constatfb(i)=2) then Med_OxyAPAP_COMSTAT2="Oxycodone APAP - Combination Drug";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and constatfb(i)=3) then Med_OxyAPAP_COMSTAT3="Oxycodone APAP - Composition Status Undetermined";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and constatfb(i)=.) then Med_OxyAPAP_COMSTAT4="Oxycodone APAP - Composition Status N/A";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and gpmedfb(i)=1) then Med_OxyAPAP_GPMED1="Oxycodone APAP - Given in ED";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and gpmedfb(i)=2) then Med_OxyAPAP_GPMED2="Oxycodone APAP - Rx at Discharge";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and gpmedfb(i)=3) then Med_OxyAPAP_GPMED3="Oxycodone APAP - Both given and Rx Marked";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and gpmedfb(i)<0) then Med_OxyAPAP_GPMED4="Oxycodone APAP - Med Given Type N/A";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=1) then Med_OxyAPAP_PRESCR1="Oxycodone APAP - Status: Prescription Drug";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=2) then Med_OxyAPAP_PRESCR2="Oxycodone APAP - Status: Nonprescription Drug";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=3) then Med_OxyAPAP_PRESCR3="Oxycodone APAP - Status: Undetermined";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=4) then Med_OxyAPAP_PRESCR4="Oxycodone APAP - Status: Illicit";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=5) then Med_OxyAPAP_PRESCR5="Oxycodone APAP - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="22305" or medic(i)="22306" or medic(i)="99114" or medic(i)="07632" or medic(i)="08248" or medic(i)="26958" or medic(i)="91048" or medic(i)="32945" or medic(i)="11072") and prescrb(i)=.) then Med_OxyAPAP_PRESCR6="Oxycodone APAP - Status: N/A";
		if (medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") then Med_Percocet="Percocet";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and constatfb(i)=1) then Med_Percocet_COMSTAT1="Percocet - Single Entity Drug";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and constatfb(i)=2) then Med_Percocet_COMSTAT2="Percocet - Combination Drug";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and constatfb(i)=3) then Med_Percocet_COMSTAT3="Percocet - Composition Status Undetermined";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and constatfb(i)=.) then Med_Percocet_COMSTAT4="Percocet - Composition Status N/A";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and gpmedfb(i)=1) then Med_Percocet_GPMED1="Percocet - Given in ED";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and gpmedfb(i)=2) then Med_Percocet_GPMED2="Percocet - Rx at Discharge";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and gpmedfb(i)=3) then Med_Percocet_GPMED3="Percocet - Both given and Rx Marked";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and gpmedfb(i)<0) then Med_Percocet_GPMED4="Percocet - Med Given Type N/A";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=1) then Med_Percocet_PRESCR1="Percocet - Status: Prescription Drug";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=2) then Med_Percocet_PRESCR2="Percocet - Status: Nonprescription Drug";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=3) then Med_Percocet_PRESCR3="Percocet - Status: Undetermined";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=4) then Med_Percocet_PRESCR4="Percocet - Status: Illicit";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=5) then Med_Percocet_PRESCR5="Percocet - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="07251" or medic(i)="07252" or medic(i)="12046" or medic(i)="23385") and prescrb(i)=.) then Med_Percocet_PRESCR6="Percocet - Status: N/A";
		if (medic(i)="23390" or medic(i)="23395") then Med_Percodan="Percodan";
			if ((medic(i)="23390" or medic(i)="23395") and constatfb(i)=1) then Med_Percodan_COMSTAT1="Percodan - Single Entity Drug";
			if ((medic(i)="23390" or medic(i)="23395") and constatfb(i)=2) then Med_Percodan_COMSTAT2="Percodan - Combination Drug";
			if ((medic(i)="23390" or medic(i)="23395") and constatfb(i)=3) then Med_Percodan_COMSTAT3="Percodan - Composition Status Undetermined";
			if ((medic(i)="23390" or medic(i)="23395") and constatfb(i)=.) then Med_Percodan_COMSTAT4="Percodan - Composition Status N/A";
			if ((medic(i)="23390" or medic(i)="23395") and gpmedfb(i)=1) then Med_Percodan_GPMED1="Percodan - Given in ED";
			if ((medic(i)="23390" or medic(i)="23395") and gpmedfb(i)=2) then Med_Percodan_GPMED2="Percodan - Rx at Discharge";
			if ((medic(i)="23390" or medic(i)="23395") and gpmedfb(i)=3) then Med_Percodan_GPMED3="Percodan - Both given and Rx Marked";
			if ((medic(i)="23390" or medic(i)="23395") and gpmedfb(i)<0) then Med_Percodan_GPMED4="Percodan - Med Given Type N/A";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=1) then Med_Percodan_PRESCR1="Percodan - Status: Prescription Drug";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=2) then Med_Percodan_PRESCR2="Percodan - Status: Nonprescription Drug";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=3) then Med_Percodan_PRESCR3="Percodan - Status: Undetermined";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=4) then Med_Percodan_PRESCR4="Percodan - Status: Illicit";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=5) then Med_Percodan_PRESCR5="Percodan - Status: Prescription or Nonprescription Drug";
			if ((medic(i)="23390" or medic(i)="23395") and prescrb(i)=.) then Med_Percodan_PRESCR6="Percodan - Status: N/A";
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
		All_Pain_Med = cats(Med_Oxycodone,'/',Med_Oxycodone_ER,'/',Med_Oxycontin,'/',Med_Oxycodone_APAP,'/',Med_APAP_Oxycodone,'/',Med_Percocet,'/',Med_ASA_Oxycodone,'/',Med_Oxycodone_ASA,'/',Med_Percodan);
	length All_Pain_DrugType $100.;
		All_Pain_DrugType = cats(Drug_Oxycodone,'/',Drug_APAP_Oxycodone,'/',Drug_ASA_Oxycodone);
	length Reason_4_Visit $100.;
		Reason_4_Visit = cats(Reason_Abdominal_Pain,'/',Reason_Back_Pain,'/',Reason_Chest_Pain,'/',Reason_Headache,'/',Reason_Musculoskeletal_Pain,'/',Reason_Dental_Pain);
	if (missing(Med_Oxycodone) and missing(Med_Oxycodone_ER) and missing(Med_Oxycontin) and missing(Med_Oxycodone_APAP) and missing(Med_APAP_Oxycodone)
		and missing(Med_Percocet) and missing(Med_ASA_Oxycodone) and missing(Med_Oxycodone_ASA) and missing(Med_Percodan)
		and missing(Drug_Oxycodone) and missing(Drug_APAP_Oxycodone) and missing(Drug_ASA_Oxycodone)) then delete;
	if Reason_4_Visit = "/////" then delete;
run;

/* Overall Tables of Main Variables - 1) Drug Type, 2) Med Name, 3) Reason for Visit */
ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med by Visit Reason - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan
			Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
	table Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan
			Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
	class All_Pain_Med Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan;
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
%let medvariable=Med_Oxycodone; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Oxycodone_ER; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Oxycontin; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Oxycodone_APAP; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_APAP_Oxycodone; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Percocet; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_ASA_Oxycodone; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Oxycodone_ASA; %put medvariable=medvariable; %demographicsfreq1;
%let medvariable=Med_Percodan; %put medvariable=medvariable; %demographicsfreq1;

proc means data=Dataset_Final;
	class All_Pain_Med Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan;
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
%let medvariable=Med_Oxycodone; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Oxycodone_ER; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Oxycontin; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Oxycodone_APAP; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_APAP_Oxycodone; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Percocet; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_ASA_Oxycodone; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Oxycodone_ASA; %put medvariable=medvariable; %logisticsfreq1;
%let medvariable=Med_Percodan; %put medvariable=medvariable; %logisticsfreq1;

ods pdf close;

proc sort data=Dataset_Final;
	by YEAR Reason_4_Visit;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med Name Only by Year - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_Med Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan;
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
%let medvariable=Med_Oxycodone; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Oxycodone_ER; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Oxycontin; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Oxycodone_APAP; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_APAP_Oxycodone; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Percocet; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_ASA_Oxycodone; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Oxycodone_ASA; %put medvariable=medvariable; %demographicsfreq2;
%let medvariable=Med_Percodan; %put medvariable=medvariable; %demographicsfreq2;

proc means data=Dataset_Final;
	class All_Pain_Med Med_Oxycodone Med_Oxycodone_ER Med_Oxycontin Med_Oxycodone_APAP Med_APAP_Oxycodone Med_Percocet Med_ASA_Oxycodone Med_Oxycodone_ASA Med_Percodan;
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
%let medvariable=Med_Oxycodone; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Oxycodone_ER; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Oxycontin; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Oxycodone_APAP; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_APAP_Oxycodone; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Percocet; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_ASA_Oxycodone; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Oxycodone_ASA; %put medvariable=medvariable; %logisticsfreq2;
%let medvariable=Med_Percodan; %put medvariable=medvariable; %logisticsfreq2;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type Only - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
%let medvariable=Drug_Oxycodone; %put medvariable=medvariable; %demographicsfreq3;
%let medvariable=Drug_APAP_Oxycodone; %put medvariable=medvariable; %demographicsfreq3;
%let medvariable=Drug_ASA_Oxycodone; %put medvariable=medvariable; %demographicsfreq3;

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
%let medvariable=Drug_Oxycodone; %put medvariable=medvariable; %logisticsfreq3;
%let medvariable=Drug_APAP_Oxycodone; %put medvariable=medvariable; %logisticsfreq3;
%let medvariable=Drug_ASA_Oxycodone; %put medvariable=medvariable; %logisticsfreq3;

ods pdf close;

proc sort data=Dataset_Final;
	by YEAR Reason_4_Visit;
run;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type Only by Year - trimmedVR &sysdate..pdf";

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
%let medvariable=Drug_Oxycodone; %put medvariable=medvariable; %demographicsfreq4;
%let medvariable=Drug_APAP_Oxycodone; %put medvariable=medvariable; %demographicsfreq4;
%let medvariable=Drug_ASA_Oxycodone; %put medvariable=medvariable; %demographicsfreq4;

proc means data=Dataset_Final;
	class All_Pain_DrugType Drug_Oxycodone Drug_APAP_Oxycodone Drug_ASA_Oxycodone;
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
%let medvariable=Drug_Oxycodone; %put medvariable=medvariable; %logisticsfreq4;
%let medvariable=Drug_APAP_Oxycodone; %put medvariable=medvariable; %logisticsfreq4;
%let medvariable=Drug_ASA_Oxycodone; %put medvariable=medvariable; %logisticsfreq4;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Pain Med by Med Information - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Med_Oxycodone * (
		Med_Oxy_COMSTAT1 Med_Oxy_COMSTAT2 Med_Oxy_COMSTAT3 Med_Oxy_COMSTAT4 
		Med_Oxy_GPMED1 Med_Oxy_GPMED2 Med_Oxy_GPMED3 Med_Oxy_GPMED4 
		Med_Oxy_PRESCR1 Med_Oxy_PRESCR2 Med_Oxy_PRESCR3 Med_Oxy_PRESCR4 Med_Oxy_PRESCR5 Med_Oxy_PRESCR6 );
	title "Oxycodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_APAP_Oxycodone  * (
		Med_APAP_COMSTAT1 Med_APAP_COMSTAT2 Med_APAP_COMSTAT3 Med_APAP_COMSTAT4 
		Med_APAP_GPMED1 Med_APAP_GPMED2 Med_APAP_GPMED3 Med_APAP_GPMED4 
		Med_APAP_PRESCR1 Med_APAP_PRESCR2 Med_APAP_PRESCR3 Med_APAP_PRESCR4 Med_APAP_PRESCR5 Med_APAP_PRESCR6 );
	title "APAP Oxycodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_ASA_Oxycodone  * (
		Med_ASA_COMSTAT1 Med_ASA_COMSTAT2 Med_ASA_COMSTAT3 Med_ASA_COMSTAT4 
		Med_ASA_GPMED1 Med_ASA_GPMED2 Med_ASA_GPMED3 Med_ASA_GPMED4 
		Med_ASA_PRESCR1 Med_ASA_PRESCR2 Med_ASA_PRESCR3 Med_ASA_PRESCR4 Med_ASA_PRESCR5 Med_ASA_PRESCR6 );
	title "ASA Oxycodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Oxycodone_ER  * (
		Med_OxyER_COMSTAT1 Med_OxyER_COMSTAT2 Med_OxyER_COMSTAT3 Med_OxyER_COMSTAT4 
		Med_OxyER_GPMED1 Med_OxyER_GPMED2 Med_OxyER_GPMED3 Med_OxyER_GPMED4 
		Med_OxyER_PRESCR1 Med_OxyER_PRESCR2 Med_OxyER_PRESCR3 Med_OxyER_PRESCR4 Med_OxyER_PRESCR5 Med_OxyER_PRESCR6 );
	title "Oxycodone ER by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Oxycontin  * (
		Med_Oxycontin_COMSTAT1 Med_Oxycontin_COMSTAT2 Med_Oxycontin_COMSTAT3 Med_Oxycontin_COMSTAT4 
		Med_Oxycontin_GPMED1 Med_Oxycontin_GPMED2 Med_Oxycontin_GPMED3 Med_Oxycontin_GPMED4 
		Med_Oxycontin_PRESCR1 Med_Oxycontin_PRESCR2 Med_Oxycontin_PRESCR3 Med_Oxycontin_PRESCR4 Med_Oxycontin_PRESCR5 Med_Oxycontin_PRESCR6  );
	title "Oxycontin by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Oxycodone_APAP  * (
		Med_OxyAPAP_COMSTAT1 Med_OxyAPAP_COMSTAT2 Med_OxyAPAP_COMSTAT3 Med_OxyAPAP_COMSTAT4 
		Med_OxyAPAP_GPMED1 Med_OxyAPAP_GPMED2 Med_OxyAPAP_GPMED3 Med_OxyAPAP_GPMED4 
		Med_OxyAPAP_PRESCR1 Med_OxyAPAP_PRESCR2 Med_OxyAPAP_PRESCR3 Med_OxyAPAP_PRESCR4 Med_OxyAPAP_PRESCR5 Med_OxyAPAP_PRESCR6  );
	title "Oxycodone APAP by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Percocet  * (
		Med_Percocet_COMSTAT1 Med_Percocet_COMSTAT2 Med_Percocet_COMSTAT3 Med_Percocet_COMSTAT4 
		Med_Percocet_GPMED1 Med_Percocet_GPMED2 Med_Percocet_GPMED3 Med_Percocet_GPMED4 
		Med_Percocet_PRESCR1 Med_Percocet_PRESCR2 Med_Percocet_PRESCR3 Med_Percocet_PRESCR4 Med_Percocet_PRESCR5 Med_Percocet_PRESCR6  );
	title "Percocet by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Oxycodone_ASA  * (
		Med_OxyASA_COMSTAT1 Med_OxyASA_COMSTAT2 Med_OxyASA_COMSTAT3 Med_OxyASA_COMSTAT4 
		Med_OxyASA_GPMED1 Med_OxyASA_GPMED2 Med_OxyASA_GPMED3 Med_OxyASA_GPMED4 
		Med_OxyASA_PRESCR1 Med_OxyASA_PRESCR2 Med_OxyASA_PRESCR3 Med_OxyASA_PRESCR4 Med_OxyASA_PRESCR5 Med_OxyASA_PRESCR6  );
	title "Oxycodone ASA by Med Information";
run;

proc freq data=Dataset_Final;
	table Med_Percodan  * (
		Med_Percodan_COMSTAT1 Med_Percodan_COMSTAT2 Med_Percodan_COMSTAT3 Med_Percodan_COMSTAT4 
		Med_Percodan_GPMED1 Med_Percodan_GPMED2 Med_Percodan_GPMED3 Med_Percodan_GPMED4 
		Med_Percodan_PRESCR1 Med_Percodan_PRESCR2 Med_Percodan_PRESCR3 Med_Percodan_PRESCR4 Med_Percodan_PRESCR5 Med_Percodan_PRESCR6 );
	title "Percodan by Med Information";
run;

ods pdf close;

ods pdf file="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\NHAMCS Tables v1 - Drug Type by Med Information - trimmedVR &sysdate..pdf";

proc freq data=Dataset_Final;
	table Drug_Oxycodone  * (
		Drug_Oxy_COMSTAT1  Drug_Oxy_COMSTAT2  Drug_Oxy_COMSTAT3  Drug_Oxy_COMSTAT4  
		Drug_Oxy_GPMED1  Drug_Oxy_GPMED2  Drug_Oxy_GPMED3  Drug_Oxy_GPMED4  
		Drug_Oxy_PRESCR1  Drug_Oxy_PRESCR2  Drug_Oxy_PRESCR3  Drug_Oxy_PRESCR4  Drug_Oxy_PRESCR5  Drug_Oxy_PRESCR6 );
	title "Oxycodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Drug_APAP_Oxycodone   * (
		Drug_APAP_COMSTAT1  Drug_APAP_COMSTAT2  Drug_APAP_COMSTAT3  Drug_APAP_COMSTAT4  
		Drug_APAP_GPMED1  Drug_APAP_GPMED2  Drug_APAP_GPMED3  Drug_APAP_GPMED4  
		Drug_APAP_PRESCR1  Drug_APAP_PRESCR2  Drug_APAP_PRESCR3  Drug_APAP_PRESCR4  Drug_APAP_PRESCR5  Drug_APAP_PRESCR6  );
	title "APAP Oxycodone by Med Information";
run;

proc freq data=Dataset_Final;
	table Drug_ASA_Oxycodone   * (
		Drug_ASA_COMSTAT1  Drug_ASA_COMSTAT2  Drug_ASA_COMSTAT3  Drug_ASA_COMSTAT4  
		Drug_ASA_GPMED1  Drug_ASA_GPMED2  Drug_ASA_GPMED3  Drug_ASA_GPMED4  
		Drug_ASA_PRESCR1  Drug_ASA_PRESCR2  Drug_ASA_PRESCR3  Drug_ASA_PRESCR4  Drug_ASA_PRESCR5  Drug_ASA_PRESCR6   );
	title "ASA Oxycodone by Med Information";
run;

ods pdf close;


PROC EXPORT
  DATA=Dataset_Final
  DBMS=xlsx 
  OUTFILE="H:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets\NHAMCS Trim Dataset - trimmedVR &sysdate..xlsx" 
  REPLACE;
  SHEET='Trimmed VR Dataset';
RUN;
