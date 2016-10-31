# MyLab

Web Application for Stock Management for the laboratory "Laboratório de Pesquisas Toxicológicas" (LPTox) from the university "Universidade Federal de Santa Catarina"

Website: https://agile-springs-54168.herokuapp.com/

## Deploy: Localhost

### Requirements

* Ruby - This project uses `.ruby-version`, `.ruby-gemset` and `Gemfile` to specify dependencies. Make sure that `rvm` or `rbenv` is installed on your computer. Check `rvm info` command to see that the correct ruby version and gemset are set. Also make sure that `./bin` is in your `$PATH` in the first place.
* Rails 4
* PostgreSQL 9.4

### Repositories Setup

```bash
 git clone git@github.com:camilamaia/mylab.git
 cd mylab
 bundle
 bundle update
```

### Postgres Setup
```bash
 sudo -u postgres psql
 postgres=# CREATE USER mylab WITH PASSWORD 'lab';
 postgres=# ALTER USER mylab CREATEDB;
```

From mylab directory:
```bash
 rake db:create
 rake db:migrate
```

### Rails Run

From mylab directory:
```bash
 rails s
```

### Browser

To see the application running, you only need to open a web browser on localhost and port 3000:
```bash
 firefox http://localhost:3000
```

## Deploy: Production Heroku

From mylab directory, with your changes already pushed to git:
```
$ git push heroku master
```

or, for a specific branch:

```
$ git push heroku yourbranch:master
```

And, migrate it:

```
$ heroku run rake db:migrate
```

## UFSC Webserver Configuration

Connect to UFSC VPN using your UFSC username and password

```
 server: srv1.vpn.ufsc.br

```

Access the server using your server username and password

```
 ssh <username>@150.162.6.107
```

### Requirements

* Docker requires a 64-bit installation regardless of Debian version. Additionally, the kernel must be 3.10 at minimum. The latest 3.10 minor version or a newer maintained version are also acceptable. Kernels older than 3.10 lack some of the features required to run Docker containers. checking the kernel version:

```
$ uname -r
4.4.0-15-generic
```

### Update your apt repository

Docker’s APT repository contains Docker 1.7.1 and higher. To set APT to use from the new repository:

Update package information, ensure that APT works with the https method, and that CA certificates are installed

``` 
$ apt-get update
$ apt-get install apt-transport-https ca-certificates
```

Add the new GPG key

```
$ apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```

Open the */etc/apt/sources.list.d/docker.list* file (if the file doesn’t exist, create it).

Remove any existing entries

Add an entry for your Debian operating system. The possible entries are (On Debian Stretch/Sid):

```
deb https://apt.dockerproject.org/repo debian-stretch main
```

Update apt-get

```
$ apt-get update
```

Verify that APT is pulling from the right repository

```
$ apt-cache policy docker-engine
```

From now on when you run apt-get upgrade, APT pulls from the new apt repository.

### Install Docker

Before installing Docker, make sure you have set your APT repository correctly as described in the prerequisites.

Update the APT package index.
```
 $ sudo apt-get update
```

Install Docker.
```
$ sudo apt-get install docker-engine
```

Start the docker daemon.
```
 $ sudo service docker start
```


Verify docker is installed correctly.
```
 $ sudo docker run hello-world
```
This command downloads a test image and runs it in a container. When the container runs, it prints an informational message. Then, it exits.

### Give non-root access

The docker daemon always runs as the root user and the docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user root, and so, by default, you can access it with sudo.

If you (or your Docker installer) create a Unix group called docker and add users to it, then the dockerdaemon will make the ownership of the Unix socket read/writable by the docker group when the daemon starts.

The docker daemon must always run as the root user, but if you run the docker client as a user in the docker group then you don’t need to add sudo to all the client commands. From Docker 0.9.0 you can use the -G flag to specify an alternative group.

Add the docker group if it doesn't already exist.
```
$ sudo groupadd docker
$ sudo gpasswd -a <username> docker
```

Restart the Docker daemon.
```
$ sudo service docker restart
```

### Install Docker Compose

```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

Test the installation
```
$ docker-compose --version
docker-compose version: 1.8.1
```

### Project Configuration

Clone the application repository

```
$ git clone git@github.com:camilamaia/mylab.git
$ cd mylab
```

Start by setting up the two files you’ll need to build the app. First, since your app is going to run inside a Docker container containing all of its dependencies, you’ll need to define exactly what needs to be included in the container. This is done using a file called Dockerfile. To begin with, the Dockerfile consists of:

```
$ vim Dockerfile
```

```
FROM ruby:2.2.2 # this specifies an existing container with ruby 2.2.2 in the docker cloud

RUN apt-get update -qq # run commands inside ruby container
RUN apt-get install -y build-essential libpq-dev locales apt-utils debconf-utils openssl libssl-dev vim
ENV LANG=C.UTF-8 LANGUAGE=en_US:en LC_ALL=C.UTF-8

