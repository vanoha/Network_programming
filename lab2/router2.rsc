# nov/22/2022 13:59:42 by RouterOS 7.6
# software id = 
#
/interface bridge
add name=Loopback
/interface ovpn-client
add certificate=profile-10.ovpn_1 cipher=aes256 connect-to=158.160.32.81 \
    mac-address=02:0E:DF:24:5B:9A name=ovpn-out1 port=443 user=vanoha_2
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing id
add disabled=no id=172.16.0.1 name=OSPF_ID select-dynamic-id=""
add disabled=no id=172.16.0.1 name=OSPF_ID select-dynamic-id=""
/routing ospf instance
add disabled=no name=ospf-instance-l originate-default=always router-id=\
    OSPF_ID
/routing ospf area
add disabled=no instance=ospf-instance-l name=Backbone
/ip address
add address=10.10.10.1/30 interface=ether1 network=10.10.10.0
add address=172.16.0.1 interface=Loopback network=172.16.0.1
/ip dhcp-client
add interface=ether1
/routing ospf interface-template
add area=Backbone auth=md5 auth-key=10072001 disabled=no interfaces=ether1
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.ru.pool.ntp.org
