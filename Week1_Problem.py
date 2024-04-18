
#Problem_1
'''
Assume s is a string of lower case characters.
Write a program that counts up the number of vowels contained in the string s. 
Valid vowels are: 'a', 'e', 'i', 'o', and 'u'. 
For example, if s = 'azcbobobegghakl', your program should print:
'''
s = 'azcbobobegghakl'
count = 0
vowels = ['a','e','i','o','u']
for i in s:
    if i in vowels:
        count+=1
print(count)


#Problem_2
'''
Assume s is a string of lower case characters.
Write a program that prints the number of times the string 'bob' occurs in s. 
For example, if s = 'azcbobobegghakl', then your program should print
'''
s = 'azcbobobegghakl'
count = 0
for i in range(len(s)):
    if s[i:i+3] == 'bob':
        count += 1
print('Number of times bob occurs is: ',count)


#Problem_3
'''
Assume s is a string of lower case characters.
Write a program that prints the longest substring of s in which the letters occur in alphabetical order. 
For example, if s = 'azcbobobegghakl', then your program should print 

Longest substring in alphabetical order is: beggh

In the case of ties, print the first substring. 
For example, if s = 'abcbcd', then your program should print

Longest substring in alphabetical order is: abc

'''
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