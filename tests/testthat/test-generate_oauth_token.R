# test_that("generate_oauth_token function returns a valid OAuth token", {
#   token <- generate_oauth_token()
#
#   expect_is(token, "oauth_token")
#   expect_true(!is.null(token$credentials$access_token))
#   expect_true(!is.null(token$endpoint))
#   expect_true(!is.null(token$app))
# })
