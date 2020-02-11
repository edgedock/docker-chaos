#!/bin/bash

# default timeout is 60sec
export TIMEOUT=${TIMEOUT:-60}

timeout ${TIMEOUT} bash /membomb
