variable "server_config" {
  description = "Configuration for the server and its root volume."
  type = object({
    name        = string
    flavor_id   = string
    image_id    = string
    key_pair    = string
    volume_size = number
    security_groups    = list(string)
    net_int            = string
    net_ext            = string
  })
}
