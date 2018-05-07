# MLP-Project
MLP Article Assignment

This repository contains files which are for replicating the final assignment for Machine Learning for Policy at Heinz College CMU. 

**Originial files and Data Preparation:**
Two files downloaded from http://www.vo.elte.hu/bitcoin/zipdescription.htm "txout.txt" and "txtime.txt" are not provided here. 
The two other files which are used to collect exchange rate information and Transaction costs in dollars are provided here. They are Price.csv and Transaction.csv

**Data  Files read in for replication:**
working.csv and MLP1.csv are read in as described below.

**R file (Project.R):**
Reads in working.csv, does some data preprocessing including creating lag variables and log transformations. Outputs MLP1.csv
The code also replicates Figure 2 and 3 in the article. 

**Python file (Bitcoin.ipynb):**
Reads in MLP1.csv and has the code to replicate all calculations presented within text or reported in tables. 
