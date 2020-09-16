## ---- message = FALSE---------------------------------------------------------
curl::curl_version()

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  secret = "vsV[...]6m7"
#  
#  key = "85169[...]9pk.apps.googleusercontent.com"

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  endpoint <- httr::oauth_endpoints("google")
#  
#  gmail_app <- httr::oauth_app(
#    "xpto-allan",
#    key = key,
#    secret = secret
#  )
#  
#  scope <- "https://mail.google.com/"
#  
#  auth_code <- httr::oauth2.0_token(endpoint, app = gmail_app, scope = scope)

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  token <- auth_code$credentials$access_token
#  

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  library(mRpostman)
#  con <- configure_imap(url="imaps://imap.gmail.com",
#                        username = "allanvcq@gmail.com",
#                        use_ssl = TRUE,
#                        # use_ssl = FALSE,
#                        verbose = TRUE,
#                        # password = "g",
#                        # xoauth2_bearer = auth_code_new$access_token,
#                        xoauth2_bearer = token
#                        )
#  
#  con$list_server_capabilities()
#  

## ---- message = FALSE, echo = FALSE-------------------------------------------
c("IMAP4rev1", "UNSELECT", "IDLE", "NAMESPACE", "QUOTA", "ID", "XLIST", "CHILDREN", "X-GM-EXT-1", "UIDPLUS", "COMPRESS=DEFLATE", "ENABLE", "MOVE", "CONDSTORE", "ESEARCH", "UTF8=ACCEPT", "LIST-EXTENDED", "LIST-STATUS", "LITERAL-", "SPECIAL-USE", "APPENDLIMIT=35651584")

## ---- message = FALSE, eval=FALSE---------------------------------------------
#  # thanks to jdeboer code at https://github.com/r-lib/httr/issues/31
#  oauth2.0_refresh <- function(endpoint, app, auth_code, type = NULL) {
#    req <- httr::POST(
#      url = endpoint$access,
#      multipart = FALSE,
#      body = list(
#        client_id = app$key,
#        client_secret = app$secret,
#        grant_type = "refresh_token",
#        refresh_token = auth_code$credentials$refresh_token
#      )
#    )
#    content_out <- httr::content(req, type = type)
#    content_out <- c(content_out, auth_code$credentials$access_token)
#  }
#  
#  auth_code_new <- oauth2.0_refresh(endpoint, app=gmail_app, auth_code=auth_code)
#  
#  token <- auth_code_new$access_token

