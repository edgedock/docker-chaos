ifndef DOCKER_BASE
$(error DOCKER_BASE is not set)
endif

clean-docker-all:
	-docker rm -f `docker ps -aq` 2>/dev/null || :
	-docker rmi -f `docker images -aq` 2>/dev/null || :

publish-all:
	make -C docker-killer-membomb
	make -C docker-killer-membomb push
	make -C docker-killer-membomb publish-service
	make -C docker-killer-membomb publish-policy
	make -C docker-killer-cpubomb
	make -C docker-killer-cpubomb push
	make -C docker-killer-cpubomb publish-service
	make -C docker-killer-cpubomb publish-policy
	make -C docker-killer-forkbomb
	make -C docker-killer-forkbomb push
	make -C docker-killer-forkbomb publish-service
	make -C docker-killer-forkbomb publish-policy
	make -C docker-killer-netbomb
	make -C docker-killer-netbomb push
	make -C docker-killer-netbomb publish-service
	make -C docker-killer-netbomb publish-policy
	make -C docker-killer-die
	make -C docker-killer-die push
	make -C docker-killer-die publish-service
	make -C docker-killer-die publish-policy
	make -C docker-killer-kernelpanic
	make -C docker-killer-kernelpanic push
	make -C docker-killer-kernelpanic publish-service
	make -C docker-killer-kernelpanic publish-policy

