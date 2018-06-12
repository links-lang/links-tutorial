#!/bin/sh
sudo apt update
sudo apt install -y m4 postgresql libpq-dev pkg-config opam
opam init -a
opam switch 4.06.0
eval `opam config env`
opam install -y postgresql links links-postgresql
ln -s /vagrant links-tutorial

