import sys
def SentenceBackwarder():
    s = input("Type a sentence below to backward it:")
    if len(s) <= 1: 
        print("Length must be 2 or higher to backward!")
        askForContinue()
    else:
        print("Backwarded sentence: {}".format("".join(reversed(s)))) 
        askForContinue()
def askForContinue():
    yOrn = input("Do you want to backward more sentence? (Y/N):").lower()
    if (yOrn == "y"):
        SentenceBackwarder()
    elif (yOrn == "n"):
        print("Thank you for using PySentenceBackwarder! Made by GnXOrg")
        sys.exit()
    else:
        print("Invalid choice! Please try again")
        askForContinue()
print("Welcome to SentenceBackwarder (v20.05.05)")
SentenceBackwarder()