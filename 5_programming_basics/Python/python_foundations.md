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

### Lists and Loops

A list is a collection of items that can be of different types. You can create a list using square brackets `[]` and separate the items with commas. You can access the items in a list using their index, which starts at 0.

```python
# List of fruits
fruits = ["apple", "banana", "cherry", "date"]

# Loop through the list and print each fruit
for fruit in fruits:
    print(fruit)
```

```python
# expenses

expenses = [10.50, 8, 5, 8, 11]

sum = 0 

for x in expense:
    sum += x 

print("Your spent $", sum)
```

```python
# Load calculator: for loops with the range() function
# Get details of the loan

money_owed = float(input("How much money do you owe, in pounds?\n"))
apr = float(input("What is the annual percentage rate of the loan?\n"))
payment = float(input("How much will you pay off each month in pounds?\n"))
months = int(input("How many months do you want to see the results for?\n"))

monthly_rate=apr/100/12

for i in range(months):
    #Calculate interest to pay
    interest_paid = money_owed*monthly_rate

    # Add in interest
    money_owed = money_owed + interest_paid

    if (money_owed - payment < 0):
        print("The last payment is", money_owed)
        print("You paid off the loan in", i+1, "months")
        break

    # Make payment
    money_owed = money_owed - payment

    print("Paid", payment, "of which", interest_paid, "was interest", end=" ")
    print("Now I owe", money_owed)
```