# docker-crow-demo

C++ microservice using the [Crow Framework](https://crowcpp.org/master/) running in a container

# build

```
./_build.sh
```

Compiles the code and generates the docker image

The build is done on the host and the binary is copied into the image, the host will need `apt install libboost-dev -y`

```
$ ./_build.sh 
+ g++ -std=c++20 -g -O2 -fno-omit-frame-pointer -fno-inline hello-crow.cpp -lpthread -o hello-crow
+ docker build -t hello-crow -f crow.df .
Sending build context to Docker daemon  7.675MB
Step 1/4 : FROM ubuntu:22.04
 ---> 58db3edaf2be
Step 2/4 : WORKDIR /hello-crow
 ---> Using cache
 ---> e7210ee1cd2a
Step 3/4 : COPY hello-crow hello-crow
 ---> Using cache
 ---> 07726d37d33f
Step 4/4 : ENTRYPOINT ["./hello-crow"]
 ---> Using cache
 ---> 39f2e95acafa
Successfully built 39f2e95acafa
Successfully tagged hello-crow:latest
```

# launch service



```
$ docker run -e PORT=80 --network=host hello-crow
PORT: 80
(2023-02-01 18:19:05) [INFO    ] Crow/1.0 server is running at http://0.0.0.0:80 using 4 threads
(2023-02-01 18:19:05) [INFO    ] Call `app.loglevel(crow::LogLevel::Warning)` to hide Info level logs.
(2023-02-01 18:19:24) [INFO    ] Request: 104.133.9.110:55917 0x560235304fd0 HTTP/1.1 GET /
(2023-02-01 18:19:24) [INFO    ] Response: 0x560235304fd0 / 200 0
(2023-02-01 18:19:24) [INFO    ] Request: 104.133.9.110:55917 0x560235304fd0 HTTP/1.1 GET /favicon.ico
(2023-02-01 18:19:24) [INFO    ] Response: 0x560235304fd0 /favicon.ico 404 0
```

You can run the binary locally as well

```
PORT=4567 ./hello-crow
```

See the [code](hello-crow.cpp) for the available endpoints.
