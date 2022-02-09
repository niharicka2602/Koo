resource "mongodbatlas_database_user" "testuser" {
  username           = var.username
  password           = var.password
  project_id         = var.projectId
  auth_database_name = var.authdatabasename

  roles {
    role_name     = var.rolename
    database_name = var.databasename
  }
}
