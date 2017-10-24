# Go Switch

Install and switch version from official golang.org website.

Go Switch help you to setup a Go version and environment variables.

Why to not use [gvm](https://github.com/moovweb/gvm) ? No reason, I only wanted to make my own in shell script :)

My script is just a bit less heavy, simple and has not a lot of options. GVM is a great project that you should use if goswitch doesn't answer to your needs.

## Installation

```
# If ~/.local/bin is in your PATH
curl https://raw.githubusercontent.com/metal3d/goswitch/master/goswitch -o ~/.local/bin
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




