class intSet(object):
    def __init__(self):
        self.vals = []
    def insert(self, e):
        if not e in self.vals:
            self.vals.append(e)
            
    def member(self, e):
        return e in self.vals
    
    def remove(self, e):
        try:
            self.vals.remove(e)
        except:
            raise ValueError(str(e) + ' not found')
        
    def __str__(self):
        self.vals.sort()
        result = ''
        for e in self.vals:
            result = result + str(e) + ','
        return '{' + result[:-1] + '}'
    
    def __len__(self):
        return len(self.vals)
    

    def intersect(self, other):
        # 틀렸당
        # try:
        #      for i in self.vals:
        #           if i in other.vals:
        #               return [].append(i)
        # except:
        #     print('No common element')
        
        #이렇게 따로 셋을 만들어줄 것!
        commonSet = intSet()
        for val in self.vals:
            if other.member(val):
                commonSet.insert(val)
        return commonSet
        
        

a = intSet()
a.insert(5)
s = intSet()
print(s)
s.insert(3)
s.insert(4)
s.insert(3)
print(s)
s.member(3)
s.member(5)
s.insert(6)
print(s)
s.remove(3)
print(s)
print(a)
s.intersect(a)
#s.remove(3)
