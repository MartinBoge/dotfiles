# dotfiles

### Installation guide

1. Setup SSH key pair: `ssh-keygen -t ed25519 -C "martin-boge@<host_name>" && cat ~/.ssh/id_ed25519.pub`
2. Add the public key to GitHub: https://github.com/settings/keys
3. Clone: `git clone git@github.com:MartinBoge/dotfiles.git ~/dotfiles`
4. Sign in to the App Store (required for the `mas` installs: Magnet, Xcode)
5. Install: `cd ~/dotfiles && bash install.sh`
