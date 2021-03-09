service {
  name = "mockintosh4"
  id = "mockintosh_v4"
  port = 17008
  
  connect {   
    sidecar_service {}
  }
  check {
    name       = "mock-check4"
    http     = "http://google.com/"
    interval = "10s"
    timeout = "1s"
  }
}