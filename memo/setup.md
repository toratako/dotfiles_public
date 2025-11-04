# Setup

Install `yay` then, execute below command to install packages.  

```shell
yay --needed -S - < <FILE_NAME>
```

Execute below commands to enable services and install some tools.  

```shell
chsh -s $(which zsh)

echo "kernel.sysrq=1" | sudo tee -a /etc/sysctl.d/99-sysrq.conf
sudo sysctl -w kernel.sysrq=1
cat /proc/sys/kernel/sysrq

sudo systemctl enable --now lactd

sudo pacman -S libusb pcsclite ccid opensc pcsc-tools
sudo systemctl enable --now pcscd

sudo systemctl enable --now docker.service
sudo usermod -aG docker $USER

sudo systemctl enable --now ollama.service

sudo systemctl enable --now tailscaled
sudo tailscale up

sudo systemctl enable --now libvirtd.service virtlogd
sudo systemctl restart virtlogd
sudo virsh net-start default
sudo virsh net-autostart default

sudo pacman -S firewalld
sudo systemctl enable --now firewalld

sudo pacman -S fcitx5-chinese-addons

mise install node
mise install python
mise use -g usage
mise use -g python
mise use -g node
mise use -g ruby

rustup default stable

gem install seccomp-tools racc
gem install zsteg

uv pip install --system angr pwntools pycryptodome numpy sympy scipy matplotlib scapy gmpy2 unicorn capstone z3-solver pyelftools
uv pip install --system requests beautifulsoup4 pillow opencv-python pandas rich python-dotenv zstandard setuptools
uv pip install --system basedpyright
uv tool install git+https://github.com/RsaCtfTool/RsaCtfTool
```
