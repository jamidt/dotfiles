import shutil
import distutils.dir_util
import re

from os.path import expanduser
home = expanduser("~")

# vim
print("vimrc")
shutil.copy("vimrc", home + "/.vimrc")

# git
print("git")
shutil.copy("gitignore_global", home + "/.gitignore_global")
gitconfig_tmp = "gitconfig_tmp"
with open(home + "/.gitconfig", "r") as gitfile, open("gitconfig", "r") as newgitfile,\
        open(gitconfig_tmp, "w") as gitfile_tmp:
    usersection = re.compile("\[user\]")
    section = re.compile("\[.*\]")
    isusersection = False
    user_config = []
    for line in gitfile.readlines():
        if usersection.search(line):
            isusersection = True
            continue
        elif section.search(line):
            isusersection = False
            continue
        else:
            if isusersection:
                user_config.append(line)
                continue
            else:
                continue
    if user_config:
        gitfile_tmp.write("[user]\n")
        for line in user_config:
            gitfile_tmp.write(line)
    for line in newgitfile.readlines():
        gitfile_tmp.write(line)
    shutil.move(gitconfig_tmp, home + "/.gitconfig")

# Zsh
print("zsh")
shutil.copy("zshrc", home + "/.zshrc")
distutils.dir_util.copy_tree("oh-my-zsh", home + "/.oh-my-zsh")

# i3
print("i3")
distutils.dir_util.copy_tree("config/i3", home + "/.config/i3")
