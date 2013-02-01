## This is a simple experiment with Vagrant, Puppet & nginx in _creating an automatic failover load-balancer_

### Requirements
 * Virtual box (https://www.virtualbox.org/, v4.2.6 +)
 * Vagrant (http://www.vagrantup.com/, v1.0.6 +)
 * A Vagrant base box (http://www.vagrantbox.es/). The base box should have puppet already installed. This experiment was performed using a Debian Squeeze 64 box.
 
    ```
      cd nginx-lb
      vagrant box add debiansqueeze64 https://s3-sa-east-1.amazonaws.com/willian-boxes/DebianSqueeze64.box
    ```

### Running the nginx-lb

Configure the `lb1.pp` (and optionnaly `lb2.pp`) manifests located in `nginx-lb/puppet/vagrant-manifests` so the `servers` arrays points
to two or more distinct HTTP services running on a local or distant host.

Then, start your ngins
 ```
   cd nginx-lb
   vagrant up lb1
 ```
 
You should be able to access the HTTP services you configured in `lb1.pp` at http://33.33.33.10 (and lb2 at http://33.33.33.20)

Shutdown any of the configured HTTP services and you will still be able to access the remaining of the HTTP services through lb1.

### Known issues

Depending on the selected box, the `/etc/udev/rules.d/70-persistent-net.rules` file might not have been reset on first boot.
The Vagrant manifest will remove the file automatically, but a `vagrant reload lb1` is required to load all the network interfaces,
including eth1 accessible at 33.33.33.10.

### Credits

Greatly inspired by zsprackett's tutorial @ https://github.com/zsprackett/vagrant-tutorial
