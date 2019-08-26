# demo-firewalld

Quick demo of Firewalld capabilities

### Notes
Firewalld uses the concepts of zones and services, that simplify the traffic management. Zones are predefined sets of rules. Network interfaces and sources can be assigned to a zone.

Firewall services are predefined rules that cover all necessary settings to allow incoming traffic for a specific service and they apply within a zone.  Services use one or more ports or addresses for network communication. Firewalls filter communication based on ports.

### RHEL 7
Still IPTables underneath. Why Firewalld:
* Realtime rule changes without interruption
* Separate network traffic & rules by interface or zones
* GUI and CLI tools

Versus iptables
* Every single change means flushing all the old rules and reading all the new rules
* With firewalld there is no re-creating of all the rules; only the differences are applied
* With firewalld can change the settings during runtime without existing connections being lost

### RHEL 8
For RHEL 8, NFTables as the default brings a more flexible framework for firewall rules to RHEL 8.  Nftables supports IPv4, IPv6, ARP, and bridge rules in a single framework as address families, and helps to eliminate the redundancy of having separate frameworks.

* Consolidated filtering - Supports IPv4, IPv6, ARP, and Bridge filtering in a single tool
* Simpler rule creation - Multiple matches and actions reduce the number of rules required
* Improved tracing - Provides easier debugging and verification of actions taken on any packet

### Examples:

Enable 8080 for http
```
      # firewall-cmd --add-port=8080/tcp --permanent
```
NAT (masquerading) & Port Forwarding
```
      # firewall-cmd --permanent --zone=<ZONE> --add-masquerade
      # firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=2055:toaddr=192.168.0.100
```
Block domain
```
      # firewall-cmd --permanent --zone=block --add-source=172.25.4.0/24
```

### References and Resources
* [Red Hat Documentation - RHEL 7](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using_firewalls)
* [Red Hat Documentation - RHEL 8](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/securing_networks/using-and-configuring-firewalls_securing-networks)
