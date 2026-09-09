## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## -----------------------------------------------------------------------------
# system.file("docker", package = "mRpostman")

## -----------------------------------------------------------------------------
# library(mRpostman)
# 
# con <- configure_imap(url = "imap://localhost:1430",
#                       username = "testuser",
#                       password = "sandbox",
#                       use_ssl = FALSE)
# 
# con$list_server_capabilities()

## -----------------------------------------------------------------------------
# info <- populate_sandbox(con, n = 200)
# #> Appending 200 synthetic messages to INBOX at imap://localhost:1430 ...
# #>   50/200
# #>   100/200
# #>   150/200
# #>   200/200
# #>
# #> Done. INBOX now reports:
# #> $EXISTS
# #> [1] 200
# #> ...

## -----------------------------------------------------------------------------
# head(info)
# #>   id                     from                  subject ...
# #> 1  1 felipe.duarte@example.com     Meeting minutes     ...

## -----------------------------------------------------------------------------
# manifest <- ingest_maildir(con, path = "~/backup/maildir/archive2020",
#                            folder = "archive2020")
# table(manifest$appended)

## -----------------------------------------------------------------------------
# con2 <- configure_imap(url = "imap://localhost:1430",
#                        username = "enron", password = "sandbox",
#                        use_ssl = FALSE)
# manifest <- enron_sandbox(con2,
#                           custodians  = c("kaminski-v", "lay-k", "skilling-j"),
#                           sent_since  = "2000-01-01",
#                           sent_before = "2002-07-01")
# table(manifest$custodian, manifest$appended)

## -----------------------------------------------------------------------------
# con$list_mail_folders()
# con$examine_folder("INBOX")
# con$select_folder("INBOX")

## -----------------------------------------------------------------------------
# # messages "sent" in the first quarter of 2020 (Date: header)
# ids_q1 <- con$query(sent >= "2020-01-01" & sent < "2020-07-01")
# 
# # large messages
# ids_large <- con$query(size > 8000)
# 
# # flagged messages
# ids_flagged <- con$query(flag == "FLAGGED")

## -----------------------------------------------------------------------------
# ids <- con$query(subject == "sales" | "marketing")
#                                       where = "FROM")))

## -----------------------------------------------------------------------------
# con$esearch_count(flag = "SEEN")
# con$esearch_min_id(flag = "FLAGGED")

## -----------------------------------------------------------------------------
# meta <- ids_q1[1:5] %>%
#   con$fetch_metadata(attribute = c("INTERNALDATE", "RFC822.SIZE"))
# 
# texts <- ids_q1[1:5] %>%
#   con$fetch_text()

## -----------------------------------------------------------------------------
# utf8_ids <- info$id[info$is_utf8_body]
# raw_text <- con$fetch_text(msg_id = utf8_ids[1])
# clean_msg_text(raw_text)
# #> [[1]]
# #> [1] "Segue em anexo o relatório com os números consolidados. ..."

## -----------------------------------------------------------------------------
# att_ids <- info$id[info$has_attachment]
# 
# # list attachment filenames without downloading
# con$attachments_manifest(msg_id = att_ids[1:5])
# 
# # download them (note the automatic deduplication of repeated filenames)
# con$attachments(msg_id = att_ids[1:5])

## -----------------------------------------------------------------------------
# con$sort(by = "SUBJECT", use_uid = TRUE)
# con$thread(algorithm = "REFERENCES")

## -----------------------------------------------------------------------------
# con$copy_msg(msg_id = ids_flagged[1], folder = "ProjectAtlas")
# con$add_flags(msg_id = ids_flagged[1], flags_to_set = "\\Deleted")
# con$expunge()

## -----------------------------------------------------------------------------
# con$list_folders_status(items = c("MESSAGES", "UNSEEN", "SIZE"))
# con$search(request = flag("FLAGGED"), save = TRUE)
# con$fetch_preview(msg_id = "$")
# con$sort(by = "SIZE", reverse = TRUE, return = c("COUNT", "MAX"))
# con$my_rights("INBOX")
# con$get_quota_root("INBOX")

## -----------------------------------------------------------------------------
# con2 <- configure_imap(url = "imap://localhost:1430",
#                        username = "testuser2", # any new name = pristine mailbox
#                        password = "sandbox",
#                        use_ssl = FALSE)
# populate_sandbox(con2, n = 200)

