Vim filename completion
=======================
The autocompletion for filenames in Vim in command mode is very useful, but by default it’s a bit confusing for people accustomed to tab completion in Bash because it doesn’t quite work the same way. Pressing Tab will complete the filename to the first match, and subsequent presses will not elicit any list of possible completions that might otherwise be expected; for that, by default you need to press Ctrl+D rather than Tab.

Tab then tab
------------
Fortunately, this is easily changed by using Vim’s <b>wildmenu</b>, in an appropriate mode. Set the following options in your .vimrc:

```vim
set wildmenu
set wildmode=longest,list
```
You should now find that when you complete filenames after commands like :w and :e, the paths expand in a similar manner to the way they do in the shell. If you’d prefer to only press Tab once to get both the longest matching unique string and a list of possible complete matches, that’s possible to arrange in both Bash and Vim as well.

Ignoring file types
-------------------
There are probably certain filetypes in your directories that you’ll never want to edit with Vim. There’s hence no point in making them options for the autocompletion, and you can exclude them by pattern to make searching for the right file a bit quicker. This is done using the wildignore pattern. I use the following settings:

```vim
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
```

Compatibility
-------------
For the sake of keeping my .vimrc consistent and compatible on both older and newer machines, I like to wrap these options in a conditional block checking that the wildmenu feature is actually available:

```vim
" Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif
```

Insert mode
-----------
You can also complete file paths and names in insert mode with Ctrl+X Ctrl+F. It can be handy to map this to Tab if you don’t use it for anything else:
```vim
inoremap <Tab> <C-X><C-F>
```
