run_docker: 
	# enable docker to play videos
	xhost +
	# run!
	docker run -it --name gen_0 \
			--privileged \
			--net=host \
			--user=0 \
			--security-opt seccomp=unconfined  \
			--runtime nvidia \
			--gpus all \
			-e DISPLAY=${DISPLAY} \
			--device /dev/dri \
			-v /tmp/.X11-unix/:/tmp/.X11-unix \
			-v `pwd`/code:/code \
			-w /code \
			gen_0 bash
build_docker:
	docker build -t gen_0 `pwd`/docker/ -f `pwd`/Dockerfile
exec:
	docker exec -it gen_0 bash
run:
	docker start gen_0
