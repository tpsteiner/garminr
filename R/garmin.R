library(rvest)
library(httr)

SERVICE_URL    <- "https://connect.garmin.com/post-auth/login"
LOGIN_URL      <- "https://sso.garmin.com/sso/login"
ACTIVITIES_URL <- "http://connect.garmin.com/proxy/activity-search-service-1.2/json/activities?start=1&limit=5"
GAUTH_URL      <- "https://sso.garmin.com/sso"


garmin_login <- function(usr, pwd) {
  body <- list(username = usr,
               password = pwd,
               `_eventId` = "submit",
               embed = "true")

  headers = add_headers(service = SERVICE_URL,
                        clientId = "GarminConnect",
                        gauthHost = GAUTH_URL,
                        consumeServiceTicket = "false")

  html_session(LOGIN_URL, headers) %>%
     rvest:::request_POST(LOGIN_URL,
                          body = body,
                          headers,
                          config(followlocation = FALSE),
                          encode = "form") %>%
     rvest:::request_GET(SERVICE_URL,
                         config(followlocation = TRUE))
}

garmin_download <- function(session) {
  resp <- rvest:::request_GET(session, ACTIVITIES_URL)
  content(resp$response)
}
