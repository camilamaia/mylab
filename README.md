# MyLab

Web Application for Stock Management for the laboratory "Laboratório de Pesquisas Toxicológicas" (LPTox) from the university "Universidade Federal de Santa Catarina"

Website: https://agile-springs-54168.herokuapp.com/

## Deploy: Localhost

### Requirements

* Ruby - This project uses `.ruby-version`, `.ruby-gemset` and `Gemfile` to specify dependencies. Make sure that `rvm` or `rbenv` is installed on your computer. Check `rvm info` command to see that the correct ruby version and gemset are set. Also make sure that `./bin` is in your `$PATH` in the first place.
* PostgreSQL 9.4

### Repositories Setup

```bash
 git clone git@github.com:camilamaia/mylab.git
 cd mylab
 gem install rails -v 4.2.0
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

## Deploy: Production

From mylab directory, with your changes already pushed to git:
```
$ git push heroku master
```

or, for a specific branch:

```
$ git push heroku yourbranch:master
```
