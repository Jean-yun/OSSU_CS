
'''
A regular polygon has n number of sides. Each side has length s.
Write a function called polysum that takes 2 arguments, n and s. 
This function should sum the area and square of the perimeter of the regular polygon. 
The function returns the sum, rounded to 4 decimal places.
'''

from math import tan, pi
def polysum(n, s):
    '''
    n: 변의 갯수, s: 변의 길이
    모든 변의 길이는 같은 다각형이라고 가정
    # polygon의 영역 + (둘레의 길이)^2
    # 소숫점 4자리까지 나오는 sum을 리턴
    '''
    area = (0.25*n*s*s)/tan(pi/n)
    perimeter = n*s
    return round(area + perimeter**2, 4)

print(polysum(4, 3))  
# 9 + (12)^2 = 9 + 144 = 153