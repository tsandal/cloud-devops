#!/bin/bash
read -p "请输入你想创建的虚拟机号:" a 
cd /var/lib/libvirt/images/
qemu-img create -b node.qcow2 -f qcow2 node$a.img 16G  > /dev/null 
cd
cd nsd1807
sed "s,node,node$a," node.xml > /etc/libvirt/qemu/node$a.xml
virsh define /etc/libvirt/qemu/node$a.xml  > /dev/null
for i in { 1..8 }
do
echo -n ----
sleep 0.8
done
echo 虚拟机node$a创建成功
