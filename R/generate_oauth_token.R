#' Generate a token for the WakaTime API
#'
#' @param client_id The app id for the WakaTime API. Defaults to the WAKATIME_ID
#' environment variable.
#' @param client_secret The app secret for the WakaTime API. Defaults to the
#' WAKATIME_SECRET environment variable.
#'
#' @return An OAuth token
#'
#' @examples
#' \dontrun{
#' token <- generate_oauth_token()
#'
#' req <- request("https://api.wakatime.com/api/v1/users/current")
#'
#' req |>
#'   req_oauth_auth_code(
#'     client = wakatime_client(client_id, client_secret),
#'     auth_url = "https://wakatime.com/oauth/authorize",
#'     scope = "write_heartbeats",
#'     redirect_uri = "https://wakatime.com/oauth/test"
#'     ) |>
#'   req_perform() |>
#'   resp_body_json() |>
#'   str()
#' }
generate_oauth_token <- function(client_id = Sys.getenv("WAKATIME_ID"),
                                 client_secret = Sys.getenv("WAKATIME_SECRET")) {
  httr2::oauth_flow_auth_code(
    client = wakatime_client(client_id, client_secret),
    auth_url = "https://wakatime.com/oauth/authorize",
    scope = NULL,
    redirect_uri = "https://wakatime.com/oauth/test"
  )
}

wakatime_client <- function(client_id, client_secret) {
  httr2::oauth_client(
    id = client_id,
    token_url = "https://wakatime.com/oauth/token",
    secret = client_secret,
    name = "wakatime"
  )
}
