# Problem 3
# 10/10 points (graded)
# Numbers in Mandarin follow 3 simple rules.

# There are words for each of the digits from 0 to 10.
# For numbers 11-19, the number is pronounced as "ten digit", so for example, 16 would be pronounced (using Mandarin) as "ten six".
# For numbers between 20 and 99, the number is pronounced as “digit ten digit”, so for example, 37 would be pronounced (using Mandarin) as
# "three ten seven". If the digit is a zero, it is not included.
# Here is a simple Python dictionary that captures the numbers between 0 and 10.
# trans = {'0':'ling', '1':'yi', '2':'er', '3':'san', '4': 'si', '5':'wu', '6':'liu', '7':'qi', '8':'ba', '9':'jiu', '10': 'shi'}

# We want to write a procedure that converts an American number (between 0 and 99), written as a string, into the equivalent Mandarin.

# Example Usage
# convert_to_mandarin('36') will return san shi liu
# convert_to_mandarin('20') will return er shi
# convert_to_mandarin('16') will return shi liu

# Paste your function here
def convert_to_mandarin(us_num):
    '''
    us_num, a string representing a US number 0 to 99
    returns the string mandarin representation of us_num
    '''
    # FILL IN YOUR CODE HERE
    trans = {'0':'ling', '1':'yi', '2':'er', '3':'san', '4': 'si', '5':'wu', '6':'liu', '7':'qi', '8':'ba', '9':'jiu', '10': 'shi'}
    mandarin = []
    if us_num <= 10:
        return trans[str(us_num)]
    
    elif us_num <= 19:
        return trans['10'] + ' ' + trans[us_num%10]
    
    elif str(us_num)[-1] == '0':
        return trans[str(us_num//10)] + ' '+ trans['10']
    
    else:
        mandarin.extend([trans[str(us_num//10)], trans['10'], trans[str(us_num%10)]])
        return ' '.join(mandarin)
    
print(convert_to_mandarin(10))
print(convert_to_mandarin(55))
print(convert_to_mandarin(30))
print(convert_to_mandarin(35))
print(convert_to_mandarin(99))

#shi
#wu shi wu
#san shi wu
#jiu shi jiu