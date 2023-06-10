

#!/bin/bash

# Error message function
print_error() {
    local message=$1

    # Check if running in an interactive terminal
    if [ -t 1 ]; then
        echo "\033[0;31m"
        echo "**************************************************************"
        echo "*                                                            *"
        echo "*      	   !!! ERROR! Silly pisciner noob !!!		     *"
        echo "*                                                            *"
        echo "	$message"
        echo "*                                                            *"
        echo "*                                                            *"
        echo "**************************************************************"
        echo "\033[0;31m"
    else
        echo "ERROR: $message"
    fi

    exit 1
}

# Function to run the program with the provided arguments
# Function to check behaviour and display the result
check_behaviour() {
    local output=$1
    local condition=$2

    if [ "$output" = "" ] && [ "$condition" = true ]; then
        echo -e "\033[93mCheck Behaviour \033[0m"
    else
        echo -e "\033[92m\xE2\x9C\x94	Test Passed \033[0m"
    fi
}

# Function to run a test case and display the result
run_test_case() {
    local width=$1
    local height=$2
    local myprogram_arg=$3

    # Execute your program and capture the output
    myprogram_output=$(./r00c "$width" "$height" "$myprogram_arg")

    # Execute the user program and capture the output (redirected to /dev/null)
    userprogram_output=$(./rush00 "$width" "$height" 2>/dev/null)

    # Compare the outputs
    if [ "$myprogram_output" = "$userprogram_output" ]; then
        if [[ $myprogram_arg =~ ^[0-9]+\.[0-9]+$ ]]; then
            check_behaviour "$myprogram_output" true
        else
            echo "\033[92m\xE2\x9C\x94	Test Passed \033[0m"
        fi
    else
        echo "\033[91m\xE2\x9C\x94	Test Failed \033[0m"
    fi
}

not_enough_args() {
    local arg=$1

    # Execute your program and capture the output
    set +e
    myprogram_output=$(./r00c "$arg")
    myprogram_exit_code=$?
    set -e

    # Execute the user program and capture the output
    set +e
    userprogram_output=$(./rush00 "$arg")
    userprogram_exit_code=$?
    set -e

    # Compare the outputs
    if [ "$myprogram_output" = "$userprogram_output" ]; then
        echo "\033[92m\xE2\x9C\x94 	Test Passed \033[0m"
    else
        echo "\033[91m\xE2\x9D\x8C 	Test Failed \033[0m"
    fi

    # Check the exit codes and print "Test Failed" if the user program has a non-zero exit code
    if [ $userprogram_exit_code -ne 0 ]; then
        echo "\033[91m	COULD BE A FAIL \033[0m"
		echo "\033[91m	Output OK but program exits with -1 \033[0m"
    fi
}

too_many_args() {
    local arg=$1
	local arg2=$2
	local arg3=$3
	local arg4=$4


    # Execute your program and capture the output
    myprogram_output=$(./r00c "$arg" "$arg2" "$arg3" "$arg4")

    # Execute the user program and capture the output
    userprogram_output=$(./rush00 "$arg" "$arg2" "$arg3")

    # Compare the outputs
    if [ "$myprogram_output" = "$userprogram_output" ]; then
        echo "\033[92m\xE2\x9C\x94 Test Passed \033[0m"
    else
        echo "\033[91m\xE2\x9D\x8C Test Failed \033[0m"
    fi
}

