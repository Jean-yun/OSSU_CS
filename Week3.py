# #tuples

# def get_data(aTuple):
#     nums = ()
#     words = ()
#     for t in aTuple:
#         nums = nums + (t[0], )
#         if t[1] not in words:
#             words = words + (t[1], )
#     min_nums = min(nums)
#     max_nums = max(nums)
#     unique_words = len(words)
#     return (min_nums, max_nums, unique_words)


# (small, large, words) = get_data((((1,'mine'), (3, 'yours'), (5, 'ours'), (8, 'mine'))))

# print(small)
# print(large)
# # print(words)

# x = (1, 2, (3, 'John', 4), 'Hi')
# x[0:1]

# #Ex. Odd Tuples
# def oddTuples(aTup):
#     res = ()
#     for i in range(0,len(aTup),2):
#         res = res + (aTup[i], )
#     return res

# print(oddTuples((1,3,5,6,8)))

# listA = [1, 4, 3, 0]
# listA.sort()

# warm = ['red', 'yellow', 'orange'] 
# sortedwarm = warm.sort() 
# print(warm)
# print(warm.sort())
# print(sorted(warm))

# aList = [0, 1, 2, 3, 4, 5]
# bList = aList
# aList[2] = 'hello'
# aList == bList

'''------'''

#lec6
# L1 =[1, 28, 36]
# L2 = [2, 57, 9]
# # for elt in map(min, L1, L2):
# #     print(elt)

# print(list(map(min, L1, L2)))

# def applyToEach(L, f):
#     for i in range(len(L)):
#         L[i] = f(L[i])

# testList = [1, -4, 8, -9]

# #1>>> print(testList) : [5, -20, 40, -45]
# def timesFive(a):
#     return a * 5

# applyToEach(testList, timesFive)
# print(testList)

# #2 >>> print(testList) :[1, 4, 8, 9]
# applyToEach(testList, abs)
# print(testList)

# # 3 >>> print(testList) : [2, -3, 9, -8]
# def plusone(a):
#     return a+1
# applyToEach(testList, plusone)
# print(testList)

# # 4   >>> print testList : [1, 16, 64, 81]
# def square(a):
#     return a*a
# applyToEach(testList, square)
# print(testList)


# animals = {'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}
# animals['d'] = ['donkey']
# animals['d'].append('dog')
# animals['d'].append('dingo')

# def how_many(aDict):
#     count = 0
#     for i in aDict.values():
#         count += len(i)
#     return count

# print(how_many(animals))

animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}

animals['d'] = ['donkey']
animals['d'].append('dog')
animals['d'].append('dingo')


# def biggest(aDict):
#     result = None
#     biggestValue = 0
#     for key in aDict.keys():
#         if len(aDict[key]) >= biggestValue:
#             result = key
#             biggestValue = len(aDict[key])
#     return result


# def biggest(aDict):
#     biggestValue = 0
#     for key in aDict.keys():
#         if len(aDict[key]) > biggestValue:
#             biggestValue = len(aDict[key])
#     return key

# print(biggest(animals))

def fib_efficient(n, d):
    if n in d:
        return d[n]
    else:
        ans = fib_efficient(n-1, d) + fib_efficient(n-2, d)
        d[n] = ans
        return ans
    
d={1:1, 2:2}
print(fib_efficient(6,d))  #1 2 3 5 8 13 