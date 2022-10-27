## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  library(mRpostman)
#  
#  # IMAP settings
#  
#  # Outlook - Office 365
#  con <- configure_imap(
#    url="imaps://outlook.office365.com",
#    username="user@your_company.com",
#    password=rstudioapi::askForPassword()
#    )
#  
#  # Gmail
#  con <- configure_imap(
#    url = "imaps://imap.gmail.com",
#    username = "user",
#    password = rstudioapi::askForPassword()
#    )
#  
#  # Hotmail
#  con <- configure_imap(
#    url = "imaps://imap-mail.outlook.com",
#    username = "user@hotmail.com",
#    password = rstudioapi::askForPassword()
#    )
#  
#  # Yahoo Mail
#  con <- configure_imap(
#    url="imaps://imap.mail.yahoo.com/",
#    username="your_user",
#    password=rstudioapi::askForPassword()
#    )
#  
#  # AOL Mail
#  con <- configure_imap(
#    url="imaps://export.imap.aol.com/",
#    username="your_user",
#    password=rstudioapi::askForPassword()
#    )
#  
#  # Yandex Mail
#  con <- configure_imap(
#    url="imaps://imap.yandex.com",
#    username="your_user",
#    password=rstudioapi::askForPassword()
#    )
#  
#  # ... and any other mail provider with IMAP support
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$list_server_capabilities()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$list_mail_folders()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$create_folder(name = "New Folder")

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "INBOX")

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "Inbox")
#  
#  con$examine_folder()
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$examine_folder(name = "Sent")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$select_folder(name = "CRAN Messages")
#  
#  con$rename_folder(new_name = "CRAN")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$rename_folder(name = "Sent", new_name = "Sent2")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$list_flags()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  res <- con$search_before(date_char = "07-Sep-2020")
#  
#  res

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  res <- con$search_before(date_char = "07-Sep-2020",
#                           use_uid = TRUE,
#                           flag = c("ANSWERED", "SEEN"))
#  
#  res

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  res <- con$search_before(date_char = "07-Sep-2020",
#                           use_uid = TRUE,
#                           flag = c("ANSWERED", "SEEN"),
#                           esearch = TRUE)
#  
#  res

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  res <- con$search_before(date_char = "07-Sep-2020",
#                           negate = TRUE,
#                           use_uid = TRUE)
#  
#  res

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  res <- con$search_since(date_char = "07-Sep-2020",
#                          use_uid = TRUE)
#  
#  res

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  res <- con$search_period(since_date_char = "02-Jan-2020",
#                           before_date_char = "30-Jun-2020")
#  
#  res

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  res <- con$search_period(since_date_char = "02-Jan-2020",
#                           before_date_char = "30-Jun-2020",
#                           negate = TRUE)
#  
#  res

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_on(date_char = "02-Jan-2020")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_sent_before(date_char = "07-Sep-2020")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  res <- con$search_sent_before(date_char = "07-Sep-2020",
#                                negate = TRUE,
#                                use_uid = TRUE,
#                                flag = c("ANSWERED", "SEEN"))
#  
#  res
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_sent_since(date_char = "07-Sep-2020")

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_sent_period(since_date_char = "02-Jan-2020",
#                         before_date_char = "30-Jun-2020")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_sent_on(date_char = "30-Jun-2020")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "K-State")
#  
#  con$search_string(expr = "xpto@k-state.com", where = "TO")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$search_string(expr = "xpto@k-state.edu", where = "FROM")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$search_string(expr = "PhD offer", where = "SUBJECT")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  con$search_string(expr = "Dear Allan" where = "TEXT")
#  

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$search_string(expr = "Dear Allan" where = "BODY")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_flag(name = c("ANSWERED", "Seen"), use_uid = TRUE)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_smaller_than(size = 512000) # smaller than 512KB

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_larger_than(size = 512000) # larger than 512KB

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_younger_than(seconds = 3600) # msgs received less than one hour (3600 sec)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_older_than(seconds = 3600) # msgs received more than one hour ago (3600 sec)

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  
#  res <- con$search(request = AND(string(expr = "Kansas State University", where = "SUBJECT"),
#                                  before(date_char = "02-Jan-2020")))
#  
#  res

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$search(request = OR(string(expr = "@k-state.edu", where = "FROM"),
#                          string(expr = "@ksu.edu", where = "FROM")),
#             use_uid = TRUE)
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  # increasing timeout_ms
#  con$reset_timeout_ms(x = 30000) # ... to 30 secs
#  
#  # and supposing that you had verbose = TRUE before
#  con$reset_verbose(x = FALSE)
#  
#  # tidy approach
#  con$search_string(expr = "@k-state.edu", where = "FROM") %>%
#    con$fetch_body(write_to_disk = TRUE, keep_in_mem = FALSE)
#  
#  # ---------------
#  
#  # base R approach
#  res <- con$search_string(expr = "@k-state.edu", where = "FROM")
#  
#  con$fetch_body(msg_id = res, write_to_disk = TRUE, keep_in_mem = FALSE)

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  
#  # tidy approach
#  out <- con$search_since(date_char = "15-Aug-2019", use_uid = TRUE) %>%
#    con$fetch_header(use_uid = TRUE, fields = c("DATE", "SUBJECT"))
#  
#  out
#  
#  # ---------------
#  
#  # base R approach
#  res <- con$search_since(date_char = "15-Aug-2019", use_uid = TRUE)
#  
#  out <- con$fetch_header(use_uid = TRUE, fields = c("DATE", "SUBJECT"))
#  
#  out

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_since(date_char = "15-Aug-2019") %>%
#    con$fetch_text(write_to_disk = TRUE, keep_in_mem = FALSE)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  out <- con$search_on(date_char = "15-Aug-2019", use_uid = TRUE) %>%
#    con$fetch_metadata(use_uid = TRUE, attribute = c("INTERNALDATE", "UID", "ENVELOPE"))

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  # using fetch_body()
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_body(write_to_disk = TRUE) %>%
#    list_attachments() # don't need to specify the connection object here
#  
#  # ------------------
#  
#  # using fetch_text()
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_text(write_to_disk = TRUE) %>%
#    list_attachments() # don't need to specify the connection object here

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  # using fetch_body()
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_body(write_to_disk = TRUE) %>%
#    con$get_attachments()
#  
#  # ------------------
#  
#  # using fetch_text()
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_text(write_to_disk = TRUE) %>%
#    con$get_attachments()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_attachments_list()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_since(date_char = "23-Sep-2019") %>%
#    con$fetch_attachments()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  con$search_since(date_char = "10-may-2019") %>%
#    con$copy_msg(to_folder = "K-State")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$esearch_min_id(flag = c("Answered", "Seen"))

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$esearch_min_id(flag = c("Answered", "Seen"))

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$esearch_count(flag = c("Answered", "Seen"))

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "Trash")
#  
#  con$search_before(date_char = "10-may-2012") %>%
#    con$delete_msg()

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$delete_msg(msg_id = 66128)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  # expunge the entire mail folder
#  con$expunge()
#  
#  # expunge selected msg UID
#  con$delete_msg(msg_id = 71171, use_uid = TRUE) %>%
#    expunge()
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$select_folder(name = "INBOX")
#  
#  con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#    con$add_flags(flags_to_set = "\\Answered", use_uid = TRUE)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#    con$replace_flags(flags_to_set = c("\\Seen", "\\Flagged", use_uid = TRUE)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#    con$remobe_flags(flags_to_unset = c("\\Seen", "\\Flagged", use_uid = TRUE)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$search_on(date_char = "07-Sep-2020") %>%
#    con$move_msg(to_folder = "K-State")
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  
#  con$search_on(date_char = "07-Sep-2020") %>%
#    con$copy_msg(to_folder = "K-State", reselect = FALSE) %>%
#    con$add_flags(flags_to_set = "\\Deleted") %>%
#    con$expunge()
#  

