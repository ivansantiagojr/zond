> [!NOTE]  
> Still under development.

# Zond

`Zond` is a CLI tool to help you manage your dotfiles.


# *Expected* Usage Flow

## Starting the configuration

The user should have a folder with the following structure:

> this just an example and will be better documented.

```
.
|-- dotfiles
|   |-- nvim
|   |-- init.lua
|   |-- .bashrc
|   |-- .gitconfig
|-- config.toml
```

The content of `config.toml` should be in the following format:

```toml
[config]
dotpah = "dotfiles" # enter path to the folder where your dotfiles are in the repository

[mappings]
bash = {
    source = ".bashrc", # the source to the file considering the dotpath entry
    destination = "~/.bashrc" # the place it should be in you local machine
}
```

## Using from a new machine

If you got a new computer, or just run a fresh install on yours, that's how you would have your setup.

## Pre-requisites

- Lua
- Git
- Zond

## Instalation
I am thinking if I shouls provide an installation script or a luarocks package, considering I will use dependencies.

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
zond sync
```

# Notes

`zond` will be heavily inspired on [dotdrop](https://dotdrop.readthedocs.io/en/latest/), but will be very minimal from start.

I am thinking if there should be reverse sync, which reads the config.toml mappings and place the files inside de reposity, just in case the user edited the file directly, and not the repository.