RUN mkdir /mylab
WORKDIR /mylab # set basedir for the next commands 
ADD Gemfile /mylab/Gemfile # add the host Gemfile into the container
ADD Gemfile.lock /mylab/Gemfile.lock

RUN bundle install

ADD . /mylab #add everything on the local host at the current directory into the container

ENV RAILS_ENV production

EXPOSE 3000 # exposes 3000 port of the container to the host, can be commented #because we will define this again on the compose file 

ENV HOSTNAME mylab.ufsc.br
ENV DOMAIN ufsc.br
```

That’ll put your application code inside an image that will build a container with Ruby, Bundler and all your dependencies inside it. 

Finally, docker-compose.yml is where the magic happens. This file describes the services that comprise your app (a database and a web app), how to get each one’s Docker image, and the configuration needed to link them together and expose the web app’s port.

```
$ vim docker-compose.yml
```

```
version: '2'
services:
  postgres: # postgres service description
    image: postgres # image used by the container (official postgres' image)
    volumes: # define the volume that the container will share with the hostmachine
      -  postgresql_data:/var/lib/postgresql/data
    hostname: postgres
    environment:
      - "PRODUCTION_PASSWORD=postgres"
      - "PRODUCTION_USERNAME=postgres"
      - "PRODUCTION_DATABASE=mylab_production"
 #   restart: always #in case the database dies
###    ports:
#      - "15432:5432" # links the 5432 port of the host on the 5432 port of the container
#to make database accessible from the host machine. It can be commented because 
#the container already exposes the 5432 port automatically which is specified on the 
#Dockerfile of the official postgres image and we don’t need an exposed port on the
#host machine for the database
  rails: #rails service description
    build: . # this means that the build is refered in a Dockerfile in the current directory
that’s why we don’t need to set a image here, the Dockerfile already have a rails image
    command: bundle exec rails s -p 3000 -b '0.0.0.0' -e production # the command executed for this service 
    links:
      - postgres # rails service connects to the postgres service ( rails can LISTEN on postgres port)
    environment:
      - "RAILS_ENV=production"
      - "DOMAIN=ufsc.br"
      - "HOSTNAME=mylab.ufsc.br"
    ports: # rails exposes the port 3000 and the host machine make this service available on 80 port
      - "80:3000"
volumes:
  postgresql_data:
# restart: always # in case the service dies 
```

Run the build parts of the compose file downloading the necessary images and creating the containers
```
$ docker-compose build
```

The containers will run along with the services inside and detaching from the console output
```
 $ docker-compose up -d 
```

Check the logs till the rails server is up and running
```
$ docker-compose logs
```

Run rake db:create on rails container
```
$ docker-compose run rails rake db:create
```

Check the logs of the rake tasks in both containers
```
$ docker-compose logs
```

Run rake migrate on rails container
```
$ docker-compose run rails rake db:migrate
```

Check if everything went up nicely 
```
$ docker-compose logs
```

Now just check the browser
```
http://mylab.ufsc.br
```

Commit the Dockerfile and the docker-compose.yml into the repo.


## Deploy: Production UFSC Webserver

Connect to UFSC VPN using your UFSC username and password

```
 server: srv1.vpn.ufsc.br

```

Access the server using your server username and password

```
 ssh <username>@150.162.6.107
```

Acess the project folder

```
$ cd /home/camilamaia/mylab
```

Pull the code changes

```
$ git pull origin master
```

Code changes should be added to the container so we must remove the old container that contains an earlier version of the code

Stop all containers associated to compose file
```
$ docker-compose stop 
```

Show the containers list
```
$ docker ps -a -q
```

Remove all containers
```
$ docker rm $(docker ps -a -q) 
```

Remove the images (only necessary when Dockfile has changes)
```
$ docker rmi mylab_rails
```

Show volume info
```
$ docker volume inspect mylab_postgresql_data
 {
        "Name": "mylab_postgresql_data",
        "Driver": "local",
        "Mountpoint": "/var/lib/docker/volumes/mylab_postgresql_data/_data",
        "Labels": null,
        "Scope": "local"
    }
```

The value MountPoint shows where the data is stored on the host machine. So, before you rebuild the containers with the changes made to the code, make a backup of this volume:

```
$ sudo cp -a /var/lib/docker/volumes/mylab_postgresql_data/_data /home/camilamaia/mylab_backup/_data_OLD
```

( If rollback is needed, replace the _data folder content with the _data_OLD content )

Check that the copy was made properly
```
$ ls /home/camilamaia/mylab_backup/
```

Now, let's rebuild the containers

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose run rails rake db:migrate
```

And, check the changes on the browser

```
http://mylab.ufsc.br
```




