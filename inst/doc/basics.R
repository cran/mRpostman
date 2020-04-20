## ---- message = FALSE, eval=FALSE----------------------------------------
#  
#  library(mRpostman)
#  
#  # IMAP settings
#  # Gmail
#  imapconf <- configure_imap(url="imaps://imap.gmail.com",
#                             username="your_user",
#                             password=rstudioapi::askForPassword()
#                            )
#  
#  # Yahoo Mail
#  # imapconf <- configure_imap(url="imaps://imap.mail.yahoo.com/",
#  #                           username="your_user",
#  #                           password=rstudioapi::askForPassword()
#  #                           )
#  
#  # AOL Mail
#  # imapconf <- configure_imap(url="imaps://export.imap.aol.com/",
#  #                           username="your_user",
#  #                           password=rstudioapi::askForPassword()
#  #                           )
#  
#  # Yandex Mail
#  # imapconf <- configure_imap(url="imaps://imap.yandex.com",
#  #                           username="your_user",
#  #                           password=rstudioapi::askForPassword()
#  #                           )
#  
#  # Outlook - Office 365
#  # imapconf <- configure_imap(url="imaps://outlook.office365.com",
#  #                            username="your_user",
#  #                            password=rstudioapi::askForPassword()
#  #                           )
#  
#  # you can try another IMAP server and see if it works
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  # Listing
#  imapconf %>%
#    list_mailboxes()

## ---- message = FALSE, eval = FALSE--------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") # be careful - case sensitive

## ---- message = FALSE, eval=FALSE----------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>% # be careful - case sensitive
#    examine_mailbox()

## ---- message = FALSE, eval=FALSE----------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "CRAN messages") %>% # be careful - case sensitive
#    rename_mailbox(new_name = "CRAN messages2") %>%
#    list_mailboxes() # and list again to check
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  imapconf %>%
#    list_server_capabilities()

## ---- message = FALSE, eval=FALSE----------------------------------------
#  flag_options()

## ---- message = FALSE, eval=FALSE----------------------------------------
#  section_or_field_options()

## ---- message = FALSE, eval=FALSE----------------------------------------
#  metadata_options()

