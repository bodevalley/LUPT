       (                                  
      )\ )                      )        
     (()/(           )  (    ( /( (      
     /(_))`  )   ( /(  )(   )\()))\ )   
     (_))  /(/(   )(_))(()\ ((_)\(()/(   
     / __|((_)_\ ((_)_  ((_)| |(_))(_))  
     \__ \| '_ \)/ _` || '_|| / /| || |  
     |___/| .__/ \__,_||_|  |_\_\ \_, |  
          |_|                     |__/   

### The helfpul little eagle

Sparky is a one-stop shop for a lot of useful sysadmin and system hardening scripts, all written in-house just for Sparky.  

## Modules

#### Template 1 Title
	This script will prompt for two inputs:
		1. Input1 - Controls the value for function abc.  (Optional)
		2. Input2 - Required IP address of host
		
	This script does A, B, and C.  Please keep in mind that while A and B are reversable, C is not.  
	
#### Static Ubuntu
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		
	This script sets the static IP for an Ubuntu box to the specified IP on the specified interface. This will copy the original config file to the 		/tmp/backup.netplan if anything goes wrong to restore the intial configuration. This will also do the 'sudo netplan apply' for you.
	
#### Static Kali
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		
	This script sets the static IP for a Kali box to the specified IP on the specified interface. This will copy the original config file to the 			/tmp/backup.interfaces if anything goes wrong to restore the intial configuration. This will also do the 'sudo systemctl restart networking' for you.
	
#### Static CentOS
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		3. Netmask - Netmask to set on the IP Configuration (ex. 255.255.0.0 for /16)
		
	This script sets the static IP for a Kali box to the specified IP on the specified interface. This will copy the original config file to the 			/tmp/backup.static if anything goes wrong to restore the intial configuration. This will also do the 'sudo systemctl restart networking' for you.
	

#### log_cmd
	log_cmd will setup a trap to log all text entered into any terminal by placing a script that will run on any login in /etc/profile.d/ called zloggingbash.sh
	There should be no side-effects associated with the script.  If there are, remove zloggingbash.sh and reload your terminal.  
	
#### addNat
	addNat adds an iptables rule to the nat rules that directs the traffic from the outport on rhost to the inport on lhost and vice versa.
	1. port1 - The first port to forward.  Put it in the format <port>/<tcp or udp> (eg: 80/tcp)
	2. port2 - The second port to forward. .Format is the same as port1. 
	3. SSH prompt (case sensitive) - Adds a rule for SSH or not.  
	
	Please note that this script denies all incoming traffic from all ports unless specified.  
	
