provider "okta" {
    org_name = "dev-649194"
    base_url = "okta.com"
}

resource "okta_app_oauth" "example" {
  label                      = "Yelsin web testing"
  type                       = "web"
  grant_types                = ["authorization_code"]
  redirect_uris              = ["https://example.com/"]
  response_types             = ["code"]
}

/* variable "api_token" {
  type    = string
} */
/* data "okta_auth_server" "example" {
  name = "Yelsin web test"
}   */

/* resource "okta_app_oauth" "newExample" {
  label                      = "Team test"
  type                       = "service"

}
*/

/*

resource "local_file" "app_info" {
    content = "secret:${okta_app_oauth.example.client_id} \n\nid:${okta_app_oauth.example.client_secret}"
    filename = "./test.txt"
} */ 

/* module "get-credentials" {
    source = "./modules/get-credentials"
} */