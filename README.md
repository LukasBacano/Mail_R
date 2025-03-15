# Automated Email Sender using Blastula

## Overview
This script automates sending emails using the **blastula** package in R. It reads a list of email recipients and sends a predefined message using Gmail's SMTP server.

## Features
- Sends emails via Gmail's SMTP.
- Allows batch sending to multiple recipients.
- Uses secure credentials stored in an encrypted file.
- Includes optional delays between emails to avoid server rate limits.

## Setup Instructions

### **1. Install Required Package**
Before running the script, ensure you have the **blastula** package installed:
```r
install.packages("blastula")
```

### **2. Configure SMTP Credentials**
You must set up Gmail SMTP credentials to allow the script to send emails. Use the following command **once** to create an encrypted credentials file:
```r
library(blastula)

create_smtp_creds_file(
  file = "gmail_creds",
  user = "YOUR_GMAIL",   # Replace with your Gmail address
  host = "smtp.gmail.com",
  port = YOUR_PORT,       # Replace with the correct email port (465 or 587)
  use_ssl = TRUE
)
```
> 🚨 **Important:** After running this, **comment out or remove this part** of the script so you don't overwrite the credentials each time you run it.

### **3. Allow Less Secure Apps (Optional)**
Google requires **App Passwords** or OAuth authentication to send emails via SMTP. To set this up, go to your [Google Account Security settings](https://myaccount.google.com/security), enable 2-Step Verification, and then generate an **App Password** under the 'Signing in to Google' section. Use this generated password instead of your regular Gmail password when setting up SMTP credentials.

### **4. Prepare Email List**
The script loads a list of recipients from a CSV file:
```r
list <- read.csv("YOUR_FILE_PATH")
```
Alternatively, you can manually define a test list:
```r
list <- c("test1@example.com", "test2@example.com", "test3@example.com")
```

### **5. Send Emails**
The script composes and sends an email to each recipient in the list:
```r
email <- compose_email(
  body = md("Dette er en email.")
)

for (i in list) {
  smtp_send(
    email,
    from = "your_email@gmail.com",
    to = i,
    subject = "Your_subject",
    credentials = creds_file("gmail_creds")
  )
  #Sys.sleep(2) # Uncomment to prevent server overload
}
```

### **6. ENJOY***


## **Troubleshooting**
- If emails **fail to send**, verify that your SMTP credentials are correct and that you've enabled app passwords in Google.
- If **emails are blocked**, check your Gmail security settings.
- Use `Sys.sleep(2)` between emails to avoid triggering spam filters.

## **Security Notice**
🚨 **Never store your password directly in the script!** Use the `create_smtp_creds_file()` method to store credentials securely.

---
🚀 **Now you're ready to send bulk emails with R!** ✉️

