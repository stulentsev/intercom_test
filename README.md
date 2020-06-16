# Overview

This program reads a list of customers from a file and outputs those customers who are within N (defalt = 100) kilometers from the HQ.

# Installation

1. Check out the code
    
       git clone git@github.com:stulentsev/intercom_test.git

2. Install needed gems

        cd intercom_test
        bundle install

3. Run the program

        ./main.rb --input data/customers.txt --output output.txt
        
    * `--input` parameter is optional. If missing, the program will read STDIN.
    * `--output` parameter is optional. If missing, the program will print results to STDOUT.
    
          cat data/customers.txt | ./main.rb > output.txt
        
   
 

# TODO

* gemify the program to simplify the installation