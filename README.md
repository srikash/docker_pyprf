# docker_pyprf

Dockerisation of [Ingo Marquardt's PypRF](https://github.com/ingo-m/pyprf) 
with small changes to fix multithreading issue.

Example usage:

1. Get the dockerfile: 

    `git clone https://gitlab.com/skash/docker_pyprf.git`

2. Go to directory: 

    `cd docker_pyprf`

3. Build: 

    `docker build -t pyprf .`

4. To run analyses:

    `docker run --rm -it --cpuset-cpus="0-7" -v $PWD:/data pyprf pyprf -config config.csv`

