To see the Operating System details run

`hostnamectl`

## Looping from the command line

```bash
for u in user{1..5} ; do echo $u ; done
```

* `u` #this is the loop variable, it acts as a temporary container
* `user{1..3}` #Brace Expansion: starts into a list user1, user2, user3
* `;` #command separator, this commmand has finished start the next one on the next line
* `do ... done` #this is the block. everything between these two will be executed for every time in the list
* `$u` #variable substitution

## VIM customization

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

## Collecting user Input and Code Logic

* Positional parameters: $1, $2 ... ${10}.
($0 is not a positional but represents the script name.)

* Number of positional parameters: $#
(The number of positional parameters passed to the script.)

* List of all positional parameters: $*
(All the positional parameters passed to the script as a single string.)

* List of all positional parameters individually: $@
(All the positional parameters passed to the script as separate strings.)

### Prompting for user input

```bash
read -p "Enter a username: " user_name
read -sp "Enter a password: " user_password

echo -e "\n$user_name "

# The command `read` is used to read user input from the terminal. The `-p` option allows you to specify a prompt message, while the `-s` option hides the input (useful for passwords). The variables `user_name` and `user_password` will store the values entered by the user.
```

### Implementing Script logic

```bash
#!/bin/bash

if [ $# -eq 0 ] ; then
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    if [ "$user_password" != "$user_password_check" ] ; then
        echo -e "\n${0}: Passwords do not match!"
        exit 1
    fi
else
    user_name="$1"
    user_password="${2:-Password1}"
fi
echo -e "\n$user_name $user_password"
```

### Streamline Scripts Using Functions

```bash
#!/bin/bash

prompt_user () {
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}
if [ $# -eq 0 ] ; then
    prompt_user
    if [ "$user_password" != "$user_password_check" ] ; then
        echo "${0}: Passwords do not match!"
        prompt_user
    fi
else
    user_name="$1"
    user_password="${2:-Password1}"
fi
echo -e "\n$user_name $user_password"
```

### Using Function Parameters to Customize Functions

```bash
#!/bin/bash

prompt_user () {
    message=${1:-"Enter account details"}
    echo "$message"
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}
if [ $# -eq 0 ] ; then
    prompt_user
    if [ "$user_password" != "$user_password_check" ] ; then
        prompt_user "Password didn't match, re-enter details"
    fi
else
    user_name="$1"
    user_password="${2:-Password1}"
fi
echo -e "\n$user_name $user_password"
```

### Understanding Return Values

```bash
#!/bin/bash

prompt_user () {
    message=${1:-"Enter account details"}
    echo "$message"
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}

check_user () {
    grep -q \^${1}\: /etc/passwd && return 0
}

if [ $# -eq 0 ] ; then
    prompt_user
    if [ "$user_password" != "$user_password_check" ] ; then
        prompt_user "Password didn't match, re-enter details"
    fi
else
    user_name="$1"
    user_password="${2:-Password1}"
fi

if check_user "${user_name}" ; then
    prompt_user "The user name you have chosen already exists, please select fresh details"
fi
echo -e "\n$user_name $user_password"
```

### Iteration: Implementing Loops

Looping structures allows you to iterate through code either using FOR or WHILE constructs. Consider our
passwords or user checks, we currently only check the first time and this should be a loop until correct

* FOR Loops - great for iterating through a list
  
```bash
for u in $* ; do
    echo $u
done
```

* WHILE Loops - these are great to loop indefinitely until a condition is no longer met

```bash
while [ "$user_password" != "$user_password_check" ] ; do
    prompt_user "Passwords Do Not Match!"
done
```

```bash
#!/bin/bash

prompt_user () {
    message=${1:-"Enter account details"}
    echo "$message"
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}

check_user () {
    grep -q \^${1}\: /etc/passwd && return 0
}

if [ $# -eq 0 ] ; then
    prompt_user
    while [ "$user_password" != "$user_password_check" ] ; do
        prompt_user "Password didn't match, re-enter details"
    done
else
    user_name="$1"
    user_password="${2:-Password1}"
fi

while check_user "${user_name}" ; do
    prompt_user "The user name you have chosen already exists, please select fresh details"
done
echo -e "\n$user_name $user_password"
```

---

## Building BASH Menus

Using a BASH menu allows you to present operators with a set list of controlled tasks
they are allowed to carry out. Making life more simple and accurate. The menu will loop until users quit the menu

```bash
#!/bin/bash
while true ; do
    clear
    echo "Choose 1, 2 or 3"
    echo "1: Logged in users"
    echo "2: Date in 90 days"
    echo "3: Quit"
    read -sn1
    case "$REPLY" in
        1) who;;
        2) date --date "90 days";;
        3) exit 0;;
        *) echo "Selection not recognized, please choose again";;
    esac
    read -n1 -p "Press any key to continue"
done
```

### Building a Creating User Function

```bash
prompt_user () {
    message=${1:-"Enter account details"}
    echo "$message"
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}

check_user () {
    grep -q \^${1}\: /etc/passwd && return 0
}

create_user () {
    prompt_user "Enter new user details"
    while check_user "${user_name}" ; do
    prompt_user "The user name you have chosen already exists, please select fresh details"
    done
    while [ "$user_password" != "$user_password_check" ] ; do
        prompt_user "Password didn't match, re-enter details"
    done
    sudo useradd -m "$user_name"
    echo "${user_name}:${user_password}" | sudo chpasswd
    echo "$user_name created"
}
```

### Building a Delete User Function

```bash
prompt_user () {
    message=${1:-"Enter account details"}
    echo "$message"
    read -p "Enter a username: " user_name
    read -sp "Enter a password: " user_password
    echo ""
    read -sp "Enter the password again: " user_password_check
    echo ""
}

check_user () {
    grep -q \^${1}\: /etc/passwd && return 0
}

create_user () {
    prompt_user "Enter new user details"
    while check_user "${user_name}" ; do
    prompt_user "The user name you have chosen already exists, please select fresh details"
    done
    while [ "$user_password" != "$user_password_check" ] ; do
        prompt_user "Password didn't match, re-enter details"
    done
    sudo useradd -m "$user_name"
    echo "${user_name}:${user_password}" | sudo chpasswd
    echo "$user_name created"
}

delete_user () {
    read -p "Enter the user to delete:" user_name
    while ! check_user "$user_name" ; do
        echo "User not found"
        return 1
    done
    sudo userdel -r $user_name
    echo "$user_name deleted"   
}

while true ; do
    clear
    echo "user management"
    echo "1: Create user"
    echo "2: Delete user"
    echo "3: Exit"
    read -sn1
    case "$REPLY" in
        1) create_user;;
        2) delete_user;;
        3) exit 0;
    esac
    read -n1 -p "Press any key to continue"
done
```

### Scripts on Login

Adding the menu script the ~/.bash_profile will ensure that it runs on login. Using exec<path-to-script> will ensure the user is logged out when they exit the menu

* Copy your code to `/usr/bin/` so every user can execute it