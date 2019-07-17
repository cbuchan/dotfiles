# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Run install file
./install
