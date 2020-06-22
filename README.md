# Overview

This repository contains a set of small tutorial examples aimed at helping people learn the basics of Links programming.

The rest of this README explains how to create virtual machine containing Links, and how to set it up to use a (Postgres) database.

Detailed instructions for each program are found on the [wiki](https://github.com/links-lang/links-tutorial/wiki).

# Installing Links on a fresh VM using VirtualBox / Vagrant

The following instructions explain how to install Links in a freshly installed Ubuntu 16.04 machine.  You can use [VirtualBox](https://www.virtualbox.org/) manually or use [Vagrant](http://www.vagrantup.com/) to automate most of the steps.  If you use Vagrant, you can use the `Vagrantfile` and `setup.sh` files in this repository: placing them in a new directory and typing "vagrant up" should perform the first three steps automatically.  If this doesn't work, though, following the steps manually may help you to understand why.


1.  Set up a fresh Ubuntu/bionic64 virtual machine.  (Older or other virtual machines may work but this choice eases automatic installation of the OCaml compiler and package manager.)  One can do this manually using VirtualBox by downloading the appropriate disk images and installing, or more automatically using Vagrant and the Ubuntu standard vm images.

2.  Set up IP forwarding for the VM from an appropriate host port (such as 8081) to Links's default port 8080 within the guest VM.  Again, one can do this manually using VirtualBox or by adding an appropriate line of configuration to the Vagrantfile.

3.  Within the VM, execute the following commands: 
    ```
    $ sudo add-apt-repository ppa:avsm/ppa -y
    $ sudo apt update
    $ sudo apt install -y m4 sqlite3 libsqlite3-dev opam
    $ opam init -a
    $ opam switch create 4.10.0
    $ eval $(opam env)
    $ opam install -y sqlite3 links links-sqlite3
    ```
Again, if using Vagrant then one can automate this by placing the commands in a script "setup.sh" and configuring the Vagrantfile.  (This will take several minutes.)

4.  To test that Links is working correctly, try running the command `linx --help`, which should print out a help message.  Then do the following (starting from home directory):
    ```
    cd .opam/4.10.0/share/links
    linx --path=examples:examples/games examples/webserver/examples-nodb.links
    ```
The second command should not return; it starts a Web server running on port 8080 of the VM, which should be mapped to port 8081 of your machine.  Stopping this process (`control-C`) will kill the server.

5. To test that the examples are working, visit url:
    ```
    http://localhost:8081/examples/
    ```
(type this exactly; if you forget the trailing slash you will likely get "Nope", Links's terse HTTP 404 error message.)  This should result in a web page with links to a number of example programs, and to their source code.  However, only the examples that do not require the database will work; configuring the examples that do use the database requires more work.



# Setting up Links for use with an external database

The tutorial examples work using sqlite3, an easy-to-use library providing database capabilities, but they can also be run on a database server such as PostgreSQL or MySQL.  This requires setting up appropriate accounts and permissions on the server, installing the appropriate OPAM package (e.g. `links-postgresql`), and configuring Links to access the database.

Please follow the instructions [here](https://github.com/links-lang/links/wiki/Database-setup) regarding how to set up Links for use with a (Postgres) database.  Currently MySQL is unsupported but we plan to restore support for it soon.
