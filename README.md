# dotshuttle

dotshuttle is a ruby script that allows quick sync between two file locations,
especially for current and backup dotfiles.

## Installation

You can use gem, the package manager for ruby to install dotshuttle.
```sh
gem install dotshuttle
```

## Usage

### Items

You will need to declare the files and folders you want to sync in a toml file,
by default in `~/.config/dotshuttle/items.toml`.
Declare a table for an item you would like to sync, and declare the keys
`machine` and `backup`. `mc` and `bk` also works if the first set aren't found.
It may look like this.
```toml
# ~/.config/dotshuttle/items.toml

[dotshuttle]
machine = "~/.config/dotshuttle"
backup = "/media/hdd1/backups/dotshuttle"

[vim]
machine = ["~/.vimrc", "~/.vim"]
bk = ["/media/hdd1/backups/vim/vimrc", "/media/hdd1/backups/vim/vimdir"]
```
The values can be a path, or arrays of same length containing paths.

### Invocation

When calling dotshuttle, you should specify one of the 4 actions, which are
`-H --help`, `-L --list`, `-G --get`, `-S --set`.

* `help` shows a breif help about available options.
* `list` lists all items in the items file.
* `get` and `set` does the sync of files.\
`get` copies items from `machine` to `backup`, and `set` does the opposite.

When using get or set, you can specify more of the following options.

* `-f --file FILE` uses an alternate path for the items file.
* `-b --backup DIR` uses an alternate directory for storing dotshuttle backups.
* `-k --backup-count NUMBER` sets how many steps are backed up.\
Note that "backup" in this context means the backups dotshuttle create before
overwriting.
* `-e --except` changes the behaviour to copy items that are NOT specified.
* `-c --create` creates the destination if it does not exist.
* `-s --skip` skips failed operations and carries on.
* `-v --verbose` increases the verbosity level.\
By default shows result and progress, an increase shows file paths.
* `-q --quiet` decreases the verbosity level.\
One decrease shows only result, one more shows nothing.

When dotshuttle overwrites files in the destination, it creates a backup in the
backup folder, "~/.cache/dotshuttle-backup" unless otherwise specified.
Still, the user is expected not to completely rely on this feature but invoke
every commands carefully.
