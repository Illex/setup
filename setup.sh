#!/usr/bin/env python3

#module for modifying the operating system
import os

print("This script will install all of my preferred programs, my vim setup, and I3 gaps with my own basic rice")
print("as such this script needs to be run as super user, NEVER run an unverifed program as super user if your aren't")
print("absolutely sure it can be trusted")
print()

x = input("Continue? yes/no: ")
if x == "yes":
    print("typed yes")
elif x == "no":
    print("typed no")
    print("exiting")
    exit()
else:
    print("no input given, exiting")
    exit()

proton = input("install protonvpn? y/n:")
mouse = input("use illex's mouse settings? y/n:")
screen = input("use illex's screen settings? y/n:")
#usr = os.environ.get('USERNAME')

#add the i3 gaps repository so it can be installed via cmd
os.system("sudo add-apt-repository ppa:regolith-linux/release")
os.system("sudo apt-get update -y && sudo apt-get upgrade -y")

# read a \n seperated list of programs, for each program do a sudo apt install
programList = open("programList", "r")

print("The following other programs are about the be installed, if you want to edit this list you may add or remove programs")
print("from the programList file, every program name must be on a newline and must be in the ubuntu repository")


#put all the files in an iterable list
list = programList.readlines()

for i in range(len(list)):
    print(list[i], end="")

x = input("Continue? yes/no: ")
if x == "yes":
    print("typed yes")
elif x == "no":
    print("typed no")
    print("exiting")
    exit()
else:
    print("no input given, exiting")
    exit()


#install all the programs in the list
for i in range(len(list)):
    print(list[i], end="")
    os.system("sudo apt-get install -y " + list[i])

#download and install protonvpn, when the link updates, this section will break
if proton == "y":
    os.system("wget https://protonvpn.com/download/protonvpn-beta-release_1.0.1-1_all.deb")
    os.system("sudo apt-get install protonvpn-beta-release_1.0.1-1_all.deb -y")
    os.system("sudo apt-get update")
    os.system("sudo apt-get install protonvpn-cli")

#use included mouse profile
if mouse == "y":
    os.system("sudo cp setMouseConfig.sh ../.config")
else:
    os.system("sudo touch ../.config/setMouseConfig.sh")
#set the config script to be executeable
os.system("sudo chmod +x ../.config/setMouseConfig.sh")

#use included screen profile
if screen == "y":
    os.system("sudo mkdir ../.screenlayout")
    os.system("sudo cp 3monitor.sh ../.screenlayout/")
    os.system("sudo chmod +x ../.screenlayout/3monitor.sh")

#set vim to alias for nvim
os.system("alias vim='nvim'")

#copy the i3 config to the right location
os.system("sudo mkdir ../.config/i3")
os.system("sudo cp config ../.config/i3/config")

#copy i3 bar conf to right location
os.system("sudo cp i3status.conf ../etc")

#copy the airbladder compton config
os.system("sudo cp compton.conf ../.config")

#setup nvim plugin manager
os.system("sudo apt-get install fuse libfuse2 git ack-grep -y")
os.system("curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
#copy vim config to proper location
os.system("sudo mkdir ../.config/nvim")
os.system("sudo cp init.vim ../.config/nvim")

# seg gtk theme
print()
print("installation is not quite complete, some manual operations are required")
print("before continuing you need to either restart your terminal or open a new one")
print("and run the following commands in the new window")
print()
print("first, open .config/nvim/init.vim and type the following keys <:PlugInstall>")
print("after the install completes, type <:q!> then hit enter")
print("do so again to exit vim")
print()
print("if you installed protonvpn you will need to run <protonvpn-cli login>")
print("you will also need to run <sudo lxappearance> to set the gtk theme, this will make your windows look nicer")
print()
print("dont forget to setup ssh")
print()
print("after all this configuration is complete you should have a fully featured i3 setup, simply logout")
print("and login after changing to the i3wm")
print("see README.md for further configuration information")
