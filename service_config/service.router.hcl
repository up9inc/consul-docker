kind = "service-router"
name = "catalogue"
routes = [
  {
    match {
      http {
        path_prefix = "/catalogue"
      }
    }

    destination {
      service = "mockintosh"
    }
  },
  {
    match {
      http {
        path_prefix = "/catalogue/size"
      }
    }

    destination {
      service = "catalogue"
    }
  },
]