**Goal** 

Set up a simple iBGP adjacency between R1 and R2 (with MD5 authentication) and test what happens when R1 restarts. No route is being advertised 

**How it works**

gobgp is used in its containerized version (thanks [pierky](https://hub.docker.com/r/pierky/gobgp/#!)!).

Two container instances of gobgp are launched via docker-compose (`docker-compose up -d`).

Then, BGP adjacency is checked:

`docker-exec bgplab101_r1_1 gobgp neighbor`

```
Peer        AS  Up/Down State       |#Received  Accepted
10.1.0.3 65001 00:00:34 Establ      |        0         0
```

`docker-exec bgplab101_r2_1 gobgp neighbor`

```
Peer        AS  Up/Down State       |#Received  Accepted
10.1.0.2 65001 00:00:39 Establ      |        0         0
```

Finally, traffic on the Docker bridge interface is captured as R1 restarts to see what happens.
As expected:

1) R1 terminates the TCP connection

2) R1 starts a new TCP handshake with R2

3) OPEN and KEEPALIVE messages are succesfully exchanged among the two routers
