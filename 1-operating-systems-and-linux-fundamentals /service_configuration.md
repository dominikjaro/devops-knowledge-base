* **SSH (Secure Shell)** is a protocol used to securely connect to remote servers and manage them.
* **DNS (Domain Name System)** is a system that translates human-readable domain names into IP addresses.
* **Apache** is a popular web server software that serves web pages to clients.
* **MariaDB** is a popular open-source database management system that is used to store and manage data for web applications.
* **Email servers** are used to send and receive email messages.
* **Containers** are a lightweight form of virtualization that allows you to run applications in isolated environments.
* **Virtual Machines** are a more traditional form of virtualization that allows you to run multiple operating systems on a single physical machine.

## Managing SSH Servers and Clients

* **SSH Keys** are used to authenticate users when connecting to SSH servers.
* **SSH Client Options** allow you to customize the behavior of the SSH client when connecting to servers.
* **SSH Server Options** allow you to customize the behavior of the SSH server when accepting connections from clients.

### SSH Server Options

`/etc/ssh/sshd_config` is the configuration file for the SSH server.
* `sshd -T` can be used to test the configuration file for syntax errors and see the runtime configuration of the SSH server.
* **PermitRootLogin** is an option that controls whether the root user can log in via SSH.
* **PasswordAuthentication** is an option that controls whether password authentication is allowed for SSH connections.
* `sudo systemctl restart sshd` can be used to restart the SSH server after making changes to the configuration file.
  
### SSH Client

* `ssh-keygen` is a command used to generate SSH keys for authentication.
* `ssh-copy-id` is a command used to copy SSH keys to a remote server for passwordless authentication.
* `ssh-agent` to cache SSH keys in memory and `ssh-add` to add keys to the agent for use in SSH connections.\
  * `eval "$(ssh-agent -s)"` can be used to start the SSH agent and set the necessary environment variables.
* `ssh-add` can be used to add SSH keys to the agent for use in SSH connections.
* `ssh -o` can be used to specify options for the SSH client when connecting to a server (press TABTAB to see available options). 

---

## Configuring DNS Zones

*`sudo ss -tulnp` can be used to check which services are listening on which ports, including DNS servers.
* `cat /etc/resolv.conf` can be used to view the current DNS resolver configuration on a Linux system.
* `resolvconf` is a utility that manages the DNS resolver configuration on a Linux system.
* `dig` is a command-line tool used to query DNS servers and retrieve information about domain
* `resolvectl` is a command-line tool used to manage the DNS resolver configuration on a Linux system.

---

## Configuring Email Servers