FROM debian:latest

RUN apt update -y
RUN apt install -y cmake git
