libname NHAMCS "D:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets";
%let nhamcs_year = ED200; %put nhamcs_year = nhamcs_year;

DATA &nhamcs_year;
INFILE 'D:\[Client] Maimonides Health\[2021.04] NHAMCS Study (Motov)\Datasets\&nhamcs_year.txt' MISSOVER LRECL=9999;

RUN;


RUN;


DATA &nhamcs_year; SET &nhamcs_year;

RUN;

data NHAMCS.&nhamcs_year;
	set &nhamcs_year;
run;
