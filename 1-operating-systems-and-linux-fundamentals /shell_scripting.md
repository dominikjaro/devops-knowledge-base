To see the Operating System details run

`hostnamectl`

### Looping from the command line

```bash
for u in user{1..5} ; do echo $u ; done
```

* `u` #this is the loop variable, it acts as a temporary container
* `user{1..3}` #Brace Expansion: starts into a list user1, user2, user3
* `;` #command separator, this commmand has finished start the next one on the next line
* `do ... done` #this is the block. everything between these two will be executed for every time in the list
* `$u` #variable substitution

### VIM customization

You can customise your VIM editor by creating the .vimrc file in your home directory.

```bash
vim ~/.vimrc

set bg=dark number tabstop=2 ai expandtab
abbr _bash #!/bin/bash<CR>
```

* `set bg=dark` = set background to dark
* `number` = show line numbers
* `tabstop=2` = set tab width to 2 spaces
* `ai` = enable auto indent
* `expandtab` = convert tabs to spaces
* `abbr _bash #!/bin/bash<CR>` = create an abbreviation so that when you type _bash and press enter, it will expand to #!/bin/bash and move to the next line. The <CR> simulates pressing the enter key.

