# s=  'hello'
# s= 'y'+ s[1:]
# print(s)


# a = 0
# for i in range(10):
#     a += 1
#     if i %2 == 0:
#         break
# print(a)

# iteration = 0
# while iteration < 5:
#     count = 0
#     for letter in "hello, world":
#         count += 1
#     print("Iteration " + str(iteration) + "; count is: " + str(count))
#     iteration += 1 

# print( '--- ')
# iteration = 0
# while iteration < 5:
#     count = 0
#     for letter in "hello, world":
#         count += 1
#         if iteration % 2 == 0:
#             break
#     print("Iteration " + str(iteration) + "; count is: " + str(count))
#     iteration += 1 


# x = 25
# epsilon = 0.01
# step = 0.1
# guess = 0.0

# while guess <= x:
#     if abs(guess**2 -x) < epsilon:
#         break
#     else:
#         guess += step

# if abs(guess**2 - x) >= epsilon:
#     print('failed')
# else:
#     print('succeeded: ' + str(guess))


#Exercise : Guess My Number


# low = 0
# high = 100
# guess = (low+high)//2
# print('Please think of a number between 0 and 100!: ')
# print(f'Is your secret number {guess}?')
# answer = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly.")

# while answer != 'c':
#     if answer not in ['h','l','c']:
#         print('Sorry, I did not understand your input.')
#     else:
#         if answer == 'h':
#              high = guess
#         elif answer == 'l':
#             low = guess
#         guess = (low+high)//2
#         print(f'Is your secret number {guess}?')
#     answer = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly.")

# print('Game over. Your secret number was: ',guess)
    

# #Exercise
# low = 0
# high = 100
# guessed = False

# print('Please think of a number between 0 and 100!: ')
# while not guessed:
#     guess = (high+low)//2
#     print(f'Is your secret number {guess}?')
#     answer = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly.")
#     if answer == 'c':
#         guessed=True
#     elif answer == 'l':
#         low = guess
#     elif answer == 'h':
#         high = guess
#     else:
#         print('Sorry, I did not understand your input.')
# print('Game over. Your secret number was: ',guess)


# #Int to Binary
# num = 64
# if num<0:
# 	isNeg =True
# 	num = abs(num)
# else:
# 	isNeg=False
# result= ''
# if num==0:
# 	result = '0'
# while num>0:
# 	result = str(num%2) + result #이렇게 하면 구한 나머지가 새로 구하는 애들 뒤로 밀린다
# 	num = num//2
# if isNeg:
# 	result = '-'+result

# print(result)


# #float to Binary
# x = float(input('Enter decimal number btw 0 and 1 : '))
# p=0
# while (x * (2**p)) % 1 != 0:	#x에 2의 거듭제곱을 곱한게 정수가 될 때까지 반복
# 	print('Remainder : '+str(x*(2**p)- int(x*(2**p))))
# 	p += 1

# num = int(x * (2**p))	#최종적으로 2의 거듭제곱을 곱해서 정수가 된 애를 num

# #이제 num을 2진수로 바꿔야겠지
# result = ''
# if num ==0:
# 	result = '0'
# while num>0:
# 	result = str(num%2) + result
# 	num = num //2

# #이제 소숫점을 다시 복원시켜줘야겠지 2^p 만큼 옮겨놨으니까
# #만약 7자리를 해야한다고 하면, 이진수 111이라고 했을 때, 0.0000111 이니까 
# #len(num)= 3, p = 7, 만들어야하는 0는 5개 
# for i in range(p-len(result)):	#0,1,2,3,4니까 5개 ! 
# 	result = '0'+ result
# result = result[0] + '.' + result[1:]
# print('The binary representation of Decimal '+ str(x) + ' is '+ result)


# # x^2 = 24 인 식의 해를 구하는 것
# epsilon = 0.01
# y = 24.0
# guess = y/2.0
# numGuesses = 0

# while (guess**2 - y) >= epsilon:
# 	numGuesses += 1
# 	guess = guess - (guess**2 - y)/(2*guess) #just a formula
# print('numGuesses: ',numGuesses)
# print('Square root of '+str(y)+' is about '+str(guess))


# def is_even(i):
#     print('hi')
#     return i%2 == 0

# print(is_even(5))
# # is_even(3)
# # print('-----')
# # print(is_even(3))

# # #Exercise : Square
# # def square(x):
# #     return x**2

# #Exercise : eval quadratic
# def evalQuadratic(a,b,c,x):
#     return a*x*x + b*x + c


# def f(y):
#     x = 1
#     x += 1
#     print(x)

# x= 5
# f(x)
# print(x)

# print('-----')

# def g(y):
#     print(x)
#     print(x+1)

# x=5
# g(x)
# print(x)

# print('---')

# def h(y):
#     x=x+1

# x=5
# h(x)
# print(x)

# print('---')

