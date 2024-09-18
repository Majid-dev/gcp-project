terraform {
  cloud {

    organization = "poorsam"

    workspaces {
      name = "gcp-assignment"
    }
  }
}