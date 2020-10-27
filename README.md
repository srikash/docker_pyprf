# docker_pyprf

<img src="https://gitlab.com/skash/images-and-gifs/-/raw/master/docker-pyprf/docker_pyprf-01.png" width="180">

Dockerisation of [Ingo Marquardt's PyPRF](https://github.com/ingo-m/pyprf) 
fixing multithreading issue with docker.

## Example usage

1. Get the dockerfile: 

    `git clone https://gitlab.com/skash/docker_pyprf.git`

2. Go to directory: 

    `cd docker_pyprf`

3. Build: 

    `docker build -t pyprf .`

4. To run analyses:

    `docker run --rm -it --cpuset-cpus="0-7" -v $PWD:/data pyprf pyprf -config config.csv`

For complete documentation see [Ingo Marquardt's PyPRF](https://github.com/ingo-m/pyprf).

## Citation
If you use this in your research, please cite PyPRF v.2.0.0 using bibfile included [here](https://gitlab.com/skash/docker_pyprf/blob/master/pyprf2018.bib) or as described [here](http://doi.org/10.5281/zenodo.1475439).
