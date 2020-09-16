## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  library(mRpostman)
#  
#  # Outlook - Office 365
#  imapconf <- configure_imap(url="imaps://outlook.office365.com",
#                             username="your_user@company.com",
#                             password=rstudioapi::askForPassword())
#  
#  # other mail providers that were tested: Gmail (imaps://imap.gmail.com),
#  #   Hotmail ("imaps://imap-mail.outlook.com"), Yahoo (imaps://imap.mail.yahoo.com/),
#  #   AOL (imaps://export.imap.aol.com/), Yandex (imaps://imap.yandex.com)
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  library(mRpostman)
#  
#  # Outlook - Office 365
#  con <- configure_imap(url="imaps://outlook.office365.com",
#                        username="your_user@company.com",
#                        password=rstudioapi::askForPassword())
#  
#  # alternative
#  con <- ImapCon$new(url="imaps://outlook.office365.com",
#                     username="your_user@company.com",
#                     password=rstudioapi::askForPassword())
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  imapconf %>%
#    list_server_capabilities()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$list_server_capabilities()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  # Listing
#  imapconf %>%
#    list_mailboxes()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  # Listing
#  con$list_folders()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") # only INBOX is case sensitive

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "INBOX")

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    examine_mailbox()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  con$examine_folder()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "CRAN messages") %>%
#    rename_mailbox(new_name = "CRAN messages2") %>%
#    list_mailboxes() # and list again to check
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "CRAN messages")
#  
#  con$rename_folder(new_name = "CRAN messages2")
#  
#  con$list_mail_folders() # and list again to check

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  result <- imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    search_before(date_char = "02-May-2019",
#                  by = "UID",
#                  flag = "UNANSWERED")
#  
#  result$msg_id
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  result <- con$search_before(date_char = "02-May-2019",
#                              use_uid = TRUE,
#                              flag = "UNANSWERED")
#  
#  result
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    search_before(date_char = "02-May-2019",
#                  negate = TRUE,
#                  by = "UID",
#                  flag = "UNANSWERED",
#                  esearch = TRUE)
#  
#  results$msg_id
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  result <- con$search_before(date_char = "02-May-2019",
#                              use_uid = TRUE,
#                              flag = "UNANSWERED",
#                              negate = TRUE)
#  
#  result
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_string(section_or_field = "FROM", string = "hadley@rstudio.com",
#                  negate = TRUE) # not FROM "hadley@rstudio.com"
#  
#  results$msg_id
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  result <- con$search_string(expr = "hadley@rstudio.com",
#                              where = "FROM",
#                              negate = TRUE) # not FROM "hadley@rstudio.com"
#  
#  result
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    search_string(section_or_field = "TEXT", string = "Dear Allan")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  result <- con$search_string(expr = "Dear Allan", where = "TEXT")
#  
#  result
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_flag(flag = "RECENT", by = "UID")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  result <- con$search_flag(expr = "RECENT", use_uid = TRUE)
#  
#  result
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    custom_search(custom_request =
#                   AND(
#                     string(section_or_field = "FROM", string = "@toronto"),
#                     before(date_char = "12-Apr-2019")
#                     )
#                 )
#  
#  results$msg_id
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  result <- con$search(custom_request =
#                         AND(
#                           string(expr = "@toronto", where = "FROM"),
#                           before(date_char = "12-Apr-2019")
#                           )
#                       )
#  result
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    search_before(date_char = "10-Mar-2019", by = "UID") %$% #exposition pipe operator
#    fetch_full_msg(imapconf = imapconf, msg_id = msg_id,
#                   by="UID", write_to_disk = TRUE, keep_in_mem = TRUE,
#                   partial = "0.789")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  results <- con$search_before(date_char = "10-Mar-2019", use_uid = TRUE) %>% #regular pipe
#    con$fetch_body(use_uid = TRUE, write_to_disk = TRUE,
#                   keep_in_mem = TRUE, partial = "0.789")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "K-State") %>%
#    search_since(date_char = "15-Aug-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_header(imapconf = imapconf,
#                     msg_id = msg_id,
#                     fields = c("DATE", "SUBJECT"),
#                     by = "UID")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "K-State")
#  
#  results <- con$search_since(date_char = "15-Aug-2019", use_uid = TRUE) %>% #regular pipe
#    con$fetch_header(use_uid = TRUE, fields = c("DATE", "SUBJECT"))
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "17-Aug-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_text(imapconf = imapconf, msg_id = msg_id, by = "UID", try_b64decode = TRUE)
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  results <- con$search_since(date_char = "17-Aug-2019", use_uid = TRUE) %>% #regular pipe
#    con$fetch_text(use_uid = TRUE, base64_decode = TRUE))
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_on(date_char = "10-May-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_metadata(imapconf, msg_id = msg_id, by = "UID",
#                       metadata = c("INTERNALDATE", "UID", "ENVELOPE"))
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  results <- con$search_since(date_char = "10-May-2019", use_uid = TRUE) %>% #regular pipe
#    con$fetch_text(use_uid = TRUE, metadata = c("INTERNALDATE", "UID", "ENVELOPE"))
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_on(date_char = "23-Sep-2019") %$%
#    fetch_full_msg(imapconf, msg_id=msg_id) %>%
#    list_attachments()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  results <- con$search_on(date_char = "23-Sep-2019") %>% #regular pipe
#    con$fetch_body() %>% # or fetch_text()
#    list_attachments()
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$search_on(date_char = "23-Sep-2019") %>% #regular pipe
#    con$fetch_attachments_list()
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_on(date_char = "23-Sep-2019") %$%
#    fetch_full_msg(imapconf, msg_id=msg_id) %>%
#    get_attachments()
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  results <- con$search_on(date_char = "23-Sep-2019") %>% #regular pipe
#    con$fetch_body() %>% # or fetch_text()
#    get_attachments()
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$search_on(date_char = "23-Sep-2019") %>% #regular pipe
#    con$fetch_attachments()
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_since(date_char = "10-May-2019") %$% #exposition pipe operator
#    copy_msg(imapconf = imapconf, msg_id = msg_id, to_mbox = "INBOX")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "CRAN messages2")
#  
#  results <- con$search_since(date_char = "10-May-2019") %>%
#    con$copy_msg(to_folder = "INBOX", reselect = FALSE)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Sent") %>%
#    search_before(date_char = "10-may-2012") %$% #exposition pipe operator
#    move_msg(imapconf = imapconf, msg_id = msg_id, to_mbox = "CRAN messages2")
#  
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "[Gmail]/Sent")
#  
#  con$search_before(date_char = "10-May-2012") %>%
#    con$move_msg(to_folder = "CRAN messages2", reselect = FALSE)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[GMail]/Trash") %>%
#    get_min_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "[GMail]/Trash")
#  
#  con$esearch_min_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    get_max_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "[GMail]/Trash")
#  
#  con$esearch_max_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    delete_msg(msg_id = 66128)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$delete_msg(msg_id = 66128)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    delete_msg(msg_id = 71772, by = "UID") %$%
#    expunge(imapconf = imapconf, specific_UID = msg_id)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "[GMail]/Trash")
#  
#  con$delete_msg(msg_id = 71772, use_uid = TRUE) %>%
#    con$expunge() # expunge the specific UID
#  
#  # or, if the user wants to expunge the entire mail folder:
#  con$expunge()
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "18-Aug-2020", by = "UID") %$% #exposition pipe operator
#    add_flags(imapconf = imapconf, msg_id = msg_id, flags_to_set = "\\Seen")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$search_since(date_char = "18-Aug-2020", use_uid = TRUE) %>%
#    con$add_flags(use_uid = TRUE, flags_to_set = "\\Seen") # system flags need the "\\" prefix
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "18-Aug-2020", by = "UID") %$% #exposition pipe operator
#    remove_flags(imapconf = imapconf, msg_id = msg_id, flags_to_unset = "\\Seen")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$search_since(date_char = "18-Aug-2020", use_uid = TRUE) %>%
#    con$remove_flags(use_uid = TRUE, flags_to_unset = "\\Seen") # system flags need the "\\" prefix
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "18-Aug-2020", by = "UID") %$% #exposition pipe operator
#    replace_flags(imapconf = imapconf, msg_id = msg_id, flags_to_set = "\\Seen")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$select_folder(name = "INBOX")
#  
#  con$search_since(date_char = "18-Aug-2020", use_uid = TRUE) %>%
#    con$replace_flags(use_uid = TRUE, flags_to_set = "\\Seen") # system flags need the "\\" prefix
#  

