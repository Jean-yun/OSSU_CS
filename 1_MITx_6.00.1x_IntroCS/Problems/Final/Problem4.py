# Problem 4
# 15.0/15.0 points (graded)
# Write a Python function that creates and returns a list of prime numbers between 2 and N, inclusive,
# sorted in increasing order. A prime number is a number that is divisible only by 1 and itself.
# This function takes in an integer and returns a list of integers.


# def primes_list(N):
#     '''
#     N: an integer
#     '''
#     # Your code here
#     # Attempt_1
#     res = [2]
#     prime = 3
#     while prime < N:
#         for i in res:
#             if prime % i == 0:
#                 break
#         else:
#             res.append(prime)
#         prime += 1

#     return res
        
# print(primes_list(20))
# #[2, 3, 5, 7, 11, 13, 17, 19]


def primes_list(N):
	res = []
	for i in range(2, N+1):
		for j in range(2, i):
			if i % j == 0:
				break
		else:
			res.append(i)
	return res


print(primes_list(20))
#[2, 3, 5, 7, 11, 13, 17, 19]



                
	
        