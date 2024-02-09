#' Generate a token for the WakaTime API
#'
#' @param app_id The app id for the WakaTime API
#' @param app_secret The app secret for the WakaTime API
#'
#' @return An OAuth token
#'
#' @examples
generate_oauth_token <- function(app_id = Sys.getenv("WAKATIME_ID"),
                      app_secret = Sys.getenv("WAKATIME_SECRET")) {
  httr::oauth2.0_token(
    endpoint = httr::oauth_endpoint(
      access = "https://wakatime.com/oauth/token",
      authorize = "https://wakatime.com/oauth/authorize",
      base_url = "https://api.wakatime.com/api/v1"
    ),
    app = httr::oauth_app(
      appname = "wakastudio",
      key = app_id,
      secret = app_secret
    ),
    scope = "read_stats"
  )
}
