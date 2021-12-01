variable "users_map" {
  type = map(any)
  default = {
    john : "USA",
    james : "Canada",
    jack : "Germany"
  }
  description = "User map"
}
