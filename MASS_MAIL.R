library(blastula)

##Lav en smtp-creds fil, udkommenter når det er gjort fordi du ikke vil gøre det flere gange
create_smtp_creds_file(
  file = "gmail_creds",
  user = "DIN_GMAIL",  # <------ Erstat med din Gmail-adresse
  host = "smtp.gmail.com",
  port = "DIN_PORT" , # <------ tilføj din emailport 
  use_ssl = TRUE
)

#du skal sætte det op med din googleaccount som giver dig et password
#uiqo pulp smak tism# <------ password EKSEMPEL!!!!


list <- read.csv("DIN_PATH")
#eksempel på liste
list <-  c("test1@example.com",
           "test2@example.com",
           "test3@example.com",
           "test4@example.com",
           "test5@example.com",
           "test6@example.com",
           "test7@example.com",
           "test8@example.com",
           "test9@example.com",
           "test10@example.com"
           )

email <- compose_email(
  body = md("
  Dette er en email.
            ")
)
for (i in list) {
  smtp_send(
    email,
    from = "din_email@email.mail",
    to = "din_vens_email@email.mail",
    subject = "DIT_SUBJECT",
    credentials = creds_file("gmail_creds")
  )
  #Sys.sleep(2) # <--------- fjern kommentar for ikke at BANKE løs på mailserveren
}

