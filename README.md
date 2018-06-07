# dotfiles
Personal and portable dotfiles setup. Run `./setup.sh` to run things. This is idempotent and should upgrade anything as necessary.

# Local Customizations
* Add a `.gitconfig.local` file to have machine specific customizations, or environment specific customizations.

# TODO
* [ ] Darktable
* [ ] Write check script to make sure everything is synced up: Check atom dependencies, brew dependencies, apt dependencies
* [ ] Get work related git config
* [ ] GNUPG config?
* [ ] Ensure fish is setup as the default shell
* [ ] Enable gitconfig.local file with setup instructions

## Atom Setup Portability
* [ ] Stow the atom Setup
* [ ] `apm` install the packages from a list
* [ ] Script to output apm list

# References and Thanks
* [Fantastic set of ideas using stow as well as making things cross package](https://github.com/Kraymer/F-dotfiles)
* [Docker containers on the desktop](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/)
* [Docker containers for command line apps](https://blog.ouseful.info/2016/05/03/using-docker-as-a-personal-productvity-tool-running-command-line-apps/)
* [MacOS Default preferences](https://github.com/mihaliak/dotfiles/blob/master/macos/defaults.sh)
