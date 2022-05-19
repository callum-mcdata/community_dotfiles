setopt interactivecomments
#!/bin/bash

# Check if Homebrew is installed
if [ ! -f "`which brew`" ]; 
  then echo 'Installing homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  else echo 'Updating homebrew'
  brew update;
fi

# Install Homebrew Bundle
brew tap homebrew/bundle

# Check if oh-my-zsh is installed
if [ -d ~/.oh-my-zsh ];
  then echo "oh-my, it's already installed" ;
  else echo "oh-my-zsh not installed, installing..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ; 
fi

# Check for and install zsh-autosuggestions
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] ; 
  then echo "zsh-autosuggestions is in the house" ; 
  else echo "Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ;
fi

# Install git to get the brewfile
brew install git

# Install git credential manager
brew tap microsoft/git
brew install --cask git-credential-manager-core

## Entering in the git username if not exists
if git config --global user.name > /dev/null; then
    echo "--- user.name set to `git config --global user.name`"
else
    echo "--- Your full name: First Last"
    read FULL_NAME
    git config --global user.name "$FULL_NAME"
fi

if git config --global user.email > /dev/null; then
    echo "--- user.email set to `git config --global user.email`"
else
    echo "--- Your github account email address"
    read GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"
fi

## Setting default branch to main
git config --global init.defaultBranch main

# Create a directory for repos
if [ -d ~/repos ];
  then echo "Look - it's a repo and it's already created" ;
  else echo "Creating repos directory"
  mkdir -p repos ;
fi
cd repos

# Remove the dotfiles repo if it already exists and restore from the source
if ! git clone "https://github.com/callum-mcdata/community_dotfiles.git" "community_dotfiles" 2>/dev/null && [ -d "community_dotfiles" ] ; 
  then echo "Clone failed because the folder community_dotfiles exists";
  else git clone "https://github.com/callum-mcdata/community_dotfiles.git" "community_dotfiles"
  echo "something went wrong";
fi

cd community_dotfiles

# Run the dotfile install
./install