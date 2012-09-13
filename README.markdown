# Dotfiles

## dotfiles


If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read Zach Holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

These dotfiles are based on [Zach Holman's dotfiles](https://github.com/holman/dotfiles),
on [Solarized](http://ethanschoonover.com/solarized), and on those by 
[gf3](https://github.com/gf3/dotfiles/). 

[Github.com's dotfile page](http://dotfiles.github.com) is a great start point.

## install

Run this:

```sh
git clone https://github.com/thomwiggers/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.autorun.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.autorun.zsh**: Any files ending in `.autorun.zsh` get loaded 
- into your environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.
