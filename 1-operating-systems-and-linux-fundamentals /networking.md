## Configuring IP Addresses

### Managing Transient IP Addresses

`ip address show` or `ip addr` is a powerful command that displays all network interfaces and their associated IP addresses. 
`ip link show` or `ip link` shows the status of network interfaces (up/down).

* en = ethernet
* lo = loopback (localhost)
* wlp = wireless
* p0 = physical (PCI) network interfaces
* s3 = software (virtual) network interfaces

```bash
sudo ip addr add <IP_ADDRESS>/<PREFIX_LENGTH> dev <INTERFACE> #(e.g. 192.168.1.1/24 dev enp0s3)
# dev(device) specifies the network interface to which the IP address will be assigned.

sudo ip addr del <IP_ADDRESS>/<PREFIX_LENGTH> dev <INTERFACE>
```

**NOTE:** These changes are temporary and will be lost after a reboot. To make them permanent, you need to configure the network settings using netplan or another network management tool.

---

### Persistent IP Addresses

* managed using netplan
* /etc/netplan/*.yaml
* /usr//sbin/netplan

`netplan info` shows the current network configuration
`sudo netplan ip leases <INTERFACE>` shows the DHCP leases for a specific interface

In the dir `/etc/netplan/`, you will find YAML files that define the network configuration. You can edit these files to set static IP addresses or configure DHCP.

```yaml
---
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.2.201/24]
```

After editing the YAML file, apply the changes with:

```bash
sudo netplan try # Test the configuration before applying it permanently the default timeout is 120 seconds
sudo netplan apply # Apply the configuration permanently
```

---

## Configuring Hostname and Hostname Resolution

### Hostnames and Resolution

* `hostnamectl` is a command used to query and change the system hostname and related settings.
  * `/etc/hostname` contains the static hostname of the system.
  * `/etc/machine-id` contains a unique identifier for the machine.
  * `/etc/machine-info` contains additional information about the machine, such as its architecture and operating system.
  * `/etc/os-release` contains information about the operating system, such as its name and version.
  * `systemd-hostnamed` is a system service that manages the hostname and related settings on a Linux system.
* `systemd-resolved` is a system service that provides network name resolution to local applications. It can be used to resolve hostnames to IP addresses and vice versa, as well as to manage DNS settings on the system.
  * `/etc/systemd/resolved.conf` is the main configuration file for systemd-resolved, where you can specify DNS servers, search domains, and other settings related to name resolution.
  * `/etc/nsswitch.conf` is a configuration file that specifies the order in which different sources of name resolution are used, such as DNS, local files, and LDAP.
  * `/etc/resolv.conf` is a configuration file that specifies the DNS servers to be used for name resolution on the system.
* `dig` is a command-line tool used for querying DNS servers to obtain information about domain names and IP addresses.

```bash
hostnamectl # Displays the current hostname and related information

# Set the static hostname and other related settings
hostnamectl set-hostname <NEW_HOSTNAME> # Changes the system hostname to NEW_HOSTNAME
hostnamectl set-deployment <DEPLOYMENT> # Sets the deployment environment (e.g., production, staging, development)
hostnamectl set-location <LOCATION> # Sets the physical location of the machine (e.g., datacenter, office)
```

---

**Investigate name resolution ordering:**

* /etc/hosts
* dns
* /etc/nsswitch.conf
* `getent hosts` <HOSTNAME> # Displays the IP address associated with the specified hostname, using the configured name resolution order.

---

### Configuring LLMNR (Link-Local Multicast Name Resolution)

**LLMNR** is a protocol that allows devices on the same local network to resolve each other's hostnames without the need for a central DNS server. It is typically used in small networks or in situations where a DNS server is not available.

* `resolvectl status` shows the current status of the system's name resolution configuration, including the configured DNS servers and search domains.
* `/etc/resolv.conf` is a configuration file that specifies the DNS servers to be used for name resolution on the system.
* `/etc/systemd/resolved.conf` is the main configuration file for systemd-resolved, where you can specify DNS servers, search domains, and other settings related to name resolution.
* `systemd-resolved.service` is a system service that provides network name resolution to local applications.
* `dig` is a command-line tool used for querying DNS servers to obtain information about domain names and IP addresses.

---

### Implementing an NTP Client

**Network Time Protocol** (NTP) is a protocol used to synchronize the clocks of computers over a network. An NTP client is a software application that runs on a computer and communicates with an NTP server to obtain the correct time.

* `timedatectl` is a command-line tool used to query and change the system's time and date settings.
  * `timezone`
  * `set-ntp` enable ntp client
  * `timesync-status` shows the current status of the system's time synchronization.
  * `show-timesync` displays detailed information about the current time synchronization status.
  * `systemd-timesyncd` is a system service that provides NTP client functionality on Linux systems.
* Configuring NTP client
  * `/etc/systemd/timesyncd.conf` is the main configuration file for systemd-timesyncd, where you can specify the NTP servers to be used for time synchronization.

```bash
timedatectl
sudo timedatectl set-timezone <TIMEZONE> # Set the system timezone (e.g., "Europe/London")
systemctl status systemd-timesyncd # Check the status of the NTP client service
sudo timedatectl set-ntp true # Enable the NTP client to synchronize the system clock with NTP servers
```

* `timedatectl timesync-status` shows the current status of the system's time synchronization, including whether it is synchronized with an NTP server and the source of the time synchronization.
* `timedatectl show-timesync` displays detailed information about the current time synchronization status
* `sudo vim /etc/systemd/timesyncd.conf` allows you to edit the configuration file for systemd-timesyncd, where you can specify the NTP servers to be used for time synchronization.
* `sudo timedatectl set-ntp false && sudo timedatectl set-ntp true` restarts the NTP client service to apply any changes made to the configuration file.

---

### Network Routing

Routing: Delivery of packets from source to destination across multiple networks.

* `ip` is a powerful command used to manage network interfaces, routing tables, and other network-related settings on Linux systems.
  * `ip route` shows the current routing table, which contains information about how packets should be routed to different destinations based on their IP addresses.
  * `ip route add` allows you to add a new route to the routing table, specifying the destination network, gateway, and other parameters.
  * `ip route del` allows you to delete an existing route from the routing table.
* `sysctl` is a command used to modify kernel parameters at runtime.
* `netplan` to add persistent routes

**Router:**
Packet forwarding, or routing, is when a device (router) receives packets from other systems not destined for itself. Those packets are routed to the correct destination network.

* `sysctl -ar ip_forward` shows the current value of the IP forwarding kernel parameter, which determines whether the system is allowed to forward packets between network interfaces.
* We can store the settings in the `etc/sysctl.conf` or `/etc/sysctl.d/`
* `sudo sysctl -p` applies the changes made to the sysctl configuration files.