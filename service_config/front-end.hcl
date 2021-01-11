service {
  name = "front-end"
  id = "front-end_v1"
  address = "10.20.0.10"
  port = 8079
  
  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.20.0.10:20000"
        interval ="10s"
      }

      proxy {
        config {
          envoy_public_listener_json = <<EOL
           {
           "@type": "type.googleapis.com/envoy.api.v2.Listener",
           "name": "public_listener:10.20.0.10:20000",
           "address": { "socket_address": { "address": "10.20.0.10", "port_value": 20000 } },
           "filter_chains": [
            {
             "tls_context": { },
             "filters": [
              {
               "name": "envoy.http_connection_manager",
               "config": {
                "use_remote_address": "true",
                "xff_num_trusted_hops": "2",
                "skip_xff_append": "false",
                "route_config": {
                 "name": "public_listener",
                 "virtual_hosts": [
                  {
                   "routes": [ { "route": { "cluster": "local_app" }, "match": { "prefix": "/" } } ],
                   "domains": [ "*" ],
                   "name": "public_listener"
                  }
                 ]
                },
                "tracing": { "random_sampling": {} },
                "http_filters": [
                  { "name": "envoy.filters.http.tap",
                    "config": { "common_config": { "admin_config": { "config_id": "alex_id" } } }
                  },
                  { "name": "envoy.router" }
                ],
                "stat_prefix": "public_listener"
               }
              }
             ]
            }
           ]
          }
       EOL
     },
        upstreams = [
          {
            destination_name = "user"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15100
          },
          {
            destination_name = "orders"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15200
          },
          {
            destination_name = "carts"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15300
          },
          {
            destination_name = "catalogue"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15400
          }
        ]
      }
    }  
  }
}

