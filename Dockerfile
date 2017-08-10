FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y gnu-smalltalk

WORKDIR /app

RUN gst-load -iI build.im Seaside

COPY . /app
RUN gst build_image.st

CMD ["gst-remote", "-I", "build.im", "--server", "--start=Seaside"]

EXPOSE 8080
