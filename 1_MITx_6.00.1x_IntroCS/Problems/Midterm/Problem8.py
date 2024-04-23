"""
Write a recursive Python function, given a non-negative integer N, to calculate and return the sum of its digits.
Hint: Mod (%) by 10 gives you the rightmost digit (126 % 10 is 6), while doing integer division by 10 removes the rightmost digit (126 // 10 is 12).

This function has to be recursive; you may not use loops!
This function takes in one integer and returns one integer.
"""

def digitsum(n):
    sum = 0
    if n == 0:
        return sum
    else:
        sum = (n%10) + digitsum(n//10)
    return sum

print(digitsum(12))


