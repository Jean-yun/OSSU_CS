"""
Implement a function called closest_power that meets the specifications below.

For example,

closest_power(3,12) returns 2
closeost_power(4,12) returns 2
closest_power(4,1) returns 0
"""

def closest_power(base, num):
    '''
    base: base of the exponential, integer > 1
    num: number you want to be closest to, integer > 0
    Find the integer exponent such that base**exponent is closest to num.
    Note that the base**exponent may be either greater or smaller than num.
    In case of a tie, return the smaller value.
    Returns the exponent.
    '''
    # Your code here 
    answer = 0
    if base > num:
        return 0
    elif base == num:
        return 1
    else:
        #우리는 answer가 num의 절반보다 클 수 없다는 걸 안다 (2,4) (3,4) (3,5) (3,9)
        for i in range(1, num//2):
            if abs(base**i - num) < abs(base**(i+1) - num):
                answer = i
                break
    return answer 


print(closest_power(3,85))
print(closest_power(2,9))