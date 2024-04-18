#problem 1

def isWordGuessed(secretword, lettersguessed):
    for i in secretword:
        return i in lettersguessed
    
secretWord = 'apple' 
lettersGuessed = ['e', 'i', 'k', 'p', 'r', 's']
print(isWordGuessed(secretWord, lettersGuessed))


#probelm 2

def getguessedword(secretword, lettersguessed):