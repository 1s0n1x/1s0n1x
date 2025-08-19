#!/bin/bash
echo "Bienvenido, SuperUsuario. Espere un momento..."
sudo sysctl -w  net.ipv4.ip_forward=1
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -A FORWARD -i wlo1 -o enp2s0 -j ACCEPT
sudo iptables -A FORWARD -i enp2s0 -o wlo1 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE

echo "Desbloqueo exitoso, Happy Hacking!"
