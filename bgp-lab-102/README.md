**Goal** 

Set up a simple iBGP adjacency between R1 and R2 (with MD5 authentication), advertise a route, check RIB on both routers. 

**How it works**

gobgp is used in its containerized version (thanks [pierky](https://hub.docker.com/r/pierky/gobgp/#!)!).

Two container instances of gobgp are launched via docker-compose (`docker-compose up -d`).



