#!/bin/bash
echo \
'{
    "_meta": {
        "hostvars": {
            "centos": {
                "ansible_host": "172.29.29.15"
            }, 
            "ubuntu": {
                "ansible_host": "172.29.29.14"
            }
        }
    }, 
    "all": {
        "children": [
            "ungrouped", 
            "vm"
        ]
    }, 
    "ungrouped": {}, 
    "vm": {
        "hosts": [
            "centos", 
            "ubuntu"
        ]
    }
}'
