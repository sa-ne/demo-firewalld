## Firewalld Demo WalkThru

### Requirements


### WalkThru
* Setup via /root/demos/firewalld-setup.
  * Installs & starts Apache
  * Will need root or sudo to install packages
  
# firewall-cmd --state
# firewall-cmd --list-all

Try http://demos or https://demos
# firewall-cmd --add-service=http --add-service=https --permanent
# firewall-cmd --reload
Try http://demos or https://demos again

Example enable 8080 for http
# firewall-cmd --add-port=8080/tcp --permanent

Cleanup via firewalld-cleanup.sh
Optional if demo VM is disposable
