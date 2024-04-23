"""
Write a function to flatten a list. The list contains other lists, strings, 
or ints. For example, [[1,'a',['cat'],2],[[[3]],'dog'],4,5] is flattened 
into [1,'a','cat',2,3,'dog',4,5] (order matters).
"""

#Recursive
def flatten(aList):
    answer = []
    for element in aList:
        #1) 리스트인 경우, 다시 flatten을 적용해서 요소별로 풀어줘야 한다
        if isinstance(element, list):   # type(element) == list : 이렇게 해도 됨
            answer.extend(flatten(element))

        #2) 리스트가 아닌 경우
        else:
            answer.append(element)
    return answer

        
print(flatten([[1,'a',['cat'],2],[[[3]],'dog'],4,5]))