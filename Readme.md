# Under development

# Apache Pulsar Ansible

It is group of playbooks to manage apache pulsar. It is also 100% compliant with ansible-lint rules.

## **Requirements**
* Download Apache pulsar Tar on Ansible Server
* vagrant (optional)
* Any OS with SystemD
* Ansible

## **Notes***
```
1. It assumes you have zookeeper already running in localmode or cluster mode.
2. All tasks like broker/jvm/logging/downgrade/removeOldVersion will be done in serial order.
```

## **Extra**
* **Zookeeper Installation**
https://github.com/116davinder/zookeeper-cluster-ansible

# **Production Environment Setup**

## Apache pulsar Playbooks

### **To start new cluster**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterSetup.yml```

### **Tested OS**
* CentOS 7
* RedHat 7

### **Tested Ansible Version**
```
ansible 2.8.1
  config file = None
  configured module search path = ['/home/davinderpal/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.6/dist-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.6.7 (default, Oct 22 2018, 11:32:17) [GCC 8.2.0]
```
