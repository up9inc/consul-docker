service {
  name = "up9-agent"
  id = "up9-agent_v1"
  port = 19001
  connect {
    sidecar_service {
      check {
        name = "Connect Envoy Sidecar"
        tcp = "up9-agent:20000"
        interval ="10s"
      }
      port = 20000
      proxy {
        upstreams = [
          {
            destination_name = "front-end"
            local_bind_address = "127.0.0.1"
            local_bind_port = 44967
          },
{
            destination_name = "catalogue"
            local_bind_address = "127.0.0.1"
            local_bind_port = 27769
          },
{
            destination_name = "carts"
            local_bind_address = "127.0.0.1"
            local_bind_port = 30558
          },
{
            destination_name = "orders"
            local_bind_address = "127.0.0.1"
            local_bind_port = 58872
          },
{
            destination_name = "shipping"
            local_bind_address = "127.0.0.1"
            local_bind_port = 56226
          },
{
            destination_name = "payment"
            local_bind_address = "127.0.0.1"
            local_bind_port = 35606
          },
{
            destination_name = "user"
            local_bind_address = "127.0.0.1"
            local_bind_port = 13980
          },
{
            destination_name = "mockintosh"
            local_bind_address = "127.0.0.1"
            local_bind_port = 25842
          }
        ]
      }
    }
  }
}
