# Zhina

[shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust) + [simple-obfs](https://github.com/shadowsocks/simple-obfs)

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

Use iran-vm ip address, ss_password and 443 port. (if you want to chane port, change it in ansible/inventory/group_vals/all/vars.yaml)
