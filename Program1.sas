%let path=/home/u64121953/ ;
filename csv url 'https://support.sas.com/documentation/onlinedoc/viya/exampledatasets/cars.csv';
proc import datafile=csv dbms=csv out=cars replace;
run;


proc print data=cars(obs=5);
run;
