module "db" {
  source = "../.."

  name                = random_string.database_name.result
  region              = "us-central1"
  database_version    = "MYSQL_8_0"
  tier                = "db-f1-micro"
  deletion_protection = "false"

  users = [
    {
      name = "admin"
      password = "oofiew3Ozee6xohj"
      type = "BUILT_IN"
      deletion_policy = ""
    }
  ]

  databases = [
    {
      name = "blah1"
      charset = null
      collation = null
      project = null
    }
  ]
}

resource "random_string" "database_name" {
  length = 8
  special = false
  lower = true
  upper = false
  numeric = false
}
