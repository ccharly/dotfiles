dotfiles
========

My dot files.

# Vim
## YouCompleteMe
I've done a little rewritter of the default `.ycm_extra_conf.py`. Mine let you
use the default one with optional flags. You can give extra flags and also a
path to your `compilation_database.json`'s folder.

First of all, if you want to use it, you have to make sure your environment is
ready for it.

Make sure you've added the following lines in your `.(whatever-shell-you-use)rc`:
```shell
# This assumes that you have the same file structure as mine
# (i'm using NeoBundle as vim package manager)
export PYTHONPATH="$PYTHONPATH:$HOME/.vim"
export PYTHONPATH="$PYTHONPATH:$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd"
export PYTHONPATH="$PYTHONPATH:$HOME/.vim/bundle/YouCompleteMe/python/ycm"
```

Now, if you want to use a custom `ycm` config, you can add a `.ycm_extra_conf.py`
to the root of your projet and extend the default one like the following:

```python
import os
import ycm_default

def DirectoryOfThisScript():
	return os.path.dirname(os.path.realpath(__file__))

# Directory of this script
cwd = DirectoryOfThisScript()

# The build directory (assuming you're using cmake)
build_dir = cwd + '/build'

# Instanciate YCM
ycm = ycm_default.Ycm({
	# Used for the compilation_database.json (from cmake)
	'compilation_database': build_dir,
	'flags': [
	]
	})

# Default and mandatory
FlagsForFile = ycm.FlagsForFile
```

Keep in mind that you have to provide a `FlagsForFile` function to `ycm`.

That's it :) Give it a shot, it's pretty handy to configure.
