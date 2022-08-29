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

variable "activation_policy" {
  type = string
  default = null
}

variable "database_version" {
  type = string
  validation {
    condition = contains(["MYSQL_5_6", "MYSQL_5_7", "MYSQL_8_0", "POSTGRES_9_6","POSTGRES_10", "POSTGRES_11", "POSTGRES_12", "POSTGRES_13", "POSTGRES_14", "SQLSERVER_2017_STANDARD", "SQLSERVER_2017_ENTERPRISE", "SQLSERVER_2017_EXPRESS", "SQLSERVER_2017_WEB", "SQLSERVER_2019_STANDARD", "SQLSERVER_2019_ENTERPRISE", "SQLSERVER_2019_EXPRESS", "SQLSERVER_2019_WEB"], var.database_version)
    error_message = "Variable database_parameter is not an approved type."
  }
}

variable "disk_autoresize_limit" {
  type = number
  default = 0
}

variable "disk_type" {
  type = string
  default = "PD_SSD"
  validation {
    condition = contains(["PD_SSD", "PD_HDD"], var.disk_type)
    error_message = "Variable disk_type must be either PD_SSD or PD_HDD."
  }
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "name" {
  type = string
}

variable "project" {
  type = string
  default = null
}


variable "region" {
  type = string
}

variable "tier" {
  type = string
}

variable "users" {
  type = list(object({
    name            = string
    password        = string
    type            = string
    deletion_policy = string
  }))
  description = "List of users to be created in database"
  default     = []
}

variable "databases" {
  type = list(object({
    name      = string
    charset   = string
    collation = string
    project   = string
  }))
  description = "List of databases to be created"
  default     = []
}
