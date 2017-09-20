# Configure the Docker provider
# You should not allow docker to be connected from base
# use a proxy container via socat e.g. https://hub.docker.com/r/bortels/socat/
# then change the ip & port at provider to make it work
# sample: docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 127.0.0.1:1234:1234 bobrik/socat TCP-LISTEN:1234,fork UNIX-CONNECT:/var/run/docker.sock
provider "docker" {
  host = "tcp://127.0.0.1:1234/"
}

# Create a container
resource "docker_container" "foo" {
  image = "${docker_image.ubuntu.latest}"
  name  = "foo"
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}
