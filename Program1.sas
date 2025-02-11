%let path=/home/u64121953/ ;
filename csv url 'https://support.sas.com/documentation/onlinedoc/viya/exampledatasets/cars.csv';
proc import datafile=csv dbms=csv out=cars replace;
run;


proc print data=cars(obs=5);
run;


proc contents data=cars varnum;
run;

proc datasets lib=work;
quit;

proc contents data=work.cars varnum;
run;

proc freq data=work.cars order=freq;
run;

proc means data=work.cars;
run;

proc freq data=work.cars nlevels;
run;

/* review data structure and contents */
proc contents data=data varnum;
run;

/* joining datasets with proc sql */
proc sql ;
	create table datatableName
		(drop=unnecessary columns) as
		select *
		from data as maindata
  			left join diffdata as diff on maindata.samecol=diff.samecol
			left differentdata as different on diff.matchcol=different.matchcol
			left join thirddata as third on maindata.matching=third.matching
		; 
quit;


/* view table table column informtion */
proc contents data=datatableName varnum ;
run;

/* Run basic statistics of N N Miss Mean Min Max */
proc means data=datatableName n nmiss mean min max ;
run ;

/* save the final dataset as csv */
proc export data=datatableName outfile='/directory/filename.csv' dbms=csv replace ;
run ;



