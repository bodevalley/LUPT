     (                                                       )                                 (                             
     )\ )                      )           )    )         ( /(       (        (           (    )\ )                       )  
    (()/(           )  (    ( /( (      ( /( ( /(    (    )\())   (  )\       )\ )    (   )\  (()/(     (   (          ( /(  
     /(_))`  )   ( /(  )(   )\()))\ )   )\()))\())  ))\  ((_)\   ))\((_)`  ) (()/(   ))\ ((_)  /(_)) (  )(  )\  `  )   )\()) 
    (_))  /(/(   )(_))(()\ ((_)\(()/(  (_))/((_)\  /((_)  _((_) /((_)_  /(/(  /(_)) /((_) _   (_))   )\(()\((_) /(/(  (_))/  
    / __|((_)_\ ((_)_  ((_)| |(_))(_)) | |_ | |(_)(_))   | || |(_)) | |((_)_\(_) _|(_))( | |  / __| ((_)((_)(_)((_)_\ | |_   
    \__ \| '_ \)/ _` || '_|| / /| || | |  _|| ' \ / -_)  | __ |/ -_)| || '_ \)|  _|| || || |  \__ \/ _|| '_|| || '_ \)|  _|  
    |___/| .__/ \__,_||_|  |_\_\ \_, |  \__||_||_|\___|  |_||_|\___||_|| .__/ |_|   \_,_||_|  |___/\__||_|  |_|| .__/  \__|  
         |_|                     |__/                                  |_|                                     |_|            

### The helpful little eagle

Sparky is a one-stop shop for a lot of useful sysadmin and system hardening scripts, all written in-house just for Sparky.  

## Modules
	
#### Static Ubuntu
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		
	This script sets the static IP for an Ubuntu box to the specified IP on the specified interface. This will copy the original config file to the
	/tmp/backup.netplan if anything goes wrong to restore the intial configuration. This will also do the 'sudo netplan apply' for you.
	
#### Static Kali
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		
	This script sets the static IP for a Kali box to the specified IP on the specified interface. This will copy the original config file to the
	/tmp/backup.interfaces if anything goes wrong to restore the intial configuration. This will also do the 'sudo systemctl restart networking' for you.
	
#### Static CentOS
	This script will prompt for two inputs:
		1. IP - IP to set interface to (ex. 192.168.2.5)
		2. Interface - Interface to set IP to (ex. eth0, ens33) 
		3. Netmask - Netmask to set on the IP Configuration (ex. 255.255.0.0 for /16)
		
	This script sets the static IP for a Kali box to the specified IP on the specified interface. This will copy the original config file to the
	/tmp/backup.static if anything goes wrong to restore the intial configuration. This will also do the 'sudo systemctl restart networking' for you.
	
#### Alias On
	This script will give the red team a little taste of their medicine. This will go in and append a list of aliases for common commands to make common
	commands like ls, cat, and others simply run the command 'echo' which will be useless. However for the blue team there will be aliases added for the reverse
	of the command to work like the normal command example is 'sl' for 'ls' or 'tac' for 'cat'. 
	
#### Alias Off
	This script reverses the aliases done in the 'Alias On' Module. It will take the copy of .bashrc created in the 'Alias On' module and overwrite the changed
	.bashrc. IMPORTANT: One note is you must run the command 'source ~/.bashrc' and restart your terminal to clear the bad aliases.
	
#### Scan
	This script will save the contents of the file system and save them to /tmp/files.txt and then grep the txt document for different trigger words such as red
	or team along with other words or extensions. The grep results will be readable in the /tmp/sus.txt file.
	
#### ChattrOn
	This script will add an immutable attribute on a list of important files such as /etc/passwd or /etc/shadow. This will make the files unchangable by the red
	team unless they remove immutability
	
#### ChattrOff
	This script will remove the immutable attribute on a list of important files that ChattrOn added. This will unlock the files to be changed.
	
#### Set File Permissions
	This script will simply set best practices permissions on a list of important files.

#### Enable UFW
	This script will enable a host-based firewall. IT will take 3 inputs.
		1. port1 - The first port to open for the firewall.  Put it in the format <port>/<tcp or udp> (eg: 80/tcp)
		2. port2 - The second port to open for the firewall. .Format is the same as port1. (Optional)
		3. SSH prompt (case sensitive) - Adds a rule for SSH or not. 
	This will open the specified ports while enabling UFW on the machine
	
#### Add Persistence
	This script will add two user accounts hidden as service accounts systemd-sync and systemd-recall. These accounts will be put in the systemd group and given
	a 569 and 570 UID. They will not be given a home directory. The script will prompt the user for new passwords for both users which must be noted in the
	password excel
	
#### Add Backup Cronjobs
	This script will add 7 cronjobs to run every 5 minutes. These jobs will copy certain important files to a hidden directory in the home directory called
	~/.backupCron. The files will be stored in different directories depending on the service they configure or if they are simply generally important files.

#### log_cmd
	log_cmd will setup a trap to log all text entered into any terminal by placing a script that will run on any login in /etc/profile.d/ called zloggingbash.sh
	There should be no side-effects associated with the script.  If there are, remove zloggingbash.sh and reload your terminal.  
	
#### addNat
	addNat adds an iptables rule to the nat rules that directs the traffic from the outport on rhost to the inport on lhost and vice versa.
	1. port1 - The first port to forward.  Put it in the format <port>/<tcp or udp> (eg: 80/tcp)
	2. port2 - The second port to forward. .Format is the same as port1. 
	3. SSH prompt (case sensitive) - Adds a rule for SSH or not.  
	
	Please note that this script denies all incoming traffic from all ports unless specified.  
	
#### netlog
	netlog logs all tcp incoming network traffic to /var/log/iptables_networklogging.log.  It also reloads rsyslog.  
	Noteworthy information:
		SRC - Source address for connection
		DPT - Port connected to
