"""
ESTIMATED TIME TO COMPLETE: 10 minutes
Write a generator, genPrimes, that returns the sequence of prime numbers 
on successive calls to its next() method: 2, 3, 5, 7, 11, ...
"""

#2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59...
# 1, 2,2 ,4,2,4, 2,4,6, 2,6,4, 2,4,6,6
def genPrimes():
	primes = []
	last = 1
	while True:
		last += 1
		for p in primes:
			if last % p == 0:
				break
		else:
			primes.append(last)
			yield last


primes = genPrimes()

print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
