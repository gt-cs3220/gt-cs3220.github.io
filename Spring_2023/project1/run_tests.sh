#!/bin/bash


part=$1

echo You have chosen to run $part tests

case $part in 
  part1) 
    rm part1_tests.log
    ;;
  part2) 
    rm part2_tests.log
    ;;
  part3) 
    rm part3_tests.log
    ;;
esac

case $part in
	part1)
		echo RUNNING PART1$'\n'
		for filename in $PWD/test/part1/*.mem;do
			echo $'\n'TESTING: $filename >> part1_tests.log
			IDMEMINITFILE=$filename make tests>> part1_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part1_tests.log>part1_results.log
		echo "Total number of tests:"
		grep -i testing part1_tests.log | wc -l
		echo "Number of passed tests:"
		grep -i passed part1_tests.log | wc -l
		echo "Number of failed tests:"
		grep -i failed part1_tests.log | wc -l
	;;
	part2)
		echo RUNNING PART2$'\n'
		for filename in $PWD/test/part2/*.mem;do
			echo $'\n'TESTING: $filename >> part2_tests.log
			IDMEMINITFILE=$filename make tests>> part2_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part2_tests.log>part2_results.log
		echo "Total number of tests:"
		grep -i testing part2_tests.log | wc -l
		echo "Number of passed tests:"
		grep -i passed part2_tests.log | wc -l
		echo "Number of failed tests:"
		grep -i failed part2_tests.log | wc -l
	;;
	part3)
		echo RUNNING PART3$'\n'
		for filename in $PWD/test/part3/*.mem;do
			echo $'\n'TESTING: $filename >> part3_tests.log
			IDMEMINITFILE=$filename make tests>> part3_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part3_tests.log>part3_results.log
		echo "Total number of tests:"
		grep -i testing part3_tests.log | wc -l
		echo "Number of passed tests:"
		grep -i passed part3_tests.log | wc -l
		echo "Number of failed tests:"
		grep -i failed part3_tests.log | wc -l
	;;
	all)
		echo RUNNING ALL$'\n'
		for filename in $PWD/test/part*/*.vmh;do
			echo $'\n'TESTING: $filename >> all_tests.log
			IDMEMINITFILE=$filename make tests>> all_tests.log
		done
		grep -E 'TESTING|Failed|Passed' all_tests.log>all_results.log
		echo "Total number of tests:"
		grep -i testing part3_tests.log | wc -l
		echo "Number of passed tests:"
		grep -i passed part3_tests.log | wc -l
		echo "Number of failed tests:"
		grep -i failed part3_tests.log | wc -l
	;;
	*)
		echo INVALID PART. Use part1, part2, part2 or all as command line argument
	;;
esac
