#!/bin/bash


part=$1

echo You have chosen to run $part tests

case $part in 
  part1) 
    rm -f part1_tests.log
    ;;
  part2) 
    rm -f part2_tests.log
    ;;
  part3) 
    rm -f part3_tests.log
    ;;
  part4)
    rm -f part4_tests.log
	;;
  exam)
    rm -f exam_tests.log
	;;
  all)
	rm -f all_tests.log
	;;
esac

case $part in
	part1)
		echo RUNNING PART1$'\n'
		for filename in $PWD/tests/part1/*.mem;do
			echo $'\n'TESTING: $filename >> part1_tests.log
			IDMEMINITFILE=$filename make tests>> part1_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part1_tests.log>part1_results.log
		echo "Total number of tests:"
		grep -i testing part1_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed part1_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed part1_tests.log |wc -l
	;;
	part2)
		echo RUNNING PART2$'\n'
		for filename in $PWD/tests/part2/*.mem;do
			echo $'\n'TESTING: $filename >> part2_tests.log
			IDMEMINITFILE=$filename make tests>> part2_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part2_tests.log>part2_results.log
		echo "Total number of tests:"
		grep -i testing part2_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed part2_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed part2_tests.log |wc -l
	;;
	part3)
		echo RUNNING PART3$'\n'
		for filename in $PWD/tests/part3/*.mem;do
			echo $'\n'TESTING: $filename >> part3_tests.log
			IDMEMINITFILE=$filename make tests>> part3_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part3_tests.log>part3_results.log
		echo "Total number of tests:"
		grep -i testing part3_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed part3_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed part3_tests.log |wc -l
	;;
	part4)
		echo RUNNING PART4$'\n'
		for filename in $PWD/tests/part4/*.mem;do
			echo $'\n'TESTING: $filename >> part4_tests.log
			IDMEMINITFILE=$filename make tests>> part4_tests.log
		done
		grep -E 'TESTING|Failed|Passed' part4_tests.log>part4_results.log
		echo "Total number of tests:"
		grep -i testing part4_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed part4_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed part4_tests.log |wc -l
	;;
	exam)
		echo RUNNING EXAM$'\n'
		for filename in $PWD/tests/exam/*.mem;do
			echo $'\n'TESTING: $filename >> exam_tests.log
			IDMEMINITFILE=$filename make tests>> exam_tests.log
		done
		grep -E 'TESTING|Failed|Passed' exam_tests.log>exam_results.log
		echo "Total number of tests:"
		grep -i testing exam_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed exam_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed exam_tests.log |wc -l
	;;
	all)
		echo RUNNING ALL$'\n'
		for filename in $PWD/tests/part*/*.mem;do
			echo $'\n'TESTING: $filename >> all_tests.log
			IDMEMINITFILE=$filename make tests>> all_tests.log
		done
		grep -E 'TESTING|Failed|Passed' all_tests.log>all_results.log
		echo "Total number of tests:"
		grep -i testing all_tests.log |wc -l
		echo "Number of passed tests:"
		grep -i passed all_tests.log |wc -l
		echo "Number of failed tests:"
		grep -i failed all_tests.log |wc -l
	;;
	*)
		echo INVALID PART. Use part1, part2, part3, part4, or all as command line argument
	;;
esac
