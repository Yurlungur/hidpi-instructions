#Instructions for hidpi on Ubuntu Linux

Author: Jonah Miller (<jonah.maxwell.miller@gmail.com>)

### For unity

Adjust unity to hi dpi by going to:
```
unity-control-center -> Displays -> Scale Menu and Title Bars
```
See: <http://askubuntu.com/questions/472262/adapt-ubuntu-to-a-high-dpi-resolution-screen>

### To make Firefox hidpi:

* Open Firefox and go to `about:config` in the url bar
* search for `layout.css.devPixelsPerPx` and set this value to 2.0
* Install the [fix zoom add-on](https://addons.mozilla.org/en-US/firefox/addon/fix-for-zoomed-default-font/)
* finally install [nosquint](https://addons.mozilla.org/en-US/firefox/addon/nosquint/) and set the default zoom level to 120%

Source: http://askubuntu.com/questions/487032/adjust-firefox-and-thunderbird-to-a-high-dpi-touchscreen-display-retina

### Thunderbird

* Go to`edit -> preferences -> advanced -> configuration editor`
* set `layout.css.devPixelsPerPx` to 2.0

### Systemwide fix

NOTE THAT THIS LIKELY SCREWS UP EXTERNAL MONITORS

* Set your display size in `90-monitor.conf`
* Copy `90-monitor.conf` to `/usr/share/X11/xorg.conf.d`
* Copy `hidpi.sh` to `/etc/profile.d` and make it executable with `chmod a+x`


### Unity Greeter

* in the `file /usr/share/glib-2.0/schemas/com.canonical.unity-greeter.gschema.xml` set the key xft-dpi to default 192 with:
```xml
<key name="xft-dpi" type="d">
      <default>192</default>
      <summary>Resolution for Xft in dots per inch</summary>
</key>
```
* source: http://askubuntu.com/questions/540863/how-can-i-make-lightdm-scale-on-a-hidpi-screen

### Java

* Java and other applications that don't scale... write a script to tell them what to do using the API.
* see: http://askubuntu.com/questions/526484/fix-scaling-of-java-based-applications-for-a-high-dpi-screen

### rxvt-unicode

I use URXVT. You can change this to have reasonably sized fonts by using XFT fonts. Install these with
```bash
sudo apt-get install -y libxft2 libxft-dev libxft-udeb
```
and adding the lines
```
Xft.dpi:       220
URxvt.font: xft:DejaVuSansMono:size=8
URxvt.italicFont: xft:DejaVuSansMono:size=8
```
to your `~/.Xresources` file. If you don't have one, or you're not sure, run the following:
```bash
FILE=${HOME}/.Xresources
echo "Xft.dpi:       220" >> $FILE
echo "URxvt.font: xft:DejaVuSansMono:size=8" >> $FILE
ehco "URxvt.italicFont: xft:DejaVuSansMono:size=8" >> $FILE
```

