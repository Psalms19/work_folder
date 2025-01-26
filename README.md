import time

# Dictionary to store card numbers and corresponding PINs
cardsWithPin = {123456789: 123, 987654321: 345, 234567890: 567, 345678901: 789}

# Dictionary to store card numbers and corresponding account balances
cardsWithAmt = {123456789: 50000, 987654321: 5000, 234567890: 7890, 345678901: 100000}

# Function to check account balance
def checkBalance(cardNo):
    print(f"Current Balance: Rs.{cardsWithAmt.get(cardNo)}/-")
    time.sleep(0.6)

# Function to withdraw money
def withdraw(cardNo):
    print(f"Initial Balance: Rs.{cardsWithAmt.get(cardNo)}/-")
    try:
        withdrawAmt = int(input("Enter amount you want to withdraw: "))
        if cardsWithAmt[cardNo] >= withdrawAmt:
            cardsWithAmt[cardNo] -= withdrawAmt
            time.sleep(0.6)
            print(f"Rs. {withdrawAmt}/- Withdraw Successfully...")
            print(f"Remaining Amount: Rs.{cardsWithAmt[cardNo]}/-")
            time.sleep(0.6)
        else:
            time.sleep(1)
            print("Insufficient Balance...")
            time.sleep(0.6)
    except ValueError:
        print("Please Enter Integer Value...")

# Function to deposit money
def deposit(cardNo):
    print(f"Initial Balance: Rs.{cardsWithAmt.get(cardNo)}/-")
    try:
        depositAmt = int(input("Enter amount you want to deposit: "))
        time.sleep(0.6)
        cardsWithAmt[cardNo] += depositAmt
        print(f"Rs.{depositAmt}/- are deposited successfully...")
        print(f"Current Balance: Rs.{cardsWithAmt.get(cardNo)}/-")
        time.sleep(0.6)
    except ValueError:
        print("Please Enter Integer Value...")

# Main ATM system function
def atmSystem():
    print("==== WELCOME ====")
    try:
        cardNo = int(input("Enter your card number: "))
        if cardNo not in cardsWithPin:
            print("Invalid card number...")
            return
        pin = int(input("Enter pin: "))
        if cardsWithPin.get(cardNo) != pin:
            print("Invalid pin...")
            return
    except ValueError:
        print("Card Number and Pin should always be INTEGER")
        return
    time.sleep(0.5)
    print("Login Successful...")
    time.sleep(0.4)

    while True:
        print("""Please select any option:
        1). Deposit
        2). Withdraw
        3). Check Balance
        4). Quit
        """)
        operation = int(input("Select option: "))
        match operation:
            case 1:
                print("You selected Money Deposit...")
                deposit(cardNo)
            case 2:
                print("You selected Withdraw...")
                withdraw(cardNo)
            case 3:
                print("You selected Check Balance...")
                checkBalance(cardNo)
            case 4:
                time.sleep(0.3)
                print("Thank you for using the ATM. Goodbye!")
                return
            case _:
                print("Invalid option")
                time.sleep(0.6)

atmSystem()
