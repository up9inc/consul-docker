data_dir = "/tmp/"
log_level = "DEBUG"

datacenter = "up9demo"

server = true

bootstrap_expect = 1
ui = true

bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"

ports {
  grpc = 8502
}

connect {
  enabled = true
}

advertise_addr = "10.20.0.2"
enable_central_service_config = true

config_entries {
  bootstrap = [
    {
      kind = "proxy-defaults"
      name = "global"
      
      config {
        protocol = "http"
      }
    }
  ]
}
