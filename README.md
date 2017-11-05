# Go Switch

Install and switch version from official golang.org website.

Go Switch help you to setup a Go version and environment variables. It can also create a local environment that is similar to python virtualenv.

Why to not use [gvm](https://github.com/moovweb/gvm) ? No reason, I only wanted to make my own in shell script :)

My script is just a bit less heavy, simple and has not a lot of options. GVM is a great project that you should use if goswitch doesn't answer to your needs.

## Installation

```
# If ~/.local/bin is in your PATH
curl https://raw.githubusercontent.com/metal3d/goswitch/master/goswitch -o ~/.local/bin/goswitch
chmod +x ~/.local/bin/goswitch

# OR
sudo curl https://raw.githubusercontent.com/metal3d/goswitch/master/goswitch -O /usr/local/bin/goswitch
sudo chmod +x ~/.local/bin/goswitch
```


## Usage

```
goswitch command <version>
Commands:
   list:                  list installed version
   available:             list installable go version from golang.org
   install <version>:     install go-<version> (version should be x.y.z, eg. goswitch install 1.9.1)
   use <version>:         to be call with "eval $(goswitch use <version>)" to set env vars on current shell
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

## Completion

goswitch can provide bash completion, to test, you may try that command in bash session:

```bash
source <(goswitch bash-completion)
```

Then, type "goswitch" and hit `TAB` key on keyboard, completion can also propose installed versions for "use" command, or available versions for "install" command.

If that works for you, add the source command into you `~/.bash_profile` file to have it for next shell session.

