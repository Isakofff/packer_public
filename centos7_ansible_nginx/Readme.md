```
ansible-galaxy install -r requirements.yml
packer build -var-file variables.json centos.json
```