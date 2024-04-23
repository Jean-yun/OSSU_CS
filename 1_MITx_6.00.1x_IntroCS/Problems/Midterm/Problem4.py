"""
Write a Python function that returns the sublist of strings in aList
that contain fewer than 4 characters.
For example, if aList = ["apple", "cat", "dog", "banana"],
your function should return: ["cat", "dog"]
This function takes in a list of strings and returns a list of strings.
Your function should not modify aList.
"""
def lessthan4(aList):
    result = []
    for i in aList:
        if len(i) < 4:
            result.append(i)
    return result

print(lessthan4(["apple", "cat", "dog", "banana", "pin"]))