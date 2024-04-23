# =============================================================================
# Problem 3
# 
# Write a function is_triangular that meets the specification below. A triangular 
# number is a number obtained by the continued summation of integers starting 
# from 1. For example, 1, 1+2, 1+2+3, 1+2+3+4, etc., corresponding to 
# 1, 3, 6, 10, etc., are triangular numbers.
# 
# def is_triangular(k):
#     """
#     k, a positive integer
#     returns True if k is triangular and False if not
#     """
#     #YOUR CODE HERE
# =============================================================================

#code
def is_triangular(k):
    """
    k, a positive integer
    returns True if k is triangular and False if not
    """
    triangular = 0
    num = 1
    while triangular < k:
        triangular += num
        num += 1
    return k == triangular

print(is_triangular(10))
#True
print(is_triangular(21))
#True
print(is_triangular(5))
#False
print(is_triangular(11))
#False
print(is_triangular(20))
#False

