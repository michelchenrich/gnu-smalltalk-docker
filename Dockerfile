FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y gnu-smalltalk

WORKDIR /app

RUN gst-load -iI seaside.im Seaside Seaside-Development Seaside-Examples

CMD ["gst-remote", "-I", "seaside.im", "--server", "--start=Seaside"]

EXPOSE 8080
