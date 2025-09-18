# Simple ATM System

# Starting balance
balance = 1000.0

def display_menu():
    print("\n==== ATM MENU ====")
    print("1. Check Balance")
    print("2. Deposit Money")
    print("3. Withdraw Money")
    print("4. Exit")

def check_balance():
    print(f"\nYour current balance is: ${balance:.2f}")

def deposit():
    global balance
    try:
        amount = float(input("Enter amount to deposit: $"))
        if amount <= 0:
            print("⚠️  Deposit amount must be greater than 0.")
        else:
            balance += amount
            print(f"✅ ${amount:.2f} deposited successfully.")
            check_balance()
    except ValueError:
        print("❌ Invalid input. Please enter a valid number.")

def withdraw():
    global balance
    try:
        amount = float(input("Enter amount to withdraw: $"))
        if amount <= 0:
            print("⚠️  Withdrawal amount must be greater than 0.")
        elif amount > balance:
            print("❌ Insufficient funds.")
        else:
            balance -= amount
            print(f"✅ ${amount:.2f} withdrawn successfully.")
            check_balance()
    except ValueError:
        print("❌ Invalid input. Please enter a valid number.")

# Main loop
while True:
    display_menu()
    choice = input("Choose an option (1-4): ")

    if choice == '1':
        check_balance()
    elif choice == '2':
        deposit()
    elif choice == '3':
        withdraw()
    elif choice == '4':
        print("👋 Thank you for using our ATM. Goodbye!")
        break
    else:
        print("❌ Invalid selection. Please choose between 1 and 4.")

