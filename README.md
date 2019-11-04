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

To test the TSPJ heuristic procedures and exact solution for small size problem, we need sets of test problems. Due to the novelty of this problem, test sets are not yet available in the literature. Therefore, we constructed different sets of problem by using the TSPLIB data for \tsp (gr17, gr21, gr24, fri26, bays29, gr48, eli51, berlin52, eli76, and eli101), and adding the job-time as a random number between 50-80 percent units of the \tsp-tour. The formulations presented above have all been coded in the GAMS language, and  solutions have been obtained using the CPLEX MIP solver. All runs were performed on a Dell precision tower 7910 with two Intel(R) Xenon(R) CPUs of 2.30 GHz, and 32 GB physical memory(RAM). The aim of using these sets is to compare the results of heuristics procedures with the GAMS solution and approve the accuracy of the heuristics.  



In addition, to compare the heuristics performance with different size of the  problems, this paper defines 300 random data sets in three categories: small, medium, and large scale. The small, medium, and large sets contain the random number of the nodes between 40 to 50 , 400 to 500, and 1000 to 1200  respectively. Also, the distances between the nodes set to range between 10 to 50, 50 to 200, and 200 to 500 units respectively. The job-times set by the 50 to 80 percent units of the \tsp-tour for each set. The program was written in Python 3.7 \cite{van1995python}.


### How to run the GAMS

Copy the GAMS file(TSPJ.gms) and the excel data file(TSPJ.xlsx) to the gams directory. 
Based on your computer change the setting. 

OPTION THREADS=48;     
OPTION OPTCR=0.05;

Then run it.

Note: If your computer is 32 bit, or any error with reading excel file in GAMS, make a new excel file based on the excel version in your computer with the same name of the sheets and the file, Then copy the data to it, and run the GAMS again.


