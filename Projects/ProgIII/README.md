# Email
(As the name suggests) Email is a multithreaded Email client-server application
written in Java. It is the final project of a university exam. 

## Instructions

1. Clone the repository
2. Build the shared class into the `shared` directory using the `build.sh`
   script
3. Use `gradlew` wrapper script to build and run the server (eg. `./gradlew
   appStart`)
4. Do the same for the client

## Note

This project still relies on Java threads (which are quite low level in terms of
abstraction), since the course was pretty introductory in terms of concurrent
and asynchronous programming. Using Threads directly is a design decision that I
wouldn't normally do, but I had to adhere to the given specifications.
