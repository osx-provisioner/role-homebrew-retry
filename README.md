# role-homebrew-retry

### Master:
- Travis CI: ![TravisCI](https://travis-ci.com/osx-provisioner/role-homebrew-retry.svg?branch=master)
- Github Actions: [![role-homebrew-retry](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml)

### Production:
- Travis CI: ![TravisCI](https://travis-ci.com/osx-provisioner/role-homebrew-retry.svg?branch=production)
- Github Actions: [![role-homebrew-retry](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml/badge.svg?branch=production)](https://github.com/osx-provisioner/role-homebrew-retry/actions/workflows/push.yml)

Encapsulates geerlingguy.homebrew in a simple retry loop, to allow for connectivity errors during homebrew installs.

Requirements
------------

None


Role Variables
--------------

None   

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
         - { role: osx-provisioner.role-homebrew-retry }

License
-------

MPL-2

Author Information
------------------

Niall Byrne <niall@niallbyrne.ca>
