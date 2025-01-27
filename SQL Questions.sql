--(1)Hämta alla konton som tillhör specifik kund.
SELECT 
    AccountID, 
    AccountType, 
    Balance, 
    CreationDate
FROM 
    Accounts
WHERE 
    CustomerID = 5; 

--(2)Beräkna det totala saldot på alla konton för en kund.
SELECT 
    SUM(Balance) AS TotalBalance
FROM 
    Accounts
WHERE 
    CustomerID = 1;

--(3)Visa alla transaktioner.
SELECT 
    TransferID, 
    TransferDate, 
    TransferType, 
    Amount, 
    Description
FROM 
    Transfers
WHERE 
    AccountID = 7;

--(4)Hitta de tre konton med högst saldo.
SELECT TOP 3 
    AccountID, 
    AccountType, 
    Balance
FROM 
    Accounts
ORDER BY 
    Balance DESC;

--(5)Beräkna det totala beloppet av insättningar och uttag för ett specifikt konto.
SELECT 
    SUM(CASE 
        WHEN TransferType = 'Deposit' THEN Amount
        WHEN TransferType = 'Withdrawal' THEN -Amount
        ELSE 0
    END) AS TotalAmount
FROM 
    Transfers
WHERE 
    AccountID = 9;

--(6)Hitta alla transaktioner som gjorts de senaste 30 dagarna.
SELECT 
    TransferID, 
    AccountID, 
    TransferDate, 
    TransferType, 
    Amount, 
    Description
FROM 
    Transfers
WHERE 
    TransferDate >= DATEADD(DAY, -30, GETDATE());


