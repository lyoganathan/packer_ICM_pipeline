docker build -t ICM_PIPELINE
docker run -it ICM_PIPELINE /bin/bash
docker commit 5fe8a50718c3
docker images
docker ps -a

http://jasonwilder.com/blog/2014/08/19/squashing-docker-images/
