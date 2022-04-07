@################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
&####BBBBBB#P:5#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@&&&###BBBBB!.B#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@##BBBBP ?#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@&##BBBB7.B#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@##BBBBG.7##@@&&&&&&&&&&&&@&&&@&&&&&&&&&&&&&&&&
@@@&##BBBB? G#&@&####BBBBBB#P?B#&&####BBBBBB#5JB#&
@@@##BBBBB:~##@@&&###BBBBBBB^:##@&&####BBBBBB.~##@
@@&##BBBBJ P#&@@@@@@##BBBBB5 Y#&@@@@@&##BBBBJ P#&@
@@##BBBBB:^##&&&&&&&##BBBBB~:##@@@@@@&##BBBB:^##@@
@&##BBBBG75###BBBBBB##BBBBP J#&@@@@@@##BBBBY 5#&@@
@&#BBBBBBBBBBBBBBBBBBBBBBB!.B#@@@@@@&##BBBB^:##@@@
&##BBBBBBBBBBBBBBBBBBBBBBG ?#&@@@@@@##BBBB5 Y#&@@@
&########################? G#&@@@@@&##BBBB~.B#@@@@
@@@@@@@@@@@@@@@@@@&######? G&&@@@@&##BBBBP J#&@@@@
@@@@@@@@@@@@@@@@@@&##BBBBB!~PB#&&###BBBBB:~##@@@@@
@@@@@@@@@@@@@@@@@@@##BBBBBBG5PGBBBBBBBBP^!B#@@@@@@
@@@@@@@@@@@@@@@@@@@&##BBBBBBBBBBBBBBBP?!Y#&@@@@@@@
@@@@@@@@@@@@@@@@@@@@@&####BBBBBBBGP555P#&@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@&&&#########&&@@@@@@@@@@@@

# Sparky 

### The helfpul little eagle

Sparky is a one-stop shop for a lot of useful sysadmin and system hardening scripts, all written in-house just for Sparky.  

## Modules

- #### Template 1 Title
	This script will prompt for two inputs:
		1. Input1 - Controls the value for function abc.  (Optional)
		2. Input2 - Required IP address of host
		
	This script does A, B, and C.  Please keep in mind that while A and B are reversable, C is not.  
	
- ### log_cmd
	log_cmd will setup a trap to log all text entered into any terminal by placing a script that will run on any login in /etc/profile.d/ called zloggingbash.sh
	There should be no side-effects associated with the script.  If there are, remove zloggingbash.sh and reload your terminal.  
	
- ### addNat
	addNat adds an iptables rule to the nat rules that directs the traffic from the outport on rhost to the inport on lhost and vice versa.
	1. port1 - The first port to forward.  Put it in the format <port>/<tcp or udp> (eg: 80/tcp)
	2. port2 - The second port to forward. .Format is the same as port1. 
	3. SSH prompt (case sensitive) - Adds a rule for SSH or not.  
	
	Please note that this script denies all incoming traffic from all ports unless specified.  
