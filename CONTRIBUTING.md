# To contribute, please follow that instructions:

First, thanks to you - we're happy that you're insteressed about our project and we will be very happy to merge your work. But, first, check if you've followed that instructions:

- have you fork the project ?
- do you use "devel" branch ?
- have you committed your changes in a new branch ?
- have you got "rebased" your branch over "devel" ?

When you've made a branch, and inserted your commits, please sync it with devel branch:

```
# example: 
# Your fork is the "origin" remote,
# you've made a fix-error branch to fix something
git checkout fix-error

# if you didn't setup a remote repository from our,
# set "upstream" remote that points on our project:
git remote add upstream git@github.com:metal3d/goswitch.git

# Sync devel with your own devel branch
git fetch upstream devel:devel
git rebase -i devel

# squash your commits as you want, then:
git push -f origin fix-error
```
Now, you've got a "fix-error" on you repository, you can propose a merge-request on "devel".

If you answered yes to that questions:

- create a pull-request
- wait for an administrator to review and validate

And, please, be patient !

# If your branch is validated and merged

You will be able to checkout our devel branch and remove your fix branche.
