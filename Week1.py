# if 6>7:
# 	print('Yep')

# temp = 120
# if temp > 100:
#    print("REALLY HOT!")
# elif temp > 60:
#    print("Comfortable") 
# else:
#    print("Cold")

# a = 'sjid'
# print(type(a))

# type(a) =='str'

# num = 0
# while num <= 5:
#     print(num)
#     num += 1

# print("Outside of loop")
# print(num)


# numberOfLoops = 0
# numberOfApples = 2
# while numberOfLoops < 10:
#     numberOfApples *= 2
#     numberOfApples += numberOfLoops
#     numberOfLoops += 1
# print("Number of apples: " + str(numberOfApples))

# print('hi')

# num = 0
# while num<=8:
#     num += 2
#     print(num)
# print('Goodbye!')


# num=10
# print('Hello!')
# while num>1:
#      print(num)
#      num -= 2


# res= []
# end = 6

# for i in range(1,end+1):
#      res.append(i)
# print(sum(res))

# for i in range(2,11,2):
#     print(i)
# print('Goodbye!')

# for i in range(10,0,-1):
#     print(i)
    
# num=0
# for i in range(6):
#     num+=i+1
# print(num)

# x=3
# ans=0
# iterLeft= x
# while iterLeft !=0:
#     ans = ans+x
#     iterLeft = iterLeft -1
# print((str(x) +'*'+ str(x) +'='+str(ans)))

# for letter in 'hola':
#     print(letter)  
    
# num = 10
# for num in range(5):
#     print(num)
# print(num)

# for i in 'inside':
#     print(i)
# print(i)


# school = 'Massachusetts Institute of Technology'
# numVowels = 0
# numCons = 0

# for char in school:
#     if char == 'a' or char == 'e' or char == 'i' \
#        or char == 'o' or char == 'u':
#         numVowels += 1
#     elif char == 'o' or char == 'M':
#         print(char)
#     else:
#         numCons -= 1

# print('numVowels is: ' + str(numVowels))
# print('numCons is: ' + str(numCons)) 

# print('ok'+str(3))

# count=0
# for letter in 'hello, world':
#     count +=1 
# print(count)

# count = 0
# phrase = "hello, world"
# for iteration in range(5):
#     while True:
#         count += len(phrase)
#         break
#     print("Iteration " + str(iteration) + "; count is: " + str(count))
    
# iteration = 0
# count = 0
# while iteration < 5:
#     for letter in "hello, world":
#         count += 1
#     print("Iteration " + str(iteration) + "; count is: " + str(count))
#     iteration += 1 
    
# count = 0
# for letter in 'hello, world':
#     count += 1
# print(count)

# for iteration in range(5):
#     count = 0
#     while True:
#         for letter in "hello, world":
#             count += 1
#         print("Iteration " + str(iteration) + "; count is: " + str(count))
        
# for iteration in range(5):
#     count = 0
#     while True:
#         for letter in "hello, world":
#             count += 1
#         print("Iteration " + str(iteration) + "; count is: " + str(count))
#         break
    
# count = 0
# phrase = "hello, world"
# for iteration in range(5):
#     while True:
#         count += len(phrase)
#         break
#     print("Iteration " + str(iteration) + "; count is: " + str(count))


#Problem_1
s = 'azcbobobegghakl'
count = 0
vowels = ['a','e','i','o','u']
for i in s:
    if i in vowels:
        count+=1
print(count)

#2
s = 'azcbobobegghakl'
count = 0
for i in range(len(s)):
    if s[i:i+3] == 'bob':
        count += 1
print('Number of times bob occurs is: ',count)


#3
#기준되는 처음 시작하는 알파벳을 갱신해야겠지. 
#그리고 가장 긴 알파벳을 가진 string을 뽑아내야겠지.
s = 'azcbobobegghakl'
longest = ''
current = s[0]

for i in range(len(s)-1):
    if s[i]<= s[i+1]:
        current += s[i+1]
    else:
        if len(current) > len(longest):
            longest = current
        current = s[i+1]

if len(current) > len(longest):
    longest = current
print('Longest : ',longest)