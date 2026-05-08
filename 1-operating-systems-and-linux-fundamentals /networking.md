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

