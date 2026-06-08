#!/bin/bash

# Clear the screen for a clean output
clear
echo "=================================================="
echo "          BASH VARIABLE SCOPE DEMO                "
echo "=================================================="

# --------------------------------------------------
# 1. Demonstration of REGULAR (Global) Variables
# --------------------------------------------------
echo -e "\n🔹 1. Testing Regular Variables (No 'local' keyword)"

# Define a global variable
hero="Batman"
echo "Initial global state: hero = '$hero'"

leaky_function() {
    # This modifies the global variable because 'local' isn't used!
    hero="Superman"
    echo "  [Inside leaky_function]: hero changed to '$hero'"
}

# Run the function
leaky_function

# Check if the variable leaked out
echo "Post-function state : hero = '$hero'" 
echo "❌ CRITICAL: The function leaked and rewrote the global variable!"

echo "--------------------------------------------------"

# --------------------------------------------------
# 2. Demonstration of LOCAL Variables
# --------------------------------------------------
echo -e "\n🔹 2. Testing Local Variables (With 'local' keyword)"

# Define another global variable
villain="Joker"
echo "Initial global state: villain = '$villain'"

safe_function() {
    # 'local' creates a brand new variable confined ONLY to this function
    local villain="Lex Luthor"
    echo "  [Inside safe_function] : villain is '$villain'"
}

# Run the function
safe_function

# Check if the variable leaked out
echo "Post-function state : villain = '$villain'"
echo "✅ SUCCESS: The global variable stayed safe and untouched!"
echo "==================================================" 
