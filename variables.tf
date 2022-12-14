variable "resource_groups" {
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  description = "Properties of the Resource Groups to deploy"
}
