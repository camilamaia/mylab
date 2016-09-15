# MyLab

Aplicação Web para Controle de Estoques do Laboratório de Toxicologia da Universidade Federal de Santa Catarina

Atualmente, o laboratório tenta desenvolver seu próprio método de controle de estoque, porém, de maneira falha. Materiais acabam, produtos estão fora da validade e nada disso é percebido até se deparar com o problema, causando perda de tempo e dinheiro. 

O MyLabt é uma ferramenta que otimiza a gerência de estoque. Que, além do registro dos itens armazenados de maneira clara e organizada, também envia avisos importantes aos responsáveis, sempre mantendo-os cientes do estado do estoque. 

O intuito é que o profissional responsável pelo estoque tenha menos tempo gasto com a manutenção do estoque em si, podendo estar livre para exercer outras tarefas, tendo a garantia de que os produtos estão bem monitorados.

## Deploy: Localhost

### Requirements

* Ruby - This project uses `.ruby-version`, `.ruby-gemset` and `Gemfile` to specify dependencies. Make sure that `rvm` or `rbenv` is installed on your computer. Check `rvm info` command to see that the correct ruby version and gemset are set. Also make sure that `./bin` is in your `$PATH` in the first place.
* Rails 4

### Repositories Setup

```bash
 git clone git@github.com:camilamaia/mylab.git
 cd mylab
 bundle
 bundle update
```

### Postgres Setup
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
