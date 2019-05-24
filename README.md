# ansible-role-terraform

[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-terraform.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-terraform)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.terraform-660198.svg)](https://galaxy.ansible.com/diodonfrost/terraform)

This role provide a compliance for install terraform on your target host.

## Requirements

This role was developed using Ansible 2.5 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.terraform` to install the role on your system.
*   Ansible >= 2.5
*   Python >= 2.7

Supported platforms:

```yaml
- name: EL
  versions:
    - 7
- name: Fedora
  versions:
    - 31
    - 30
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - disco
    - bionic
    - xenial
    - trusty
- name: OracleLinux
  versions:
    - 7
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
- name: opensuse
  versions:
    - 42.3
    - 42.2
    - 42.1
    - 13.2
- name: SLES
  versions:
    - 15
- name: ArchLinux
  versions:
    - any
- name: Alpine
  versions:
    - any
- name: Gentoo
  versions:
    - stage3
- name: FreeBSD
  versions:
    - 11.2
    - 10.4
    - 10.3
- name: OpenBSD
  versions:
    - 6.0
    - 6.4
- name: MacOSX
  versions:
    - 10.13
    - 10.12
    - 10.11
    - 10.10
- name: Windows
  versions:
    - 2016
    - 2012R2
    - 8.1
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-terraform

# Define terraform version to install
# Possible values: https://releases.hashicorp.com/terraform/index.json
# Default: latest
terraform_version: latest

# Terraform destination path
terraform_path: /usr/local/bin/
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy terraform role in a localhost and installing the latest version of Terraform.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.terraform
```

This role can also install a specific version of terraform.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: ansible-role-terraform
      vars:
        - terraform_version: 0.12.0-rc1

```

Install Terraform 0.11.4.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: ansible-role-terraform
      vars:
        - terraform_version: 0.11.14

```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use Virtualbox with kitchen-vagrant to run tests locally. You will have to install Virtualbox and terraform on your system. For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test terraform-latest-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create terraform-latest-centos-7

# Apply ansible playbook
kitchen converge terraform-latest-centos-7

# Apply inspec tests
kitchen verify terraform-latest-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Linux
export KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test terraform-latest-centos-7
```

### Testing on Windows with Virtualbox

Windows can only be test with Virtualbox provider, do not use 'kitchen test' command for testing Windows environment. There 4 steps you will be using with test-kitchen as part of your workflow.

First of all we must set the kitchen file:
```shell
# For testing Windows
export KITCHEN_YAML=.kitchen-windows.yml
```

Provision the virtual machines, a Linux machine to run Ansible and Windows machines to apply playbook again:
```shell
# deploy machines
kitchen create

# Launch playbook
kitchen converge
```

Finaly launch inspec tests:
```shell
kitchen verify
```

For cleaning environment use:
```shell
kitchen destroy
```

## License

Apache 2

## Author Information

This role was created in 2019 by diodonfrost.
