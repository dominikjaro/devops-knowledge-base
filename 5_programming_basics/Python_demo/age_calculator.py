age = int(input("How old are you?\n"))

decades = age // 10
year = age % 10

print("You are " + str(decades) + " decades and " + str(year) + " years old.")