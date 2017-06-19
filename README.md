# Installing Links on a fresh VM using VirtualBox / Vagrant

The following instructions explain how to install Links in a freshly installed Ubuntu 16.04 machine.  You can use [VirtualBox](https://www.virtualbox.org/) manually or use [Vagrant](http://www.vagrantup.com/) to automate most of the steps.  If you use Vagrant, you can use the `Vagrantfile` and `setup.sh` files in this repository: placing them in a new directory and typing "vagrant up" should perform the first three steps automatically.  If this doesn't work, though, following the steps manually may help you to understand why.


1.  Set up a fresh Ubuntu/xenial32 or xenial64 (as appropriate) virtual machine.  One can do this manually using VirtualBox by downloading the appropriate disk images and installing, or more automatically using Vagrant and the Ubuntu standard vm images.

2.  Set up IP forwarding for the VM from an appropriate host port (such as 8081) to Links's default port 8080 within the guest VM.  Again, one can do this manually using VirtualBox or by adding an appropriate line of configuration to the Vagrantfile.

3.  Within the VM, execute the following commands: 
    ```
    $ sudo apt install -y m4 postgresql libpq-dev opam
    $ opam init -a
    $ opam switch 4.04.0
    $ eval `opam config env`
    $ opam install -y postgresql links
    ```
Again, if using Vagrant then one can automate this by placing the commands in a script "setup.sh" and configuring the Vagrantfile.  (This will take several minutes.)

4.  To test that Links is working correctly, do the following (starting from home directory):
    ```
    cd .opam/4.04.0/share/links
    linx -m --path=examples:examples/games examples/webserver/examples-nodb.links
    ```
The second command should not return; it starts a Web server running on port 8080 of the VM, which should be mapped to port 8081 of your machine.  Stopping this process will kill the server.

5. To test that the examples are working, visit url:
    ```
    http://localhost:8081/examples/
    ```
(type this exactly; if you forget the trailing slash you will likely get "Nope", Links's terse HTTP 404 error message.)  This should result in a web page with links to a number of example programs, and to their source code.  However, only the examples that do not require the database will work; configuring the examples that do use the database requires more work.



# Setting up Links for use with a database

Please follow the instructions [here](https://github.com/links-lang/links/wiki/Database-setup) regarding how to set up Links for use with a (Postgres) database.
