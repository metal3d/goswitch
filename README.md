# Go Switch

Install and switch version from official golang.org website.

Go Switch help you to setup a Go version and environment variables. It can also create a local environment that is similar to python virtualenv.

Goswitch can install recommended packages (see `list-recommended` and `install-recommended` options).

Why to not use [gvm](https://github.com/moovweb/gvm) ? No reason, I only wanted to make my own in shell script :)

My script is just a bit less heavy, simple and has not a lot of options. GVM is a great project that you should use if goswitch doesn't answer to your needs.

## Installation

```
# If ~/.local/bin is in your PATH (recommanded)
curl https://raw.githubusercontent.com/metal3d/goswitch/master/goswitch -o ~/.local/bin/goswitch
chmod +x ~/.local/bin/goswitch

# OR
sudo curl https://raw.githubusercontent.com/metal3d/goswitch/master/goswitch -O /usr/local/bin/goswitch
sudo chmod +x /usr/local/bin/goswitch
```


## Usage

```
goswitch command <version>
Commands:
   list:                           list installed version from /home/pafer/.go directory

   available:                      list installable go version from golang.org

   install <version>:              install go-<version> (version should be x.y.z,
                                   eg. goswitch install 1.9.1)

   use <version>:                  to be call with "eval $(goswitch use <version>)"
                                   to set env vars on current shell

   use <version> default:          set ~/.profile to use that version in next login session
                                   or if you source ~/.profile script

   local-project [dir]:            use [dir] or current directory if [dir] is not
                                   provided to create a local projecct. That creates
                                   a bin/activate and bin/deactivate to use with 'source' command
                                   eg. goswitch local-project /tmp/myproject

   bash-completion:                set bash completion, please do 'source <(goswitch bash-completion)'
                                   You may add this line in you ~/.bashrc

   install-recommended <name|all>: install recommended tool "name" to work with Go,
                                   giving "all" will install the entire recommended list,
                                   see "list-recommended" command

   list-recommended:               list recommended gopackage to install

   check-update:                   check latest version of goswitch, doesn't install

   update:                         update goswitch to the latest version

   -h|--help:                      print this help

   -v|--version|-version:          print version (0.0.9)
```


To setup a go version, eg. 1.9.1:

```
goswitch install 1.9.1
```

To use that version in current shell

```
eval $(goswitch use 1.9.1)
```


To use that version by default, following command will set variables in ~/.profile:

```
goswitch use 1.9.1 default
```

## Virtual environment like Python

You can ask goswitch to provide a local environment to create some project outside GOPATH.

It's very simple:

```bash
goswitch local-project ~/Projects/myproject
```

That creates three directories:

- `~/Projects/myproject/bin` where `activate` and `deactivate` scripts are installed. Also, `go get` command will install binaries here.
- `~/Projects/myproject/pkg` where local package are compiled
- `~/Projects/myproject/src` where you should create you subdirectory to work on. Also, `go get` command will install sources here


To activate that environment, use:

```bash
source ~/Projects/myproject/bin/activate
```

That will set GOPATH and PATH environment to use the project environment by default. But your default GOPATH is also inserted to be able to use global packages that you already have installed.

To deactivate:

```bash
source ~/Projects/myproject/bin/deactivate
```

The last GOPATH and PATH are now set up to the default.

**NOTE**: If the path is not provided, so goswitch will create directories and scripts in the current directory.

## Recommended packages

Using vim-go, I was very glade to have a "GoInstallBinaries" command inside Vim to install recommended packages to work.

I also needed [Glide](https://github.com/Masterminds/glide) to manage vendors packages, and [Delve](https://github.com/derekparker/delve) debugger. As I was always searching in Github where are that packages, I added that packages in my list. So you can install my recommended package via goswitch command:

```bash
# install all recommended packages
goswitch install-recommended all

# install one package, for example "glide"
goswitch install-recommended glide
```

TODO: currently, I cannot ask installation of several packages at once, excepting using "all" keyword

NOTE: completion is working for package names.

## Completion

goswitch can provide bash completion, to test, you may try that command in bash session:

```bash
source <(goswitch bash-completion)
```

Then, type "goswitch" and hit `TAB` key on keyboard, completion can also propose installed versions for "use" command, or available versions for "install" command.

If that works for you, add the source command into you `~/.bashrc` file to have it for next shell session.


# Update goswitch

Goswitch checks every 24h if you're using the latest version. It can warn if a latest version is available.

You can force the update check by using:

```
goswitch check-update
```

If you want to update goswitch, try this command:

```
goswitch update
```

If a new version is available, that command will try to install the script at the same place.

Note that to check if you've already checked version, GoSwitch writes a file in `.config/goswitch/` directory.
