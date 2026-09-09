## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# library(mRpostman)
# 
# # IMAP settings
# 
# # Outlook - Office 365
# con <- configure_imap(
#   url="imaps://outlook.office365.com",
#   username="user@your_company.com",
#   password=rstudioapi::askForPassword()
#   )
# 
# # Gmail
# con <- configure_imap(
#   url = "imaps://imap.gmail.com",
#   username = "user",
#   password = rstudioapi::askForPassword()
#   )
# 
# # Hotmail
# con <- configure_imap(
#   url = "imaps://imap-mail.outlook.com",
#   username = "user@hotmail.com",
#   password = rstudioapi::askForPassword()
#   )
# 
# # Yahoo Mail
# con <- configure_imap(
#   url="imaps://imap.mail.yahoo.com/",
#   username="your_user",
#   password=rstudioapi::askForPassword()
#   )
# 
# # AOL Mail
# con <- configure_imap(
#   url="imaps://export.imap.aol.com/",
#   username="your_user",
#   password=rstudioapi::askForPassword()
#   )
# 
# # Yandex Mail
# con <- configure_imap(
#   url="imaps://imap.yandex.com",
#   username="your_user",
#   password=rstudioapi::askForPassword()
#   )
# 
# # ... and any other mail provider with IMAP support
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$list_server_capabilities()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$list_mail_folders()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$create_folder(folder = "New Folder")

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "INBOX")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$select_folder(folder = "Inbox")
# 
# con$examine_folder()
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$examine_folder(folder = "Sent")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$select_folder(folder = "CRAN Messages")
# 
# con$rename_folder(new_name = "CRAN")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$rename_folder(folder = "Sent", new_name = "Sent2")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$list_flags()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$delete_folder(folder = "Old Folder")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$subscribe_folder(folder = "INBOX")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$unsubscribe_folder(folder = "INBOX")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$list_subscribed_folders()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$status(folder = "INBOX")
# 
# # or only some items, for the currently selected folder:
# con$select_folder("INBOX")
# con$status(items = c("MESSAGES", "UNSEEN"))

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$list_special_use_folders()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$namespace()

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$get_quota_root(name = "INBOX")
# 
# # or, for a known quota root:
# con$get_quota(quota_root = "")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$select_folder("INBOX")
# 
# con$close_folder()      # closes and expunges \Deleted
# # or:
# con$unselect_folder()   # closes without expunging

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$id()
# 
# # optionally disclosing the client id:
# con$id(fields = c(name = "mRpostman", version = "1.2.1"))

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# res <- con$search_before(date_char = "07-Sep-2020")
# 
# res

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# res <- con$search_before(date_char = "07-Sep-2020",
#                          use_uid = TRUE,
#                          flag = c("ANSWERED", "SEEN"))
# 
# res

## ----message = FALSE, eval=FALSE----------------------------------------------
# res <- con$search_before(date_char = "07-Sep-2020",
#                          use_uid = TRUE,
#                          flag = c("ANSWERED", "SEEN"),
#                          esearch = TRUE)
# 
# res

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# res <- con$search_before(date_char = "07-Sep-2020",
#                          negate = TRUE,
#                          use_uid = TRUE)
# 
# res

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# res <- con$search_since(date_char = "07-Sep-2020",
#                         use_uid = TRUE)
# 
# res

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# res <- con$search_period(since_date_char = "02-Jan-2020",
#                          before_date_char = "30-Jun-2020")
# 
# res

