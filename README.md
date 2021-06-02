# .-files

My dotfiles, for both macOS and Linux.

Most of my configurations are more or less only for macOS as this is my main OS for development.


## Setup

<details>
    <summary>macOS</summary>

```sh
chmod +x macos
./macos
./homebrew/install.sh
ln -s .config ~/.config
ln -s .bin ~/.bin
ln -s .hammerspoon ~/.hammerspoon
```

</details>

<details>
    <summary>Linux</summary>

```sh
ln -s .config ~/.config
ln -s .bin ~/.bin
```

</details>
