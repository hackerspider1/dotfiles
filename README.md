<div align="center">

# Warp + Starship + VS Code

<img src="https://avatars.githubusercontent.com/u/71840468?s=200&v=4" alt="iTermProfile" width="50"/> 
<img src="https://starship.rs/logo.svg" alt="Starship" width="200"/> 
<img src="https://code.visualstudio.com/assets/branding/app-icon.png" alt="code" height="70" width="100"/>
  </div>

My Dotfiles repository houses my personalized configuration files for Linux and macOS, encompassing different settings, themes, and tweaks that I use to tailor my computing experience. 

Please note that although I try to keep these files up-to-date, changes to the software products may occur without prior notice.

  ## Clone the repo and move file to the user.

    git clone https://github.com/hackerspider1/dotfiles.git
    cd dotfiles
    mv .zsh/ .config/ .warp/ .zshrc -t ~/


## Install Warp

[Warp can be download rom here](https://app.warp.dev/get_warp).

Signup with your github from follwing link: https://app.warp.dev/referral/2NMVLR

## Install Brew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install Starship

    brew install starship


## Install exa

    brew install exa

## Terminal and Application Icons with Nerd-Fonts

To display icons in terminal or applications Fonts, I'm using [Nerd-Fonts](https://www.nerdfonts.com). I'm currently using the **Hack Nerd Font Mono** in terminal applications, and **Hack Nerd Font** in applications.

![Warp](https://raw.githubusercontent.com/hackerspider1/dotfiles/main/Screenshots/Warp.png)

![Warp Theme](https://raw.githubusercontent.com/hackerspider1/dotfiles/main/Screenshots/Warp%20Theme.png)

![Warp Settings](https://raw.githubusercontent.com/hackerspider1/dotfiles/main/Screenshots/Warp%20Setting.png)

Make Sure to enable PS1 for custom prompt from features.

![Feature](https://raw.githubusercontent.com/hackerspider1/dotfiles/main/Screenshots/PS1.png)

If you want to have same colors for VS code :)

```
cd /Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-defaults
```

change dark-plus.json with [dark_plus.json](https://github.com/hackerspider1/dotfiles/blob/main/dark-plus.json)

![VS_Code](https://raw.githubusercontent.com/hackerspider1/dotfiles/main/Screenshots/VS_code.png)