## ---- message = FALSE, eval=FALSE----------------------------------------
#  result <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_before(date_char = "17-Apr-2019", esearch = TRUE)
#  
#  result$msg_id
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  result <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_before(date_char = "02-May-2019",
#                  by = "UID",
#                  flag = "UNANSWERED",
#                  esearch = TRUE)
#  
#  result$msg_id

## ---- message = FALSE, eval=FALSE----------------------------------------
#  result <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_before(date_char = "02-May-2019",
#                  by = "UID",
#                  flag = "UNANSWERED",
#                  esearch = TRUE, return_imapconf = FALSE)
#  
#  result

## ---- message = FALSE, eval=FALSE----------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_before(date_char = "02-May-2019",
#                  negate = TRUE,
#                  by = "UID",
#                  flag = "UNANSWERED",
#                  esearch = TRUE)
#  
#  results$msg_id
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_since(date_char = "17-Apr-2019",
#                 esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_period(since_date_char = "02-Jan-2019",
#                  before_date_char = "30-Jun-2019",
#                  flag = "ANSWERED",
#                  esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_period(since_date_char = "17-Jun-2019",
#                  before_date_char = "30-Jun-2019",
#                  negate = TRUE,
#                  flag = "ANSWERED",
#                  esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_on(date_char = "30-Apr-2019",
#              flag = "SEEN",
#              esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_sent_before(date_char = "17-Apr-2019")
#  
#  results$msg_id
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_sent_before(date_char = "02-Jan-2019",
#                       by = "UID",
#                       flag = "UNANSWERED",
#                       esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_sent_before(date_char = "02-May-2019",
#                       negate = TRUE,
#                       by = "UID",
#                       flag = "UNANSWERED",
#                       esearch = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_sent_since(date_char = "17-Apr-2019")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_sent_period(since_date_char = "17-Jun-2019",
#                       before_date_char = "30-Jun-2019",
#                       flag = "ANSWERED")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_sent_period(since_date_char = "17-Jun-2019",
#                       before_date_char = "30-Jun-2019",
#                       negate = TRUE,
#                       flag = "ANSWERED")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_sent_on(date_char = "30-Apr-2019",
#                   flag = "SEEN",
#                   esearch = TRUE)
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_string(section_or_field = "TO", string = "hadley@rstudio.com",
#                  negate = TRUE) # not TO "hadley@rstudio.com"
#  
#  results$msg_id
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_string(section_or_field = "TEXT", string = "Dear Allan")
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  results <- imapconf %>%
#  select_mailbox(mbox = "Kansas State University") %>%
#    search_string(section_or_field = "BODY", string = "Dear Allan")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_flag(flag = "RECENT", by = "UID")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_smaller_than(size = 512000) # smaller than 512KB
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_larger_than(size = 512000, esearch = TRUE) # Larger than 512KB
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_younger_than(seconds = 3600) # msgs received in less than one hour (3600 sec)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_older_than(seconds = 3600) # msgs received in not less than one hour (3600 sec)
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    custom_search(custom_request =
#                   AND(
#                     string(section_or_field = "FROM", string = "Toronto"),
#                     before(date_char = "12-Apr-2019")
#                     )
#                 )
#  
#  results$msg_id
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    custom_search(custom_request =
#                   OR(
#                     string(section_or_field = "TEXT", string = "Contract 2872827"),
#                     string(section_or_field = "Subject", string = "Buying operation")
#                     )
#                 )
#  
#  results$msg_id
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_before(date_char = "10-Mar-2019", by = "UID") %$% #exposition pipe operator
#    fetch_full_msg(imapconf = imapconf, msg_id = msg_id,
#                   by="UID", write_to_file = TRUE, keep_in_mem = TRUE,
#                   partial = "0.789")
#  

## ---- message = FALSE, eval=FALSE----------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "Kansas State University") %>%
#    search_since(date_char = "15-Aug-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_header(imapconf = imapconf,
#                     msg_id = msg_id,
#                     fields = c("DATE", "SUBJECT"),
#                     by = "UID")
#  
#  results
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "17-Aug-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_text(imapconf = imapconf, msg_id = msg_id, by = "UID", try_b64decode = TRUE)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_on(date_char = "10-may-2019", by = "UID") %$% #exposition pipe operator
#    fetch_msg_metadata(imapconf, msg_id = msg_id, by = "UID",
#                       metadata = c("INTERNALDATE", "UID", "ENVELOPE"))
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "23-Sep-2019") %$%
#    fetch_full_msg(imapconf, msg_id=msg_id, write_to_disk = TRUE) %>%
#    list_attachments()

## ---- message = FALSE, eval = FALSE--------------------------------------
#  imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "23-Sep-2019") %$%
#    fetch_full_msg(imapconf, msg_id=msg_id, write_to_disk = TRUE) %>%
#    get_attachments()

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>%
#    search_since(date_char = "10-may-2019") %$% #exposition pipe operator
#    copy_msg(imapconf = imapconf, msg_id = msg_id, to_mbox = "INBOX")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    get_min_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    get_max_id(flag = "UNSEEN")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    search_before(date_char = "10-may-2012", by = "UID") %$% #exposition pipe operator
#    delete_msg(imapconf = imapconf, msg_id = msg_id)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    delete_msg(msg_id = 66128)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Trash") %>%
#    delete_msg(msg_id = 71171, by = "UID") %$%
#    expunge(imapconf = imapconf, specific_UID = msg_id)
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "18-Aug-2019", by = "UID") %$% #exposition pipe operator
#    add_flags(imapconf = imapconf, msg_id = msg_id, flags_to_set = "RECENT")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_since(date_char = "18-Aug-2019", by = "UID") %$% #exposition pipe operator
#    remove_flags(imapconf = imapconf, msg_id = msg_id, flags_to_unset = "RECENT")
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  results <- imapconf %>%
#    select_mailbox(mbox = "INBOX") %>%
#    search_before(date_char = "10-may-2012", by = "UID") %$% #exposition pipe operator
#    replace_flags(imapconf = imapconf, msg_id = msg_id,
#                 flags_to_set = flags_to_set = c("SEEN", "DRAFT"))
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  
#  # copy search results from "Sent" to "INBOX"
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Sent Mail") %>%
#    search_before(date_char = "10-may-2012") %$% #exposition pipe operator
#    move_msg(imapconf = imapconf, msg_id = msg_id, to_mbox = "CRAN messages2")
#  
#  

## ---- message = FALSE, eval = FALSE--------------------------------------
#  results <- imapconf %>%
#    select_mailbox(mbox = "[Gmail]/Sent Mail") %>%
#    search_before(date_char = "10-may-2012") %$% #exposition pipe operator
#    copy_msg(imapconf = imapconf, msg_id = msg_id, to_mbox = "CRAN messages2") %$%
#    add_flags(imapconf = imapconf, msg_id = msg_id, flags_to_set = "Deleted") %$%
#    expunge()
#  

## ---- message = FALSE, echo = FALSE, results = 'hide', eval=FALSE--------
#  # returning mbox name to original
#  
#  imapconf %>%
#    select_mailbox(mbox = "CRAN messages2") %>% # be careful - case sensitive
#    rename_mailbox(new_name = "CRAN messages")
#  

