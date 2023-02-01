#include <cstdlib>
#include <iostream>

#include "crow_all.h"

int main() {
  char *env_p = std::getenv("PORT");
  int http_port=0;
  if (env_p) {
    std::cout << "PORT: " << env_p << std::endl;
    http_port = std::atoi(env_p);
  } else {
    http_port=9010;
  }

  crow::SimpleApp app;

  CROW_ROUTE(app, "/")([]() { return "Hello world"; });

  CROW_ROUTE(app, "/json")
  ([] {
    crow::json::wvalue x({{"message", "Hello, World!"}});
    x["message2"] = "Hello, World.. Again!";
    return x;
  });

  CROW_ROUTE(app, "/hello/<int>")
  ([](int count) { return crow::response(std::to_string(count)); });

  app.port(http_port).multithreaded().run();
}