## ----message = FALSE, eval = FALSE--------------------------------------------
# res <- con$search_period(since_date_char = "02-Jan-2020",
#                          before_date_char = "30-Jun-2020",
#                          negate = TRUE)
# 
# res

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_on(date_char = "02-Jan-2020")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_sent_before(date_char = "07-Sep-2020")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# res <- con$search_sent_before(date_char = "07-Sep-2020",
#                               negate = TRUE,
#                               use_uid = TRUE,
#                               flag = c("ANSWERED", "SEEN"))
# 
# res
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_sent_since(date_char = "07-Sep-2020")

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_sent_period(since_date_char = "02-Jan-2020",
#                        before_date_char = "30-Jun-2020")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_sent_on(date_char = "30-Jun-2020")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$select_folder(folder = "K-State")
# 
# con$search_string(expr = "xpto@k-state.com", where = "TO")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$search_string(expr = "xpto@k-state.edu", where = "FROM")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$search_string(expr = "PhD offer", where = "SUBJECT")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# con$search_string(expr = "Dear Allan" where = "TEXT")
# 

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$search_string(expr = "Dear Allan" where = "BODY")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_flag(name = c("ANSWERED", "Seen"), use_uid = TRUE)

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_smaller_than(size = 512000) # smaller than 512KB

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_larger_than(size = 512000) # larger than 512KB

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_younger_than(seconds = 3600) # msgs received less than one hour (3600 sec)

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_older_than(seconds = 3600) # msgs received more than one hour ago (3600 sec)

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# # most recent first:
# con$sort(by = "DATE", reverse = TRUE)
# 
# # sort a restricted set (search criteria) by sender:
# con$sort(by = "FROM", criteria = "SINCE 01-Jan-2020")

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# con$thread(algorithm = "REFERENCES")

## ----message = FALSE, eval=FALSE----------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# 
# res <- con$search(request = AND(string(expr = "Kansas State University", where = "SUBJECT"),
#                                 before(date_char = "02-Jan-2020")))
# 
# res

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# con$search(request = OR(string(expr = "@k-state.edu", where = "FROM"),
#                         string(expr = "@ksu.edu", where = "FROM")),
#            use_uid = TRUE)
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# # increasing timeout_ms
# con$reset_timeout_ms(x = 30000) # ... to 30 secs
# 
# # and supposing that you had verbose = TRUE before
# con$reset_verbose(x = FALSE)
# 
# # tidy approach
# con$search_string(expr = "@k-state.edu", where = "FROM") %>%
#   con$fetch_body(write_to_disk = TRUE, keep_in_mem = FALSE)
# 
# # ---------------
# 
# # base R approach
# res <- con$search_string(expr = "@k-state.edu", where = "FROM")
# 
# con$fetch_body(msg_id = res, write_to_disk = TRUE, keep_in_mem = FALSE)

## ----message = FALSE, eval=FALSE----------------------------------------------
# 
# # tidy approach
# out <- con$search_since(date_char = "15-Aug-2019", use_uid = TRUE) %>%
#   con$fetch_header(use_uid = TRUE, fields = c("DATE", "SUBJECT"))
# 
# out
# 
# # ---------------
# 
# # base R approach
# res <- con$search_since(date_char = "15-Aug-2019", use_uid = TRUE)
# 
# out <- con$fetch_header(use_uid = TRUE, fields = c("DATE", "SUBJECT"))
# 
# out

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_since(date_char = "15-Aug-2019") %>%
#   con$fetch_text(write_to_disk = TRUE, keep_in_mem = FALSE)

## ----message = FALSE, eval = FALSE--------------------------------------------
# out <- con$search_on(date_char = "15-Aug-2019", use_uid = TRUE) %>%
#   con$fetch_metadata(use_uid = TRUE, attribute = c("INTERNALDATE", "UID", "ENVELOPE"))

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$attachments_manifest(con$query(size > 1e6))

## ----message = FALSE, eval = FALSE--------------------------------------------
# manifest <- con$query(subject == "report" & flag != "SEEN") %>%
#   con$attachments(dest = "~/attachments")
# manifest # one row per file: id, part, filename, type, size, path

## ----message = FALSE, eval = FALSE--------------------------------------------
# out <- con$query(size > 1e6) %>% con$fetch_body()
# extract_attachments(out)                        # report only
# extract_attachments(out, dest = "~/attachments")  # write the files

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# con$search_since(date_char = "10-may-2019") %>%
#   con$copy_msg(folder = "K-State")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$esearch_min_id(flag = c("Answered", "Seen"))

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$esearch_min_id(flag = c("Answered", "Seen"))

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$esearch_count(flag = c("Answered", "Seen"))

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "Trash")
# 
# con$search_before(date_char = "10-may-2012") %>%
#   con$delete_msg()

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$delete_msg(msg_id = 66128)

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# # expunge the entire mail folder
# con$expunge()
# 
# # expunge selected msg UID
# con$delete_msg(msg_id = 71171, use_uid = TRUE) %>%
#   expunge()
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$select_folder(folder = "INBOX")
# 
# con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#   con$add_flags(flags_to_set = "\\Answered", use_uid = TRUE)

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#   con$replace_flags(flags_to_set = c("\\Seen", "\\Flagged", use_uid = TRUE)

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$search_since(date_char = "01-Sep-2020", use_uid = TRUE) %>%
#   con$remobe_flags(flags_to_unset = c("\\Seen", "\\Flagged", use_uid = TRUE)

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# con$search_on(date_char = "07-Sep-2020") %>%
#   con$move_msg(folder = "K-State")
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# con$search_on(date_char = "07-Sep-2020") %>%
#   con$copy_msg(folder = "K-State", reselect = FALSE) %>%
#   con$add_flags(flags_to_set = "\\Deleted") %>%
#   con$expunge()
# 

