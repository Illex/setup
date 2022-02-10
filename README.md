This is my setup script to expedied the setup process of new linux installs
it will installed my preferred programs and setup i3-gaps with a basic rice and
my preferred settings.

to use, navigate to your home directory <cd> and clone this repository

chmod +x the setup.sh file and run it as sudo, the follow the prompts. you may need to 
press a key periodically so it's not fully automatic
  
I3 navigation is slightly changed to use vim standard home row navigation instead of whatever
insane setting they had as default, as such the mod+o command now switches back to horizontal tiling
in my config the mod key is alt

to change the background, place whatever image you want to use in the setup directory and rename it to 
background, then use mod+shift+r to restart i3, the image should now be your wallpaper
  
  ******* Important ********
  
  There are still a couple of small bugs mostly to do with file copies
  you will have to install nvim plugin manager manually, see
    https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/
  
  also, the i3status.conf needs to be copied to the /etc directory manually. otherwise the
  install script works as intended
