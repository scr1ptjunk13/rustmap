#!/bin/bash


echo -e "\n=== Basic Local Scan ==="
cargo run -- -a 127.0.0.1


echo -e "\n=== Greppable Output ==="
cargo run -- -a 127.0.0.1 -g



echo -e "\n=== Scan Public DNS ===" //range capability
cargo run -- -a 8.8.8.8 -r 50-100

#Python UDP responder
sudo python3 -c "
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9999))
while True:
    data, addr = s.recvfrom(1024)
    s.sendto(b'hello', addr)
"

#for UDP responder
./cargorun -- -a 127.0.0.1 -r 9999 --udp

scanme.nmap.org
cargo run -- -a scanme.nmap.org -r 1-100


//time :

time cargo run -- -a 127.0.0.1



#UDP servers check :
./cargorun -- -a 192.168.1.1 -r 67 --udp #67/udp - DHCP SERVER
./cargorun -- -a 192.168.1.1 -r 67 --udp #68/udp - DHCP CLIENT
./cargorun -- -a 192.168.1.1 -r 169 --udp #169/udp - SEND (SEcure Neighbor Discovery)
./cargorun -- -a 192.168.1.1 -r 53 --udp #53/udp - DOMAIN
./cargorun -- -a 192.168.1.1 -r 69 --udp #69/udp - TFTP





#for time checking and comparison
#time nmap -p- scanme.nmap.org
#time cargo run -- -a scanme.nmap.org -r 1-65535 --timeout 1000 --batch-size 5000 -- -Pn

#If a port is closed, the host may respond with ICMP Port Unreachable — which scanner looks for.
#Firewalls often drop UDP traffic silently, making results ambiguous (filtered vs. open|filtered).


#port scanning is an IO bound task - open 1000s of ports - Tokio async runtime

