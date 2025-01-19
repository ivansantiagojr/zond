# Zond

`Zond` is a CLI tool to help you manage your dotfiles.

# Usage Flow

## Installation

You will need to have Lua installed on you system, then, since `zond` is just a single Lua file, you can just place it into somewhere in your path, like:

```bash
curl -O https://raw.githubusercontent.com/ivansantiagojr/zond/refs/heads/main/src/zond.lua
chmod +x zond.lua
mv zond.lua ~/.local/bin/zond # or move to somewhere in your path
```
## Setup

The user should have a folder with a `zond_config.lua` file, here is an example:

> My own [dotfiles repo](https://github.com/ivansantiagojr/dotfiles) is using zond, check it out.

```
.
|-- dotfiles
|   |-- nvim
|       |-- init.lua
|   |-- .bashrc
|   |-- .gitconfig
|-- zond_config.lua
```

The content of `zond_config.lua` should be in the following format:

```lua
return {
    config = {
        dotpath = 'dotfiles' --  enter path to the folder where your dotfiles are in the repository
    },
    mappings = {
        gitconfig = {
            source = '.gitconfig', -- the source to the file considering the dotpath entry
            destination = '~/.gitconfig' -- the place it should be in you local machine
        },
        bashrc = {
            source = '.bashrc',
            destination = '~/.bashrc'
        },
    }
}
```
## Usage

Git clone you repository:

```bash
git clone git@github.com:<your-username>/<your-dotfiles>.git
```

cd into your folder:

```bash
cd your-dotfiles
```

Run `zond` to set things up:

```bash
zond
```

# Notes

`zond` will be heavily inspired on [dotdrop](https://dotdrop.readthedocs.io/en/latest/), but will be very minimal from start.

