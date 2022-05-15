**Goal** 

Set up a simple iBGP adjacency between R1 and R2 (with MD5 authentication), advertise a route, check RIB on both routers. 

**How it works**

gobgp is used in its containerized version (thanks [pierky](https://hub.docker.com/r/pierky/gobgp/#!)!).

Two container instances of gobgp are launched via docker-compose (`docker-compose up -d`).

Then, a Bash script (add_route.sh) is launched, which uses docker-exec to  run a gobgp command inside R1 to advertise a route.

As expected, the RIB of both routers contain the advertised route:

1) inside Adj-In in the router receiving the advertisement (R2)

2) inside Adj-Out in the router advertising the route (R1)
