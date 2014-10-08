#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "usage: $(basename $0) test.sml"
	exit 1
fi

# test execution
DIR=`dirname $1`
TEST=`basename $1`
OUT="a.out"
cd $DIR
echo -n | sml $TEST > $OUT

# test result
doCheck="grep 'val test' $OUT | grep 'false'"
nfails=$(eval $doCheck | wc -l)

if [[ "$nfails" -eq "0" ]]; then
	echo "F*cking genius. All OK."
else
	output=$(eval $doCheck)
	echo -e "$output\n"
	echo "$nfails tests fail."
fi

rm $OUT

