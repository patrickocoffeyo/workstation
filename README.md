# Workstation
This repository contains a set of Ansible roles and playbooks that fully build and configure my development machines.

## Usage
 - Install git.
 - Install ansible.
 - Clone this repository.
 - Install Galaxy roles:
 ```bash
 ansible-galaxy install -r galaxy_roles.yml
 ```
 - Run the `workstation-single.yml` playbook:
 ```bash
 ansible-playbook -i "localhost," -c local workstation-single.yml --ask-sudo-pass --extra-vars "workstation_user=user_to_be_provisioned"
```
 - Run the `workstation.yml` playbook:
 ```bash
 ansible-playbook -i "localhost," -c local workstation.yml --ask-sudo-pass --extra-vars "workstation_user=user_to_be_provisioned"
```

I've split this into two playbooks, the one is just dotfiles and configuration that really should only run once, the other is a playbook of dependencies that are much more frequently updated and managed.
