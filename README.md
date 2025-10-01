# SIS #2: Users and Permissions Setup

## Topic

Users and Permissions

## Target

Define a role table and prepare automation for user and group setup, sudo permissions, SSH access, and file ownership for services.

---

## Project Structure

```
.
├── Vagrantfile
├── inventory.ini
├── playbook.yml
└── roles
    └── users
        ├── tasks
        │   └── main.yml
        └── vars
            └── main.yml
```

* **Vagrantfile** – configuration of the VM (Ubuntu 22.04 Jammy) with 40GB disk, 4GB RAM, 2 CPUs, and private network `192.168.56.10`.
* **inventory.ini** – Ansible inventory defining the VM host and connection details.
* **playbook.yml** – top-level playbook that applies the `users` role.
* **roles/users/tasks/main.yml** – tasks for creating users, groups, sudo permissions, SSH keys, and setting ownership for service directories.
* **roles/users/vars/main.yml** – variables for users and their properties.

---

## Role Table

| Role       | Description                | Permissions                                      | Superuser Permissions                    |
| ---------- | -------------------------- | ------------------------------------------------ | ---------------------------------------- |
| admin      | Main system administrator  | Full access to system                            | ALL via sudo (NOPASSWD)                  |
| auditor    | Log and metrics auditing   | Read-only access to logs and metrics directories | Limited sudo: `/usr/bin/journalctl` only |
| prometheus | Prometheus service account | Owns `/var/lib/prometheus`                       | None                                     |
| loki       | Loki service account       | Owns `/var/lib/loki`                             | None                                     |
| grafana    | Grafana service account    | Owns `/etc/grafana`                              | None                                     |
| alloy      | Promtail service account   | Owns `/etc/promtail`                             | None                                     |

---

## Setup Steps

1. **Start the VM**:

```bash
vagrant up
```

2. **Run the Ansible playbook**:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

3. **Verify users and groups**:

```bash
getent passwd
getent group
```

4. **Check sudo permissions**:

```bash
sudo -l -U admin_username
sudo -l -U auditor
```

5. **Verify SSH key for admin user**:

```bash
ssh admin_username@192.168.56.10
```

6. **Check ownership for service directories**:

```bash
ls -ld /var/lib/prometheus /var/lib/loki /etc/grafana /etc/promtail
ls -ld /var/log/prometheus /var/log/loki
```