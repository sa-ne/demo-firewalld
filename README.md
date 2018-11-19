# demo-firewalld

Quick demo of Firewalld capabilities

Still IPTables underneath. Why Firewalld:
* Realtime rule changes without interruption
* Separate network traffic & rules by interface or zones
* GUI and CLI tools

Versus iptables
* Every single change means flushing all the old rules and reading all the new rules
* With firewalld there is no re-creating of all the rules; only the differences are applied
* With firewalld can change the settings during runtime without existing connections being lost


Examples:

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

[Red Hat Documentation]()
