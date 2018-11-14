#!/bin/bash

echo '
{
    "_meta": {
        "hostvars": {
            "172.29.29.14": {}, 
            "172.29.29.15": {}
        }
    }, 
    "all": {
        "children": [
            "ungrouped"
        ]
    }, 
    "ungrouped": {
        "hosts": [
            "172.29.29.14", 
            "172.29.29.15"
        ]
    }
}
'
