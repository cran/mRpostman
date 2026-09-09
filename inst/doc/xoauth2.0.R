## ----eval = FALSE-------------------------------------------------------------
# install.packages(c("httr2", "jsonlite"))

## ----message = FALSE----------------------------------------------------------
curl::curl_version()$version

## ----eval = FALSE-------------------------------------------------------------
# cred <- jsonlite::fromJSON("path/to/client_secret_XXXX.json")$installed

## ----eval = FALSE-------------------------------------------------------------
# library(httr2)
# 
# client <- oauth_client(
#   id        = cred$client_id,
#   secret    = cred$client_secret,
#   token_url = "https://oauth2.googleapis.com/token",
#   name      = "mRpostman")
# 
# tok <- oauth_flow_auth_code(
#   client,
#   auth_url    = "https://accounts.google.com/o/oauth2/auth",
#   scope       = "https://mail.google.com/",
#   auth_params = list(access_type = "offline", prompt = "consent"))
# 
# token <- tok$access_token

## ----eval = FALSE-------------------------------------------------------------
# library(httr2)
# 
# redirect_uri <- "http://localhost"
# scope        <- "https://mail.google.com/"
# 
# auth_url <- url_modify("https://accounts.google.com/o/oauth2/auth",
#   query = list(client_id     = cred$client_id,
#                redirect_uri  = redirect_uri,
#                response_type = "code",
#                scope         = scope,
#                access_type   = "offline",
#                prompt        = "consent"))
# 
# browseURL(auth_url)

## ----eval = FALSE-------------------------------------------------------------
# code_in <- "PASTE_THE_CODE_HERE"
# 
# resp <- request("https://oauth2.googleapis.com/token") |>
#   req_body_form(code          = code_in,
#                 client_id     = cred$client_id,
#                 client_secret = cred$client_secret,
#                 redirect_uri  = redirect_uri,
#                 grant_type    = "authorization_code") |>
#   req_perform()
# 
# token_data <- resp_body_json(resp)
# token      <- token_data$access_token

## ----eval = FALSE-------------------------------------------------------------
# library(mRpostman)
# 
# con <- configure_imap(
#   url            = "imaps://imap.gmail.com",
#   username       = "your_user@gmail.com",
#   use_ssl        = TRUE,
#   xoauth2_bearer = token
# )
# 
# con$list_server_capabilities()

## ----eval = FALSE-------------------------------------------------------------
# tok   <- oauth_flow_refresh(client, refresh_token = tok$refresh_token)
# token <- tok$access_token

## ----eval = FALSE-------------------------------------------------------------
# refresh <- request("https://oauth2.googleapis.com/token") |>
#   req_body_form(client_id     = cred$client_id,
#                 client_secret = cred$client_secret,
#                 grant_type    = "refresh_token",
#                 refresh_token = token_data$refresh_token) |>
#   req_perform()
# 
# token <- resp_body_json(refresh)$access_token

