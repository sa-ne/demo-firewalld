## Firewalld Demo WalkThru

### Requirements
* Minimum VM: 1vCPU x 1G mem, running RHEL 7.latest or RHEL 8.latest

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
* Scenario: remote system that you don't have easy access to, so making a mistake with the firewall config could lead to a RGE (Resume Generating Event)
  * Use the ```--timeout``` parameter to revert changes
  ```
        # firewall-cmd --add-service=ftp --timeout=30s
        # firewall-cmd --list-all
  ```
  * After timeout value, config returns to previous state
  * Wait 30s and issue last command again
* Disable all network traffic (e.g. suspected breach or attack)
  * Warning: your session will lock up immediately!  Make sure you have console access to the test system!
  * Issue the following command from a SSH session, again make sure you can access the system console, your SSH session will lock up.  
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
  * View a specific Service
  ```
        # firewall-cmd --info-service=RH-Satellite-6
  ```
  * Shortcut to apply changes
  ```
        # firewall-cmd --runtime-to-permanent
  ```
* Cleanup via firewalld-cleanup.sh
  * Optional if demo VM is disposable
