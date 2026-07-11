## ----eval = FALSE-------------------------------------------------------------
#  install.packages(c("httr", "jsonlite"))

## ----message = FALSE----------------------------------------------------------
curl::curl_version()$version

## ----eval = FALSE-------------------------------------------------------------
#  cred <- jsonlite::fromJSON("path/to/client_secret_XXXX.json")$installed

## ----eval = FALSE-------------------------------------------------------------
#  library(httr)
#  
#  gmail_app <- oauth_app("mRpostman",
#                         key    = cred$client_id,
#                         secret = cred$client_secret)
#  
#  token_obj <- oauth2.0_token(
#    endpoint = oauth_endpoints("google"),
#    app      = gmail_app,
#    scope    = "https://mail.google.com/",
#    cache    = TRUE
#  )
#  
#  token <- token_obj$credentials$access_token

## ----eval = FALSE-------------------------------------------------------------
#  library(httr)
#  
#  redirect_uri <- "http://localhost"
#  scope        <- "https://mail.google.com/"
#  
#  auth_url <- modify_url("https://accounts.google.com/o/oauth2/auth",
#    query = list(client_id     = cred$client_id,
#                 redirect_uri  = redirect_uri,
#                 response_type = "code",
#                 scope         = scope,
#                 access_type   = "offline",
#                 prompt        = "consent"))
#  
#  browseURL(auth_url)

## ----eval = FALSE-------------------------------------------------------------
#  code_in <- "PASTE_THE_CODE_HERE"
#  
#  resp <- POST("https://oauth2.googleapis.com/token", encode = "form",
#    body = list(code          = code_in,
#                client_id     = cred$client_id,
#                client_secret = cred$client_secret,
#                redirect_uri  = redirect_uri,
#                grant_type    = "authorization_code"))
#  
#  token_data <- content(resp)
#  token      <- token_data$access_token

## ----eval = FALSE-------------------------------------------------------------
#  library(mRpostman)
#  
#  con <- configure_imap(
#    url            = "imaps://imap.gmail.com",
#    username       = "your_user@gmail.com",
#    use_ssl        = TRUE,
#    xoauth2_bearer = token
#  )
#  
#  con$list_server_capabilities()

## ----eval = FALSE-------------------------------------------------------------
#  token_obj$refresh()
#  token <- token_obj$credentials$access_token

## ----eval = FALSE-------------------------------------------------------------
#  refresh <- POST("https://oauth2.googleapis.com/token", encode = "form",
#    body = list(client_id     = cred$client_id,
#                client_secret = cred$client_secret,
#                grant_type    = "refresh_token",
#                refresh_token = token_data$refresh_token))
#  
#  token <- content(refresh)$access_token

