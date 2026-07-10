### Input and Output

* `input()` function: This function is used to take input from the user. It reads a line from the input (usually from the user), converts it into a string, and returns it.
* `output()` function: This function is used to display output to the user. In Python, the `print()` function is commonly used for this purpose. It can take multiple arguments and will convert them to strings and display them on the console.

Example:

```python
# Age Calculator
age = int(input("How old are you?\n"))

decades = age // 10
year = age % 10

print("You are " + str(decades) + " decades and " + str(year) + " years old.")
```

### Conditional Operators

For an `and` statement to be true, both conditions must be true. For an `or` statement to be true, at least one of the conditions must be true. The `not` operator negates the condition.

Example:

```python
# Weather app

temperature = 75
forecast = "rainy"

if temperature < 80 and forecast != "rainy":
    print("Go outside!")
else:
    print("Stay inside!")
```

### Modules

It is like a toolbox that contains a set of functions and variables that can be used in your program. You can import a module using the `import` statement.
For the Python standard library see: https://docs.python.org/3/library/

```python
# Rock, Paper, Scissors game

import random

computer_choice = random.choice(["rock", "paper", "scissor"])
user_choice = input("Do you want rock, paper or scissor? ")

print("\nComputer chose: " + computer_choice)

if computer_choice == user_choice:
    print("TIE")
elif user_choice == "rock" and computer_choice == "scissor":
    
    print("You WIN")
elif user_choice == "paper" and computer_choice == "rock":
    print("You WIN")
elif user_choice == "scissor" and computer_choice == "paper":
    print("You WIN")
else:
    print("You lose, computer wins")
```