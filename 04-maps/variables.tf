variable "users_map" {
  type = map(any)
  default = {
    john : { country : "USA", department : "CCD" },
    james : { country : "Canada", department : "NDB" },
    jack : { country : "Germany", department : "PRM" }
  }
  description = "Users map"
}
