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

## Apache Pulsar Playbooks

### **To start new cluster**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterSetup.yml```

### **To upgrade cluster**
It will upgrade broker first then bookeeper nodes in the rolling fashion.
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterUpgrade.yml```

### **To restart whole cluster**
It will restart broker first then bookeeper nodes in the rolling restart fashion.

```ansible-playbook -i inventory/<environment>/cluster.ini clusterRollingRestart.yml```

### **To add new broker to cluster**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterAddBroker.yml```

### **To add new bookeeper to cluster**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterAddBookeeper.yml```

### **To remove broker & bookeeper from cluster**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterDecomissionNodes.yml```

## Maintenance Playbooks

### **To make changes to java**
* Update Required vars in ```inventory/<environment>/group_vars/all.yml``` .
* Update Required vars in ```inventory/<environment>/cluster.ini``` .

```ansible-playbook -i inventory/<environment>/cluster.ini clusterJava.yml```


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
