#Problem_1
def isWordGuessed(secretword, lettersguessed):
    for i in secretword:
        return i in lettersguessed
    
secretWord = 'apple' 
lettersGuessed = ['e', 'i', 'k', 'p', 'r', 's']
print(isWordGuessed(secretWord, lettersGuessed))


#Probelm_2
def getguessedword(secretword, lettersguessed):
    #리스트로 만들어서 _로 join하면 될 거 같은데
    answer = list('_'*len(secretWord))
    for i in range(len(secretword)):
        if secretword[i] in lettersguessed:
            answer[i] = secretword[i]
    return ' '.join(answer)

print(getguessedword(secretWord, lettersGuessed))

#Probelm_2_1 (shorter)
def getguessedword_2(secretword, lettersguessed):
    return ' '.join([letter if letter in lettersguessed else '-' for letter in secretword])

print(getguessedword_2(secretWord, lettersGuessed))


#Problem_3
'''
Next, implement the function getAvailableLetters that takes in one parameter
- a list of letters, lettersGuessed. 
This function returns a string that is comprised of lowercase English letters 
- all lowercase English letters that are not in lettersGuessed.
'''
import string
print(string.ascii_lowercase)

def getAvailableLetters(lettersguessed):
    str = list(string.ascii_lowercase)
    str_index = str[:]
    for i in str_index:     #이걸 그대로 str으로만 높으면, 건너뛰는 알파벳이 생겨버린다
        if i in lettersguessed:
            str.remove(i)
    return ''.join(str)

print(getAvailableLetters(lettersGuessed))


#Problem_4
def hangman(secretword):
    lettersGuessed = ['-' for _ in secretword]
    mistakesMade = 0
    availableLetters= list(string.ascii_lowercase)
    Guessed = False

    #일단 예측을 하면, 
    #1) 있는지 확인해서 있으면 lettersGuessed 자리에 추가 & availbleLetter에서 해당 문자 삭제하고 표출
    #2) 틀리면 mistakesMade += 1 하고 에러메세지 표출
    #3) lettersGuessed == secretword면 최종 정답 표출하고 종료

    print('The length of the secret word is ',len(secretword))

    while not Guessed:
        print('Available Letters are :', ''.join(availableLetters))
        print('Mistakes Made: ',mistakesMade)
        print(' '.join(lettersGuessed))
        guess = input('Guess the word: ').lower()

        #이미 추론한 정답을 또 말할 경우
        if guess not in availableLetters:
            print("You've already guessed that letter. Try again!")
            continue 
        #x가 정답에 있을 경우, 이거를 알파벳에서 삭제하고, guessed 리스트에 추가한다
        if guess in secretword:
            for i, letter in enumerate(secretword):
                if letter == guess:
                    lettersGuessed[i] = guess
            availableLetters.remove(guess)

        #x가 정답에 없을 경우, 틀린 횟수를 더하고 표출한다
        else:
            print('Not in Secret word. Try again!')
            mistakesMade += 1

        if ''.join(lettersGuessed) == secretword:
            print("You've got the answer! The answer is ",secretword)
            Guessed = True
        elif mistakesMade >= 11:
            print('Sorry, you ran out of guesses. The word was ', secretword)
            break

hangman('cowboy')

    

