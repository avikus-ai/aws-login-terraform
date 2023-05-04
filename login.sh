#!/bin/bash

sudo chown -R $(id -u):$(id -g) /home/ubuntu/.docker

function login() {
    aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 479435310497.dkr.ecr.ap-northeast-2.amazonaws.com
}

login
