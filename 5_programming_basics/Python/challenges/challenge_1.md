## Challenge 1: Organic Worth-It Checker

**Goal:** practice `input()`, `if/elif/else`, and `and/or/not`.

**Requirements:**

Create a list of 5 fruits/veggies that are "worth buying organic" (e.g. strawberries, spinach, apples, kale, grapes).
Ask the user to type in a product name using `input()`.
Check if their product is in your "worth it" list.
Print a different message depending on the result:

If it's in the list → print something like `"Yes, buy organic {product}!"`
If it's not in the list → print something like `"No need — conventional {product} is fine."`


Bonus (optional): Also ask the user for their budget (a number). If the product is "worth it" and their budget is less than £3, print an extra warning like `"Worth it, but check the price — organic tends to cost more."` (This is where you'll use `and`.)

Think about: how do you check if something is "in" a list? (Hint: there's a very short Python keyword for this — look at the standard library docs or think about what you'd naturally ask in English: "is X in this list?")