#' Generate a token for the WakaTime API
#'
#' @param client_id The app id for the WakaTime API
#' @param client_secret The app secret for the WakaTime API
#'
#' @return An OAuth token
#'
#' @examples
generate_oauth_token <- function(client_id = Sys.getenv("WAKATIME_ID"),
                                 client_secret = Sys.getenv("WAKATIME_SECRET")) {
  httr2::oauth_flow_client_credentials(
    client = wakatime_client(client_id, client_secret),
    scope = NULL,
    token_params = list(
      client_id = client_id,
      client_secret = client_secret,
      redirect_uri = "https://wakatime.com/oauth/authorize",
      response_type = "token"
    )
  )

  httr2::oauth_token(
# INSERT TOKEN HERE
    )

}

wakatime_client <- function(client_id, client_secret) {
  httr2::oauth_client(
    name = "wakatime",
    id = client_id,
    secret = client_secret,
    token_url = "https://wakatime.com/oauth/token"
  )
}
