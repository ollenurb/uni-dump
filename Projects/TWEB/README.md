# Web Technologies

**Pri**(*vate*)**LESS**(*ons*) is the implementation of the final project of a
university course. The goal of the project is to use both the Java servlet API
and the JDBC API to develop a basic
[REST](https://en.wikipedia.org/wiki/Representational_state_transfer) endpoint. 

Such endpoints will then be used by two frontend applications (which are also included in the assignment): 

* A Web [SPA](https://en.wikipedia.org/wiki/Single-page_application) developed in Vue.js
* An Android application

## Project Structure
This repository contains both the backend (hence the REST server), the web
application and the Android client. 

## Execute the backend
The application uses gradle and the gretty plugin to run a minimal webserver
that handles all the servlet containers. In this way there is no need to install
a webserver manually, since it will be downloaded and started automatically by
the gradle script. If you have `gradle` installed you can run directly the
gradle script inside the backend directory. Alternatively, you can run gradle
with the wrapper script (`gradlew`, `gradlew.bat`). The gradle command
`appStart` will then run the gretty container.

## Execute the web frontend
Install [npm](https://github.com/npm/npm) and follow the dedicated `README.md`
guide under the `frontend-web` directory. 

## Execute the Android client
Load the project into Android Studio then run it.
