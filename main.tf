##    terraform-gcp-database
##    Copyright (C) 2022 Paul Dwerryhouse <paul@dwerryhouse.com.au>
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.

resource "google_sql_database_instance" "instance" {
  name             = var.name
  project          = var.project
  region           = var.region
  database_version = var.database_version

  settings {
    tier = var.tier
    activation_policy = var.activation_policy
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_user" "users" {
  for_each = { for user in var.users : user.name => user }

  name            = each.key
  password        = each.value.password
  type            = each.value.type
  deletion_policy = each.value.deletion_policy
  instance        = google_sql_database_instance.instance.name
}

resource "google_sql_database" "database" {
  for_each = { for database in var.databases : database.name => database }

  name      = each.key
  charset   = each.value.charset
  collation = each.value.collation
  project   = each.value.project
  instance  = google_sql_database_instance.instance.name
}

