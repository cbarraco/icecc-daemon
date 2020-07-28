# icecc-daemon

The iceccd daemon running in a Docker container. Learn more about icecream here: https://github.com/icecc/icecream

By running this on a remote computer, that computer will be enrolled into your icecream build infastructure as a worker node. This icecc daemon also needs to have a icecc scheduler running to distribute and manage the worker nodes including this one. You can start a scheduler using my other Docker image here: https://hub.docker.com/r/cbarraco/icecc-scheduler

# Running the Container
You can use this command to pull the container from Docker Hub and run it:
```bash
    docker run -it --net=host -d --restart=unless-stopped cbarraco/icecc-daemon
```
I've had the best luck using --net=host but you might be able to get it to work using a bridge network.

You can also pass in the scheduler address if the UDP broadcast feature isn't working using the USE_SCHEDULER environment variable:
```bash    
    docker run -it --net=host -d --restart=unless-stopped -e USE_SCHEDULER=<ADDRESS OF SCHDULER> cbarraco/icecc-daemon
```
