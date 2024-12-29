public class BankAccount {

    // Constants
    public static final String BANK_NAME = "Global Bank";
    public static final double MINIMUM_BALANCE = 100.0;

    // Instance Variables
    private String accountNumber;
    private String accountHolder;
    private double balance;

    // Constructor
    public BankAccount(String accountNumber, String accountHolder, double initialBalance) {
        this.accountNumber = accountNumber;
        this.accountHolder = accountHolder;
        if (initialBalance < MINIMUM_BALANCE) {
            System.out.println("Initial balance must be at least " + MINIMUM_BALANCE);
            this.balance = MINIMUM_BALANCE;
        } else {
            this.balance = initialBalance;
        }
    }

    // Getter for accountNumber
    public String getAccountNumber() {
        return accountNumber;
    }

    // Getter for accountHolder
    public String getAccountHolder() {
        return accountHolder;
    }

    // Getter for balance
    public double getBalance() {
        return balance;
    }

    // Method to deposit money
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Successfully deposited: " + amount);
        } else {
            System.out.println("Deposit amount must be positive.");
            getBalance
              
        }
    }

    // Method to withdraw money
    public void withdraw(double amount) {
        if (amount > 0 && balance - amount >= MINIMUM_BALANCE) {
            balance -= amount;
            System.out.println("Successfully withdrew: " + amount);
        } else {
            System.out.println("Insufficient funds or amount exceeds minimum balance.");
        }
    }

    // Method to display account information
    public void displayAccountInfo() {
        System.out.println("Account Holder: " + accountHolder);
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Balance: $" + balance);
    }

    // Main method for testing
    public static void main(String[] args) {
        // Create a BankAccount object
        BankAccount account = new BankAccount("123456789", "John Doe", 500.0);

        // Display initial account information
        account.displayAccountInfo();

        // Perform some transactions
        account.deposit(200.0);
        account.withdraw(150.0);

        // Display updated account information
        account.displayAccountInfo();
    }
}

