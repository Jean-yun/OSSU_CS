import matplotlib.pyplot as plt

mySamples = []
myLinear = []
myQuadratic = []
myCubic = []
myExponential = []
for i in range(0, 30): 
	mySamples.append(i) 
	myLinear.append(i) 
	myQuadratic.append(i**2) 
	myCubic.append(i**3)
	myExponential.append(1.5**i)
	

# 서브플롯 생성
# fig, axes = plt.subplots(2, 2, figsize=(10, 8))

# # 각 서브플롯에 데이터 플롯
# axes[0, 0].plot(mySamples, myLinear)
# axes[0, 0].set_title('Linear')

# axes[0, 1].plot(mySamples, myQuadratic)
# axes[0, 1].set_title('Quadratic')

# axes[1, 0].plot(mySamples, myCubic)
# axes[1, 0].set_title('Cubic')

# axes[1, 1].plot(mySamples, myExponential)
# axes[1, 1].set_title('Exponential')

# # 그림 표시
# plt.tight_layout()  # 서브플롯 간의 간격 조정
# plt.show()

plt.figure('lin')
plt.xlabel('sample')
plt.ylabel('Linear function')
plt.plot(mySamples, myLinear, 'bo', label='linear')
plt.legend(loc = 'upper left')
# plt.yscale('log')
plt.show()