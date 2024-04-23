"""
Write a recursive Python function, given a non-negative integer N,
to calculate the no. of occurrences of digit 7 in N.
Hint: Mod (%) by 10 gives you the rightmost digit (126 % 10 is 6),
while doing integer division by 10 removes the rightmost digit (126 / 10 is 12).
This function has to be recursive; you may not use loops!
This function takes in one integer and returns one integer.
"""

#Recursive
def count7(num): 
    #뒷자리가 7인지 계속 세는거다. Num의 자릿수는 하나씩 줄여가면서.
    #첫번째 if가 성립할 때에 다 때려박고, 나머지 else에는 재귀함수를 넣는다

    #base case를 항상 먼저 생각하고 지정할 것!!
    #이게 되게 중요한게, 마지막 숫자까지 다 loop 돌고나서 몫이 0이 되었을 때도 return 해준다
    if num==0:
        return 0
    elif num%10 == 7:
        return 1+ count7(num//10)
    else:
        return count7(num//10)
    
num1 = 72384777
num2 = 320391
num3 = 7777777

print(count7(num1))
print(count7(num2))
print(count7(num3))


# Non-recursive
def count7_iter(num):
    count = 0
    for i in list(str(num)):
        if i == '7':
            count +=1
    return count

print(count7_iter(num1))
print(count7_iter(num2))
print(count7_iter(num3))