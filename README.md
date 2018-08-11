# file2env   
Exports ENV variables from vars-file.txt (default) or command line (overrides defaults)   
  
### Run: ./file2env.sh vars2.txt  
  
### vars-file.txt format:  
.....  
#This is comment line  
VAR1=varstring1  
VAR2=varstring2  
#Next line is to *unset* VAR  
-n VAR3=  
.....  

