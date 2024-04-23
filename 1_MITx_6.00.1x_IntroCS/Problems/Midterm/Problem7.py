"""Problem 5
Write a Python function that returns a list of keys in aDict with the value target. 
The list of keys you return should be sorted in increasing order.
The keys and values in aDict are both integers. 
(If aDict does not contain the value target, you should return an empty list.)

This function takes in a dictionary and an integer and returns a list.
This is trick problem you should figure out how it is!
"""

def keysWithValue(aDict, n):
    key_list = []
    for i in aDict.keys():
            if aDict[i] == n:
                key_list.append(i)
    return sorted(key_list)


aDict = {5 : 1, 3: 90, 4: 90, 12: 90, 22: 90, 21: 100}
print(keysWithValue(aDict, 90))

