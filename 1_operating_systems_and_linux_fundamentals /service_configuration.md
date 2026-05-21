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

* `MTA` (Mail Transfer Agent) is software that is responsible for sending and receiving email messages.
  * Postfix -- a popular MTA that is used to send and receive email messages.
  * Simple mail client (e.g. `mail` command) can be used to send email messages from the command line.
  * IMAP (Internet Message Access Protocol) is a protocol used to retrieve email messages from a mail server.
  * Dovecot is a popular IMAP server that is used to retrieve email messages from a mail server.

Email can be local in a Linux server no matter if it is accessed locally or remotely via IMAP.

**MTA Postfix:** -- to send and deliver mail we need an MTA (Mail Transfer Agent) as a minimum. The Postfix server is a command MTA and will listen on TCP port 25. Using the mail client, part of mailutils, we can connect to local MTA and our own mailbox.
* `sudo apt install postfix mailutils` to install Postfix and mail client.
* `ss -ntl` should be listening on port 25 for Postfix.
* `mail -s <subject> <recipient>` to send email from command line. Then use Ctrl+D to end the message body and send the email.
* `mail` to check the mailbox for new messages.

**Using Local Mail:** -- can be very useful, we create a command line task to report on the disk free to the root user. The command could easily be added to a cron job to run once a week or day.
`df -h / > fee.txt && mail root -s "Disk free: $(date +%F)" < free.txt` will create a file with the disk free info and then send it to the root user with the subject containing the date.

**Aliases and IP Versions:** -- install using dpkg-reconfigure. It will ask extra questions on the reconfigure. We can configure local networks to act as a mail relay for and if we want to listen on all IP versions. Aliases can redirect message for users such as root.
* `cat /etc/aliases` to view the current aliases configured on the system. `newaliases` to update the aliases database after making changes to the /etc/aliases file.
* `sudo dpkg-reconfigure postfix` to reconfigure Postfix and set up aliases and IP version listening.
* `sudo systemctl restart postfix` to restart the Postfix service after making changes to the configuration.

**Remote Access:** users may not have access to the mail server from the command line. You would expect users to access their mail remotely. This is where we would need an IMAP or POP3 server.
* `sudo apt install dovecot-imapd` to install Dovecot IMAP server.
* `ss -ntl #993 IMPAS  143 IMAP` to check that Dovecot is listening on the correct ports for IMAP.

* `sudo apt install mutt` to install the Mutt email client, which can be used to access email messages from the command line. (This is similar to e.g. Thunderbird but for the command line.)
* `vim .muttrc` to create a configuration file.
* `set imap_user = <email>` to set the IMAP username in the Mutt configuration file.
* `set imap_pass = <password>` to set the IMAP password in the M
* `mutt` to start the Mutt email client and access email messages from the command line.

**Mail Exchange Records:** -- if external users, ie the world needed to send email to us their MTA would need to be able to resolve the MTAs for our domain. This is what MX records are used for.