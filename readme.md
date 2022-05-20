# What is this Repo?
This repository is a combination of walkthrough and configuration files to help 
get your laptop set up in a streamlined way for dbt Core development.  

## What are dotfiles?
Dotfiles are the sneaky files that are hard to find in MacOS. Think `.zshrc` if
you've used ZSH before. These files make up the backbone through which we interact
with the command line.

## Why do I want community dotfiles?
These dotfiles and this configuration are just a jumping off point for the burgeoning
analytics engineer! We want to provide you with an easy way to hit the ground running
without getting bogged down in the minutea of how to get your terminal working 
well for you. Ideally, you'll fork this repository and begin making your own 
changes in the future that align with your development style/patterns. This is nothing
more than a helpful place to start.

# What does this Repo do?
This repo will install languages, programs, and applications onto your computer 
in a format that is conduvice to dbt development. 

## Our Principles
- Manage as MUCH as we can with Homebrew
- Each dbt environment should be isolated 
- Make the command line as friendly and fun as possible!
- Use symlinks so that all config is contain in the same location.
    - *What is a symlink?* A symlink is a way of designating to a file that
     the source version exists in the .dotfile repo but to the OS it also 
     appears to exist in the designated location.

## List of Installs:
- **Git**: Of course we're installing git. It's needed for dbt. 
- **Python 3.10**: dbt requires python so .... we install.
- **Poetry**: We use this for environment management. More on this later.
- **Dotbot**: This is what we're using to install things! Dotbot 
- **Starship**: Starship is a command line tool that makes your command line look
    a lot prettier and more user friendly.
- **Git Credential Manager**: GCM manages your git credentials and makes it easier
    to work with the major git providers.
- **Visual Studio Code (VSCode)**: VSCode is the IDE that dbt Labs recommends.
- **Fig**: Fig is a terminal autocomplete tool. It produces a drop down for CLI 
    tools that have packages built into it.

## List of Files:
### Installation Files
- **.gitignore**: A .gitignore file tells git which files not to push back to the repository.
- **.gitmodules**: A .gitmodules file includes the git modules (listed as submodules) that we want to use in the installation process.
- **brewfile**: A brewfile contains the list of packages, programs, and plugins that you want to install and be managed by homebrew.
- **install**: An install file is the script that runs when you kick off the dotbot installation
- **install.conf.yaml**: A install.conf.yaml is a file that contains the information that dotbot uses to configure your dotfile. 
- **zprofile**: A zprofile is a file that contains commands that are executed at time of login, **NOT** at time of terminal startup. 
- **zshrc**: A zshrc is a file that contains commands that are executed at the start of each terminal creation.
### Pre-Installs
- **pre-install.sh**: A pre-install.sh is a script file that checks for whether Homebrew, oh-my-zsh, Mac-CLI, and ZSH are installed. If not, it installs them
### VSCode
- **vscode/extensions.txt**: The extensions text file contains the list of identifiers for extensions that we recommend installing in VSCode
- **vscode/settings.json**: The settings.json contains settings that overwrite the default settings in VSCode. We recommend the ones contained within this file
### Terminal Completions
- **oh-my-zsh/completions/_dbt**: This file contains some autocompletion scripts for dbt command line interaction
### Virtual Environments
- **poetry_environments/dbt-latest**: This folder contains everything (including the virtual environment) for the latest stable dbt version. This is what we'll use for developing!
- **poetry_environments/dbt-prerelease**: This folder contains everything (including the virtual environment) for the latest prerelease (or stable if there is no current pre-release) dbt version. This is what we'll use for testing!


# Installation!
Should I have hidden installation behind that wall of text? Probably not, but hey, 
better to read it and learn what each file is doing instead of just skipping to the
installation section. Unless you did just that - touche. 

There are two installation paths that we will call out. The first is for M1 Macs
and the latter is for Intel based Macs. 

### M1 Macs:
1. Download [iTerm2](https://iterm2.com/). 
    a. On installation, it may inform you that you need to install command line 
    developer tools. Feel free to install these.
    b. Open Applications in Finder and find iTerm. `Duplicate` this application. On
    the duplicate version, select `Get Info` and check `Open using Rosetta`. Rename
    the application to `iTerm (Rosetta)`. 
        - Why are we doing this? M1 Macs don't use the same chip architecture as 
        Intel chips and they don't play nicely with some data science packeges. This
        is a workaround. 

2. Run the first-install.sh script. 
    a. If installing for the first time, copy the raw code from this script and paste
    in your iTerm (Rosetta) terminal. Then hit enter. 

3. Begin developing! 
    a. If you ever want to make changes in the future to your configuration, navigate
    to the repository and make changes to the files contained. 

### Intel Macs:
1. Download [iTerm2](https://iterm2.com/). 
    a. On installation, it may inform you that you need to install command line 
    developer tools. Feel free to install these.

2. Run the first-install.sh script
    a. If installing for the first time, copy the raw code from this script and paste
    in your iTerm terminal. Then hit enter. 

3. Begin developing! 

## Development & Environments
Once you've got your computer, terminal, and IDE set up with this code, you'll want to begin development. If you run `dbt --version` from the base terminal, you'll notice that the commands fails. What? Why would you do that Callum - why would you deliberately set me up for failure?

Worry not! dbt is definitely installed but we've used a wonderful package called `poetry` to manage our environments. This allows us to have multiple versions of dbt without worrying about overlapping installations and commands failing. 

In order to activate these environments, we've created two new terminal commands that you can use:
- `dbt-latest` : This command will activate the virtual environment with the latest stable dbt version! 
- `dbt-prerelease` : This command will activate the virtual environment with the latest pre-release dbt version!

# Shoutouts!
This repository wouldn't be possible without the help from 2 major people:
- Erika Pullman at Hex
    - [Link to her dotfiles here](https://github.com/erika-e/dotfiles)
- Gwen Windflower at dbt Labs
    - [Link to her dotfiles here](https://github.com/gwenwindflower/dotfiles)

Both of these individuals provided their dotfiles in public repositories and we 
were able to combine the best of both of them to create a great baseline for dbt 
development!