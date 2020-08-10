```
ansible-galaxy install -r requirements.yml
ll ~/.ansible/roles
packer build -var-file ../variables.json centos.json
#> go to IP:8080, admin/admin
```