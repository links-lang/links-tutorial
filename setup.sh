#!/bin/sh
sudo add-apt-repository ppa:avsm/ppa -y
sudo apt update
sudo apt install -y m4 postgresql libpq-dev pkg-config opam 
opam init -a
opam switch 4.10.0
eval $(opam env)
opam install -y postgresql links links-postgresql
ln -s /vagrant links-tutorial