# def g(x):
#     def h():
#         x = 'abs'
#     x = x+1
#     print('in g(x): x = ', x)
#     h()
#     return x

# x = 3
# z = g(x)

# def a(x):
#    '''
#    x: int or float.
#    '''
#    return x + 1

# def b(x):
#    '''
#    x: int or float.
#    '''
#    return x + 1.0
  
# def c(x, y):
#    '''
#    x: int or float. 
#    y: int or float.
#    '''
#    return x + y

# def d(x, y):
#    '''
#    x: Can be of any type.
#    y: Can be of any type.
#    '''
#    return x > y

# def e(x, y, z):
#    '''
#    x: Can be of any type.
#    y: Can be of any type.
#    z: Can be of any type.
#    '''
#    return x >= y and x <= z

# def f(x, y):
#    '''
#    x: int or float.
#    y: int or float
#    '''
#    x + y - 2  

'''-----------'''

# def a(x, y, z):
#      if x:
#          return y
#      else:
#          return z

# def b(q, r):
#     return a(q>r, q, r)


# b(a,b)

# a =10
# def f(x):
#     return x+a

# print(f(1))

# str1 = 'exterminate!' 
# str2 = 'number one - the larch'

# print(str1.upper)
# print(str1.upper())
# print(str2.swapcase())
# print(str2.index('n'))

# def fact(x):
#     if x==1:
#         return 1
#     else:
#         return x* fact(x-1)

# print(fact(4))

# #Exercise: Power iter
# def iterPower(base, exp):
#     n=1
#     result = base
#     if exp==0:
#         return 1
#     elif exp==n:
#         return base
#     else:
#         while n<exp:
#             result *= base
#             n+=1
#         return result
        

# def iterPower(base, exp):
#     result= 1
#     while exp >0:
#         result *= base
#         exp -= 1
#     return result

# print(iterPower(4,3))


# def recurPower(base,exp):
#     result = 1
#     if exp ==0:
#         return result
#     else:
#         return base * recurPower(base, exp-1)
    
# print(recurPower(4,3))

'''----'''
# #from , to , sparse 세개의 기둥이 있는 하노이 문제
# #from 에서 to 로 옮길거다
# def printMove(fr, to):
#     print ('Move From '+str(fr)+ ' to '+str(to))

# def Towers(n, fr, to, spare):
#     if n==1:
#         printMove(fr, to)
#     else:
#         Towers(n-1, fr, spare, to)
#         Towers(1, fr, to, spare)
#         Towers(n-1, spare, to, fr)

# print(Towers(4, 'P1', 'P2', 'P3'))

'''----'''

# #gcd
# def gcdIter(a,b):
#     c = min(a,b)
#     d = max(a,b)
#     div = c
#     if d%c == 0:
#         return c
#     else:
#         while not (d%div == 0 and c%div == 0):
#             div -=1
#         return div 

# print(gcdIter(50, 15))

#New solution
# def gcdIter(a,b):
#     c = min(a,b)
#     while a%c !=0 or b%c !=0:
#         c -=1 
#     return c 

# print(gcdIter(12,6))

# #gcd recur
# def gcdRecur(a,b):
#     #여기서 나누는 애를 b라고 두는거다
#     if b==0:
#         return a
#     else:
#         return gcdRecur(b, a%b)
    
# print(gcdRecur(12,20))


# def isIn(char, astr):
#     if astr== '' :
#         return False
    
#     if len(astr) == 1:
#         return char == astr
    
#     midIndex = len(astr)//2
#     midchar = astr[midIndex]

#     if char == midchar:
#         return True
    
#     elif char < midchar:
#         return isIn(char, astr[:midIndex])
    
#     else:
#         return isIn(char, astr[midIndex+1:])
    
# print(isIn('s', 'acdfgrsuvxz'))

'''----------'''

# #Baseline
# def isIn(char, astr):
#     if astr == '':
#         return False
    
#     if len(astr) == 1:
#         return char == astr
    
#     #나머지 경우
#     midindex = len(astr)//2
#     midchar = astr[midindex]

#     #중간값인 경우
#     if char == midchar:
#         return True
#     #더 작은 경우
#     elif char < midchar:
#         return isIn(char, astr[:midindex])
#     #더 큰 경우
#     else:
#         return isIn(char, astr[midindex+1:])
    
# print(isIn('x', 'acdfgrsuvxz'))

'''------'''

from math import tan, pi
def polysum(n, s):
    # polygon의 영역 + (둘레의 길이)^2
    # 소숫점 4자리까지 나오는 sum을 리턴
    '''
    n: 변의 갯수, s: 변의 길이
    모든 변의 길이는 같은 다각형이라고 가정
    '''
    area = (0.25*n*s*s)/tan(pi/n)
    perimeter = n*s
    return round(area + perimeter**2, 4)

print(polysum(4, 3)) # 9 + (12)^2 = 9 + 144 = 153