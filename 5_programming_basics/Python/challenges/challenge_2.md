## Challenge 2: Grocery Basket Advisor

**Goal:** practice loops, lists, and the random module together.

**Requirements:**

Create your "worth it organic" list again (reuse Challenge 1's list, or a new one).
Ask the user **how many items** they want to check (an integer).
Use a loop that runs that many times. Each time through the loop:

Ask the user to input one product name
Check if it's in the "worth it" list
Keep a running count of how many were "worth it" vs not

After the loop finishes, print a summary, e.g.:

```python
   You checked 4 items.
   2 are worth buying organic.
   2 are not.
```

Use the `random` module to end the program with a random tip, chosen from a list of 3 tips you write yourself (e.g. "Tip: wash all produce even if organic!"). Look at how the Rock/Paper/Scissors example used `random.choice()` — same idea here.

Think about: which loop fits better here — looping over a list directly (`for fruit in fruits`), or looping a specific number of times (`for i in range(...)`)? Which one did the loan calculator use, and why does that match this problem better than looping over a list?