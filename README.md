# Zhina

[shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust) + [cloak](https://github.com/cbeuw/Cloak)

## Install Dependencies

First, install [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
Then, install ansible needed collections:

```console
ansible-galaxy collection install -r ansible/requirements.yaml   
```

## Run
Add ansible/inventory/inventory.yaml file([template](ansible/inventory.template)), for example:

```yaml
my-name:
  hosts:
    iran-vm-my-name: # vm in iran
      user: test # vm user
      ip_address: 10.10.10.10 # vm ip address
      ss_host: 11.11.11.11 # free world vm ip address
      iran: true
    netherland-vm-my-name: # vm in free world
      user: test
      ip_address: 11.11.11.11
      ss_password: MyPassword # shadowsocks connection password
```

**You need SSH access to virtual machines.**

In ansible directory run this command:
```console
ansible-playbook playbook.yml -f 5 -i inventory --diff
```

Use iran-vm ip address, ss_password and 8388(you have to build your own docker image if you want to change it) port.
Finally, you have your cloak plugin configs in ansible/cloak-configs/[your-external-vm-name].yaml, ([template](ansible/cloak-configs/connection.yaml.template)) for example:

``` yaml
PUBLIC_KEY: c2RzZmRnZGZzZHNkc2RzZnNmZgo=
UID: c2RzZmRnZXJncmdyZWdlcmdyCg==
```
