#!/bin/sh
sudo add-apt-repository ppa:avsm/ppa -y
sudo apt update
sudo apt install -y m4 sqlite3 libsqlite3-dev pkg-config opam 
opam init -a
opam switch create 4.10.0
eval $(opam env)
opam install -y sqlite3 links links-sqlite3
ln -s /vagrant links-tutorial