## ----message = FALSE, eval = FALSE--------------------------------------------
# con$noop()

## ----message = FALSE, eval = FALSE--------------------------------------------
# 
# msg <- paste("From: me@example.com",
#              "To: you@example.com",
#              "Subject: Hi",
#              "",
#              "Message body.",
#              sep = "\r\n")
# 
# con$append_msg(message = msg, folder = "Drafts")
# 

## ----eval = FALSE-------------------------------------------------------------
# con$query((subject == "budget" | "budget 3") & flag != "SEEN")
# con$query(sent >= "2001-10-01" & sent < "2002-01-01" & size > 5e6, use_uid = TRUE)
# con$query(subject %in% c("budget", "forecast") & age < 7 * 86400)

## ----eval = FALSE-------------------------------------------------------------
# uid <- con$append_msg(message = msg, folder = "Drafts", flags = "Draft")
# ids <- con$copy_msg(msg_id = c(12, 15), use_uid = TRUE, folder = "Archive",
#                     reselect = FALSE)
# attr(ids, "copyuid")

## ----eval = FALSE-------------------------------------------------------------
# con$list_folders_status(items = c("MESSAGES", "UNSEEN", "SIZE"))
# con$list_mail_folders(detailed = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# con$search(request = AND(flag("UNSEEN"), sent_since(date_char = "01-Jan-2026")),
#            save = TRUE)
# previews <- con$fetch_preview(msg_id = "$")   # PREVIEW, RFC 8970
# con$add_flags(msg_id = "$", flags_to_set = "\\Seen")

## ----eval = FALSE-------------------------------------------------------------
# last <- con$status(items = "HIGHESTMODSEQ")[["HIGHESTMODSEQ"]]
# # ... in a later session:
# changed <- con$search(request = modseq(last + 1))

## ----eval = FALSE-------------------------------------------------------------
# con$sort(by = "SIZE", reverse = TRUE, return = c("COUNT", "MAX"))

## ----eval = FALSE-------------------------------------------------------------
# con$my_rights(folder = "INBOX")
# con$set_acl(name = "Shared", identifier = "user=bob", rights = "lrs")
# con$get_acl(folder = "Shared")

## ----eval = FALSE-------------------------------------------------------------
# con$select_folder("INBOX")
# ev <- con$idle(timeout = 600, callback = function(ev) !any(ev$type == "EXISTS"))
# if (any(ev$type == "EXISTS")) {
#   con$fetch_envelope(msg_id = max(ev$id[ev$type == "EXISTS"]))
# }

## ----eval = FALSE-------------------------------------------------------------
# msgs <- vapply(1:3, function(i) paste0("Subject: m", i, "\r\n\r\nbody ", i, "\r\n"), "")
# uids <- con$append_msgs(msgs, folder = "Archive", flags = "Seen")

## ----eval = FALSE-------------------------------------------------------------
# ev <- con$notify(mailboxes = "personal", timeout = 600)      # STATUS lines for any folder that changes
# pdf <- con$fetch_binary(msg_id = 3, part = "2")              # bytes, already decoded by the server
# con$append_catenate(parts = list("Subject: Fwd\r\n\r\n", imap_url("INBOX", uid = 12, section = "TEXT")),
#                     folder = "Archive")

