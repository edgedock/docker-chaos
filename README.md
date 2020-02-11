# Docker Chaos

The Makefile in the 'killerapp' folder contains the commands to build the image, push it to docker hub, create a service and business policy for each embedded app.

The only files that need to be changed is the hzn.json in each sub-directory to point it at the desired docker hub repository.

The business policy applies the same constraint for all the services, namely the property 'chaos_test' equal to 'yes'.
