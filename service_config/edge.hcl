service {
  name = "edge"
  id = "edge_v1"
  address = "10.20.0.9"
  port = 8000
  
  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.20.0.9:20000"
        interval ="10s"
      }

      proxy {
        upstreams = [
          {
            destination_name = "front-end"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15000
          }
        ]
      }
    }  
  }
}
