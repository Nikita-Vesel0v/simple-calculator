#!/usr/bin/env bash
# Function to read user input
read_input(){
    echo "Enter an arithmetic operation: "
    read -r a operator b
}

# Validation of input
validate_input() {
    local re_num='^[+-]?[0-9]*[.,]?[0-9]+$'
    local re_operator='^[-+*/^]$'

    if [[ $a =~ $re_num ]] && [[ $b =~ $re_num ]] && [[ $operator =~ $re_operator ]]; then
        return 0
    else
        return 1
    fi
}

# Function to perform an arithmetic operation
perform_calculation() {
    # Replacing commas with dots for correct floating point calculations
    local a_clean=${a//,/.}
    local b_clean=${b//,/.}

    # Performing an arithmetic operation using bc
    local result
    result=$(echo "scale=2; $a_clean $operator $b_clean" | bc -l)
    printf "%s\n" "$result"
}

# Main function
main() {
    read_input
    if validate_input; then
        perform_calculation
    else
        echo "Operation check failed!"
    fi
}

# Run main function
main