# Pre-made test cases
premade_tests() {
    # Test case 1: Normal positive numbers
    echo "Test Case 1: Normal positive numbers (3, 5)"
    run_test_case 3 5 "$1"
    echo

    # Test case 2: Both input numbers negative
    echo "Test Case 2: Both input numbers negative (-3, -5)"
    run_test_case -3 -5 "$1"
    echo

    # Test case 3: Mix of negative and positive numbers
    echo "Test Case 3: Mix of negative and positive numbers (2, -4)"
    run_test_case 2 -4 "$1"
    echo

    # Test case 4: Larger positive values
    # Test case 7: Positive numbers (0, 0)
	echo "Test Case 7: Positive numbers (0, 0)"
	run_test_case 0 0 "$1"
	echo

	# Test case 8: Positive numbers (1, 1)
	echo "Test Case 8: Positive numbers (1, 1)"
	run_test_case 1 1 "$1"
	echo

	# Test case 9: Positive numbers (10, 5)
	echo "Test Case 9: Positive numbers (10, 5)"
	run_test_case 10 5 "$1"
	echo

	# Test case 10: Positive numbers (100, 100)
	echo "Test Case 10: Positive numbers (100, 100)"
	run_test_case 100 100 "$1"
	echo

	# Test case 11: Positive numbers (500, 200)
	echo "Test Case 11: Positive numbers (500, 200)"
	run_test_case 500 200 "$1"
	echo

	# Test case 12: Positive numbers (1000, 1000)
	echo "Test Case 12: Positive numbers (1000, 1000)"
	run_test_case 1000 1000 "$1"
	echo

	# Test case 13: Positive numbers (123, 456)
	echo "Test Case 13: Positive numbers (123, 456)"
	run_test_case 123 456 "$1"
	echo

	# Test case 14: Positive numbers (321, 789)
	echo "Test Case 14: Positive numbers (321, 789)"
	run_test_case 321 789 "$1"
	echo

	# Test case 15: Positive numbers (999, 777)
	echo "Test Case 15: Positive numbers (999, 777)"
	run_test_case 999 777 "$1"
	echo

	# Test case 16: Positive numbers (100, 500)
	echo "Test Case 16: Positive numbers (100, 500)"
	run_test_case 100 500 "$1"
	echo

	# Test case 17: Positive numbers (777, 999)
	echo "Test Case 17: Positive numbers (777, 999)"
	run_test_case 777 999 "$1"
	echo

	# Test case 18: Positive numbers (888, 222)
	echo "Test Case 18: Positive numbers (888, 222)"
	run_test_case 888 222 "$1"
	echo

	# Test case 19: Positive numbers (543, 210)
	echo "Test Case 19: Positive numbers (543, 210)"
	run_test_case 543 210 "$1"
	echo

	# Test case 20: Positive numbers (987, 654)
	echo "Test Case 20: Positive numbers (987, 654)"
	run_test_case 987 654 "$1"
	echo

	# Test case 21: Positive numbers (777, 888)
	echo "Test Case 21: Positive numbers (777, 888)"
	run_test_case 777 888 "$1"
	echo

	# Test case 22: Positive numbers (111, 222)
	echo "Test Case 22: Positive numbers (111, 222)"
	run_test_case 111 222 "$1"
	echo

	# Test case 23: Positive numbers (999, 999)
	echo "Test Case 23: Positive numbers (999, 999)"
	run_test_case 999 999 "$1"
	echo

	# Test case 24: Positive numbers (50, 100)
	echo "Test Case 24: Positive numbers (50, 100)"
	run_test_case 50 100 "$1"
	echo

	echo "Test Case 26: Incorrect input - width as letter ('a', 5)"
	run_test_case 'a' 5 "$1"
	echo

	echo "Test Case 27: Incorrect input - height as letter (3, 'b')"
	run_test_case 3 'b' "$1"
	echo

	echo "Test Case 28: Incorrect input - width and height as letters ('x', 'y')"
	run_test_case 'x' 'y' "$1"
	echo

	echo "Test Case 29: Incorrect input - width as letter, height as number ('z', 10)"
	run_test_case 'z' 10 "$1"
	echo

	echo "Test Case 30: Incorrect input - width as number, height as letter (15, 'w')"
	run_test_case 15 'w' "$1"
	echo

	echo "Test Case 31: Incorrect input - width and height as combination of letter and number ('a1', 'b2')"
	run_test_case 'a1' 'b2' "$1"
	echo

	echo "Test Case 32: Incorrect input - not enough arguments"
	not_enough_args 10
	echo

	echo "Test Case 33: Incorrect input - Too many arguments"
	too_many_args 10 12 3 4
	echo
}

# Check the number of input arguments
if [ "$#" -eq 1 ]; then
    # Run the automated test
    premade_tests "$1"
elif [ "$#" -eq 3 ]; then
    # Check if the user executable name is correct
    if [ ! -x "./rush00" ]; then
    error_message="The 'rush00' executable does not exist.\n"
	error_message+="	Please compile your code correctly first.\n"
    error_message+="	Here's the command to do it.\n"
	error_message+="	Replace the rush0X with your own C filename:\n\n"
    error_message+="->	gcc main.c rush0X.c ft_putchar.c -o rush00"
    print_error "$error_message"
    fi

    # Run the manual test
run_manual_test "$1" "$2" "$3"
else
    error_message="Invalid number of arguments.\n"
    error_message+="	Automated testing:\n"
	error_message+="	<checker_executable> <myprogram_arg>\n\n"
    error_message+="	Manual testing:\n"
	error_message+="	<checker_executable> <width> <height> <myprogram_arg>"
    print_error "$error_message"
fi



#OLD STUFF

