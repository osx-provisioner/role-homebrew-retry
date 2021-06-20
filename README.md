# role-homebrew-retry

### Master:
[![role-homebrew-retry](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml)

### Production:
[![role-homebrew-retry](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml/badge.svg?branch=production)](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml)

Ansible role that installs homebrew apps, casks and taps in a retry loop to deal with connectivity issues.

Requirements
------------

- Homebrew must already be present on the machine ([geerlingguy.mac.hombrew](https://github.com/geerlingguy/ansible-collection-mac) is a great solution for this).
- See the [homebrew website](https://brew.sh/) for further details about this tool.

Role Variables
--------------

### Standard Configuration

- `brew_user`:
  - The user to run homebrew operations as.
  - This role uses the dependency [geeringguy.mac.homebrew](https://github.com/geerlingguy/ansible-collection-mac) to setup homebrew, you may need to set the `homebrew_user` variable in the top-level playbook.
  - The default value will work fine if you're simply installing for the current user.
- `brew_retries`:
  - The number of attempts that will be made to install the homebrew apps, casks and taps.
- `brew_packages`:
  - A list of homebrew apps install.
- `brew_casks`:
  - A list of homebrew casks to install for ALL users. 
  - Homebrew typically installs these to `/Applications` by default.
- `brew_taps`:
  - A list of homebrew taps to install.
- `brew_install_state`:
  - Toggle between various install options.
  - Set this to `latest` to install the newest version on each execution.
  - Set this to `present` to simply ensure the app or cash is present.
  - `latest` is temporarily disabled for casks due to [this issue](https://github.com/ansible-collections/community.general/issues/1647).
- `brew_sudo_password`:
  - Some casks may require SUDO to complete their install (Zoom is an example...)  This variable gives you a way to override the default value used.

### Homebrew Cask Installation Options

This role provides 2 alternative locations to install Casks to:

#### User Casks

- `brew_user_casks_location`: 
  - This defaults to a separate `Applications` folder that will be created in the user's home directory for user only cask installs.
  - You may alternatively specify another user install location, which will be created.
- `brew_user_casks`:
  - A list of homebrew casks to install to this "user only" location.
  
#### Targeted Casks

- `brew_targeted_casks_location`: 
  - This defaults to a separate `/opt/casks` folder that will be created.
  - The primary intended use for targeted casks is a separate partition that is shared on a multi-boot mac setup.
  - This would allow you to share apps between boot disks, to conserve disk space.
- `brew_targeted_casks_group`:
  - This is the group with write permissions to this location. Defaults to admin users only.
- `brew_targeted_casks`:
  - A list of homebrew casks to install to this custom location.


[See The Default Values](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: all
  roles:
  - role: elliotweiser.osx-command-line-tools
  - role: geerlingguy.mac.homebrew
  - role: osx_provisioner.homebrew_retry
    brew_retries: 42
    brew_packages:
      - mysql
```

License
-------

MIT

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
