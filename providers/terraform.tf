terraform {
  cloud {
    organization = "AltSchoolProject-byGladys"

    workspaces {
      name = "altschool_mini_project"
    }
  }
}