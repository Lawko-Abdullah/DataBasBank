

CREATE TABLE Client (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(150) NOT NULL,
    EmailAddress VARCHAR(150) NOT NULL UNIQUE,
    ContactNumber VARCHAR(20),
    HomeAddress TEXT,
    BirthDate DATE
);

CREATE TABLE BankAccount (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountCategory VARCHAR(50) NOT NULL,
    CurrentBalance DECIMAL(18, 2) DEFAULT 0.00,
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE BankTransaction (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionKind VARCHAR(50) NOT NULL,
    TransactionAmount DECIMAL(18, 2) NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    SourceAccountID INT,
    TargetAccountID INT,
    FOREIGN KEY (SourceAccountID) REFERENCES BankAccount(AccountID),
    FOREIGN KEY (TargetAccountID) REFERENCES BankAccount(AccountID)
);


INSERT INTO Client (FullName, EmailAddress, ContactNumber, HomeAddress, BirthDate) VALUES
('Alice Andersson', 'alice.andersson@example.com', '+46123456789', 'Storgatan 1, Stockholm', '1985-03-12'),
('Bob Berg', 'bob.berg@example.com', '+46123456788', 'Lillgatan 2, Malmö', '1990-07-25'),
('Charlie Carlsson', 'charlie.carlsson@example.com', '+46123456787', 'Södra Vägen 3, Göteborg', '1975-09-05');

INSERT INTO BankAccount (AccountCategory, CurrentBalance, ClientID) VALUES
('Savings', 5000.00, 1),
('Checking', 1500.00, 1),
('Savings', 7500.00, 2),
('Checking', 2500.00, 2),
('Savings', 10000.00, 3);

INSERT INTO BankTransaction (TransactionKind, TransactionAmount, SourceAccountID, TargetAccountID) VALUES
('Deposit', 2000.00, NULL, 1),
('Withdrawal', 500.00, 1, NULL),
('Transfer', 1000.00, 1, 2),
('Transfer', 1500.00, 3, 4),
('Deposit', 3000.00, NULL, 5);
