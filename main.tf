// exporting okta_api_key
provider "okta" {
    org_name = "dev-649194"
    base_url = "okta.com"
}

resource "okta_app_oauth" "example" {
  label                      = "Yelsin web testing Change workspace test"
  type                       = "web"
  grant_types                = ["authorization_code"]
  redirect_uris              = ["https://example.com/workspace"]
  response_types             = ["code"]
}

resource "okta_app_oauth" "example2" {
  label                      = "Yelsin web testing 1 Change workspace test"
  type                       = "web"
  grant_types                = ["authorization_code"]
  redirect_uris              = ["https://example.com/workspace"]
  response_types             = ["code"]
}

// exporting access_key and secret_key
/*  data "terraform_remote_state" "iam_okta_apps" {
  backend = "s3"
  config = {
    bucket = "terraform-okta-s3-test"
    key    = "state_files/terraform.tfstate"
    region = "us-east-2"
  } 
 } */