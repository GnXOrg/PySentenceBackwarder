import sys
def SentenceBackwarder():
    print("There're currently 2 modes:\n1. Backward all letters\n2. Backward all words.\n3. Exit")
    whatMode = input("I want to use mode: ")
    while whatMode != "1" and whatMode != "2" and whatMode != "3":
        print("That's not a vaild mode.")
        whatMode = input("I want to use mode: ")
    if whatMode == "1":
        s = input("Type a sentence below to backward it: ")
        while len(s) <= 1: 
            print("Length must be 2 or higher to backward!")
            s = input("Type a sentence below to backward it: ")
        print("Backwarded sentence: {}".format("".join(reversed(s)))) 
        askForContinue()
    elif whatMode == "2":
        ss = input("Type a sentence below to backward it: ")
        while not " " in ss:
            print("There must be 2 or more words to backward!")
            ss = input("Type a sentence below to backward it: ")
        print("Backwarded sentence: {}".format(" ".join(reversed(ss.split(" ")))))
        askForContinue()
    elif whatMode == "3":
        print("Thank you for using PySentenceBackwarder! Made by GnXOrg")
        sys.exit(0)
def askForContinue():
    yOrn = input("Do you want to backward more sentence? (Y/N): ").lower()
    while yOrn != "y" and yOrn != "n":
        print("Invalid choice! Please try again")
        yOrn = input("Do you want to backward more sentence? (Y/N): ").lower()
    if (yOrn == "y"):
        SentenceBackwarder()
    elif (yOrn == "n"):
        print("Thank you for using PySentenceBackwarder! Made by GnXOrg")
        sys.exit(0)
print("Welcome to SentenceBackwarder (v20.08.09)")
SentenceBackwarder()