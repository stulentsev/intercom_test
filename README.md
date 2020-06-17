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
        
   
# Tests

```
bundle install
bundle exec rspec spec
```   

# Notes about the implementation

The original problem description says "program should read list of customers [from a file] and output id and name [to stdout]". If we're building a CLI tool, this is not how a good unixy tool should operate. So additionally I implemented the ability to read customer data from the standard input (to mirror printing results to stdout) and the ability to save the results in a file. 

The program could have been a bit simpler if we dropped dealing with files altogether: read from stdin, write to stdout.
 
 Interface of formatters/writers uses `<<` instead of, say, `puts` to enable us passing arrays as mock writers / data capture objects in tests. Also this reminds me of C++'s `iostream`.
 
 

# TODO

* gemify the program to simplify the installation