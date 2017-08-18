#!/bin/bash
cd ~/bigdata/Nobtusifolia/Annotation/Results/IPROUT

grep -v "/protein-matches" NIOBT_r1.0.masked.aa.1.xml > first.xml
cat NIOBT_r1.0.masked.aa.2.xml NIOBT_r1.0.masked.aa.3.xml NIOBT_r1.0.masked.aa.4.xml NIOBT_r1.0.masked.aa.5.xml | grep -v "protein-matches" |grep -v "xml " >middle.xml
grep -v "xml " NIOBT_r1.0.masked.aa.6.xml | grep -v "<protein-matches" > last.xml

#combine everything
cat first.xml middle.xml last.xml > NIOBT_r1.0.aa.xml 
#cleanup
rm first.xml middle.xml last.xml

