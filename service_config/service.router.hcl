kind = "service-router"
name = "user"
routes = [
  {
    match {
      http {
        path_prefix = "/"
      }
    }

    destination {
      service = "mockintosh"
    }
  },
]