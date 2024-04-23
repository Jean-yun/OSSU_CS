class A(object):
    def __init__(self):
        self.a = 1
    def x(self):
        print("A.x")
    def y(self):
        print("A.y")
    def z(self):
        print("A.z")

class B(A):
    def __init__(self):
        A.__init__(self)
        self.a = 2
        self.b = 3
    def y(self):
        print("B.y")
    def z(self):
        print("B.z")

class C(object):
    def __init__(self):
        self.a = 4
        self.c = 5
    def y(self):
        print("C.y")
    def z(self):
        print("C.z")

class D(C, B):
    def __init__(self):
        C.__init__(self)
        B.__init__(self)
        self.d = 6
    def z(self):
        print("D.z")
        

obj = D()
print(obj.a) #2
print(obj.b) #3
print(obj.c) #5
print(obj.d) #6

obj.x() #A.x
obj.y() #C.y #여기가 조금... 이해가 안갔음 
obj.z() #D.z

#여기가 잘 이해가 안 됐었다.
#근데 obj.a를 불렀을 때는 B에 대한 결과인 a=2가 나오는 게 
#init : Every call to init bounds values to variables. Find the last call to init to understand what values have been bound to a, b, c, and d. Take a look at D instance object.
#inheritance : 