module "mongodb_atlas" {
  source  = "../modules/mongodb_atlas/roles"
}
module "mongodb_atlas" {
  source  = "../modules/mongodb_atlas/users"
}

terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
}
provider "mongodbatlas" {
  public_key = "gkiwucsh"
  private_key = "eb4d0b31-819e-4a87-acd2-29f507d86b0b"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
locals {
    # get json
    user_data = jsondecode(file("./config.json"))
    # get all users
    services = [for i in local.user_data.config : i.serviceName]
    cluster = [for i in local.user_data.config : i.mongoCluster]
    database = [for i in local.user_data.config : i.mongoDatabase]
    collections = [for i in local.user_data.config : i.mongoCollections]
}
resource "mongodbatlas_custom_db_role" "test_role" {
    for_each=[local.services,local.database,local.collection]
    project_id = 17hdjw7idjk8jke9joe8ji72
    roleName  = each.services
    collectionName= each.collections
    databaseName=each.database
    
}
resource "mongodbatlas_database_user" "test_users" {
    for_each=[local.services,local.database,local.collection]
    project_id = 17hdjw7idjk8jke9joe8ji72
    authdatabasename  = each.database
    password=random_password.password.result
    collectionName= each.collections
    databaseName=each.database
}
resource "local_file" "url" {
    for_each=mongodbatlas_database_user.test_users.user
    content  = "mongodb+srv://${mongodbatlas_database_user.test_users.user}:${mongodbatlas_database_user.output.password}@${mongodbatlas_database_user.test_users.user.database}/${mongodbatlas_database_user.test_users.collections}"
    filename = "urls"
}
