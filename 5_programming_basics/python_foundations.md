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