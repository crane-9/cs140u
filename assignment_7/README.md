# Assignment 7

Docker "Hello world" program.

## Hello World 

![Proof of Docker push](hello-world_push.png)

### Notes on local testing

While running locally:
- `docker images` lists all *images* on the machine.
- `docker ps` or `docker container ls` lists all *containers* on the machine -- running processes of images.
    - To delete a container, it must be *stopped* and then *removed*.
- When running a server, use `docker inspect <containerID> | grep IPAddress` to find the IP to use.
- To check what containers are running, use `docker stats`.
