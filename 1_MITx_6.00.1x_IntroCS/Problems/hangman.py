secretWord = 'apple' 
lettersGuessed = ['e', 'i', 'k', 'p', 'r', 's']

import string
alphabets = list(string.ascii_lowercase)

def Hangman(secretword):
    print('The total length of word is ',len(secretword))
    
    wrong = 0
    wordguessed = ['_' for _ in secretword]
    Guessed = False
    

    while not Guessed:
        print('Alphabets not used: ', ''.join(alphabets))
        print('Guessed so far: ', ' '.join(wordguessed))
        print(f'Wrong guesses: {wrong}, You can guess {15-wrong} more times!\n')
        guess = input('Please Enter your guess: ').lower()

        if guess not in alphabets:
            print("You've already guessed that Letter! Try again.\n")
            continue

        elif guess in secretword:
            #1) 알파벳에서 제거
            alphabets.remove(guess)
            #2) wordguessed에 해당되는 자리에 추가
            for i, word in enumerate(secretword):
                if guess == word:
                    wordguessed[i] = word
                    print('Correct!\n')
            
            if ''.join(wordguessed) == secretword:
                Guessed =True

        else:
            print('Not in Secret word. Try again.\n')
            wrong += 1
    
    print('You\'ve got the rigth anwer!: ',secretword)


Hangman('cowboy')
