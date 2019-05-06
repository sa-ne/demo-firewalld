## Firewalld Demo WalkThru

### Requirements
* Minimum VM: 1vCPU x 1G mem, running RHEL 7.latest

### WalkThru
* Setup via firewalld-setup.sh
  * Installs & starts Apache
  * Will need root or sudo to install packages
* View current firewall config
  * Note the zone currently active
  * Also any services or ports currently open
```  
# firewall-cmd --state
# firewall-cmd --list-all
```
* Try http://demo-vm (substitute hostname of your demo VM)
  * This should fail
* Enable firewall rule
```
# firewall-cmd --add-service=http --permanent
# firewall-cmd --reload
```
* Try http://demo-vm again
  * This should work, you should see Red Hat default apache start page
* Try something dumb, but leave a way to save yourself
  * Scenario: remote system that you don't have easy access to, so making a mistake with the firewall config could lead to a "resume generating event"
  * Use the ```--timeout``` parameter to revert changes
  ```
  # firewall-cmd --add-service=ftp --timeout=30s
  # firewall-cmd --list-all
  ```
  * After timeout value, config returns to previous state
  * Wait 30s and issue last command again
* Disable all network traffic (e.g. suspected breach or attack)
  * For best results, issue the following command from a SSH session.  Warning: your session will lock up immediately
  ```
  # firewall-cmd --panic-on
  ```
  * Now login to the VM console.  Trying pinging the local gateway.  No traffic is allowed in or out!
  * Re-enable with the following command.  Your SSH session should un-freeze.
  ```
  # firewall-cmd --panic-off
  ```
* Other Examples
  * Enable 8080 for http
  ```
  # firewall-cmd --add-port=8080/tcp --permanent
  ```
  * View predefined Services
  ```
  # firewall-cmd --get-services
  ```
* Cleanup via firewalld-cleanup.sh
  * Optional if demo VM is disposable
