## A simple dockerized React frontend
### Build and run
#### Build image
```console
$ ./scripts/build-image.sh
```
#### Run [Backend](https://github.com/tobiaslocker/simple-dockerized-flask-backend)
```console
$ docker run  -it --rm -p 8080:8080 tobiaslocker/simple-dockerized-flask-backend:v0.1
```
#### Run Frontend
```console
$ npm start
```
Visit http://localhost:3000
#### Run with Docker Compose
-> [simple-web-app-with-docker-compose](https://github.com/tobiaslocker/simple-web-app-with-docker-compose)
