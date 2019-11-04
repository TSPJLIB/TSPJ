### Traveling Salesman Problem with Job time (TSPJ) and the variations 

date: "Nov, 2019"

### Traveling Salesman Problem with Job time (TSPJ) 

Abstract:

This  paper explores a problem related to the Traveling Salesman Problem where the traveler must move through n locations, visiting each location once to initiate one of n jobs, and return to the first location. After initiation of the job at each location, the traveler moves to the next location immediately, and the job continues autonomously. This is representative of many practical scenarios including some related to  highly automated manufacturing where an operator visits machines capable of unattended operation to check and start a job on the machine and returns to the home station after the given set of jobs has been started. The goal is to minimize the time of completion of the last job, i.e. makespan. This problem is  a sub-class of unrelated parallel machine scheduling with travel distances representing the sequence-dependent setup between the machines. We refer to this problem as the traveling salesman problem with job-times (TSPJ) and present a mathematical formulation for it. Computational experience in solving the TSPJ using both commercial solvers and heuristics is reported.



### TSPJ Variance Models
This directory contains the GAMS model for different variances of TSPJ.

1.  TSPJ with Multiple travelers (TSPJ-M)

2. TSPJ with Resource constraint (TSPJ-R)

3. TSPJ with Time Windows (TSPJ-W)

4. TSPJ with Sequence Dependent Jobs (TSPJ-SD)

5. TSPJ with Multiple depots (TSPJ-MD)

6. TSPJ with Setup Time (TSPJ-ST)

7. TSPJ Balanced completion time (TSPJ-B)



### TSPJ Library and computational result

The original data extract from "https://wwwproxy.iwr.uni-heidelberg.de/groups/comopt/software/TSPLIB95/"
for the Job time, we assume the Job time is a number between 50% -80% of the TSP tour length, and generate the Job time by randbeteen function in excel. 

Each experiment named as "TSPJ"+ number of the nodes. For example TSPJ_20_nodes, containes 20 nodes of the original data plus the Job time.

Each experiment contains the GAMS code and the GAMS outout. Also, it has the excel file of the GAMS results(TSPJ_OUTPUT.xlsx).




### How to run the GAMS

Copy the GAMS file(TSPJ.gms) and the excel data file(TSPJ.xlsx) to the gams directory. 
Based on your computer change the setting. 

OPTION THREADS=48;     
OPTION OPTCR=0.05;

Then run it.

Note: If your computer is 32 bit, or any error with reading excel file in GAMS, make a new excel file based on the excel version in your computer with the same name of the sheets and the file, Then copy the data to it, and run the GAMS again.


