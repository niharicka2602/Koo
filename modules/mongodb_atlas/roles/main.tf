resource "mongodbatlas_custom_db_role" "test_role" {
  project_id = var.projectId
  role_name  = var.roleName

  actions {
    action = "FIND"
    resources {
      collection_name = var.collectionName
      database_name   = var.databaseName
    }
  }
}
