addNat(){
echo "Outside port: "
read outport
echo "Inside port: "
read inport
echo "Internal IP: "
read lhost
echo "Router IP: "
read rhost

sudo iptables -t nat -A PREROUTING -p tcp --dport $outport -j DNAT --to-destination $lhost:$inport

sudo iptables -t nat -A POSTROUTING -p tcp -d $lhost --dport $inport -j SNAT --to-source $rhost


}
