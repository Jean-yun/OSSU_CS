#Problem #1
'''
Write a program to calculate the credit card balance after one year 
if a person only pays the minimum monthly payment required by the credit card company each month.
'''
def creditbalance(balance, annualInterestRate, monthlyPaymentRate):
    #새로운 balance
    n = 0
    while n != 12:
        balance = balance*(1-monthlyPaymentRate) * (1 + annualInterestRate/12)
        n += 1 
    print('Remaining balance : ', (round(balance,2)))


creditbalance(5000, 0.18, 0.02)


#Problem #2
'''
Now write a program that calculates the minimum fixed monthly payment needed 
in order pay off a credit card balance within 12 months. 
By a fixed monthly payment, we mean a single number which does not change each month,
but instead is a constant amount that will be paid each month.
'''
def Payingoff(balance, annualInterestRate):
    monthlyInterestRate= annualInterestRate/12
    monthlyPayment = 10
    original_balance = balance

    while True:
        for _ in range(12):
            balance = (balance - monthlyPayment)*(1 + monthlyInterestRate)
        if balance <= 0:
            break
        else:
            balance = original_balance
            monthlyPayment += 10
    print('Lowest Payment: ', monthlyPayment)

Payingoff(5000, 0.12)

#problem #3
'''
how can we calculate a more accurate fixed monthly payment than we did in Problem 2
without running into the problem of slow code? 
We can make this program run faster using a technique introduced in lecture - bisection search!
'''
def Payoff(balance, annualInterestRate):
    monthlyInterestRate= annualInterestRate/12
    original_balance = balance
    lower = balance/12
    upper = (balance*(1 + monthlyInterestRate)**12)/12

    while abs(balance) > 0.01:
        balance = original_balance
        mid = (lower+upper)/2
        for _ in range(12):
            balance = (balance - mid)*(1+monthlyInterestRate)
        if balance > 0:
            lower = mid
        elif balance < 0:
            upper = mid
    print('Lowerst Payment: ',round(mid, 2))


Payoff(320000, 0.2)