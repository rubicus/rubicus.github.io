---
title: "Setting up a media center and NAS - part 1 (NAS)"
tags:
  - TV
  - server
---

So I have a 10 year old computer standing around, that I've previously used as a
router. Now that I have a TV I thought it would be nice to have a
computer connected to it, and since I have several computers, having a central
storage ponint for files would be nice addition as well. While the computer
is 10 years
old, it has an Intel core 2 duo E6600, an ATI Radeon X1950 pro, and 2 GB
of RAM, so it should be able to play 1080p material without to much trouble.

So I figured I would like some sort of RAID structure for this in case of a drive
failure. The plan was to run a RAID 5 structure with 3 1 TB drives. This
way I can get 2 TB of storage with redundancy in case one of the drives
should fail. I also use an old 30 GB drive for running the OS off, since
it's so much easier booting linux from a non-RAID partition.

<img src="/img/nas/hardware.jpg">

<!--more-->

After connecting everything and starting the computer for the first time
I realized it was a bit more loud than I'd be comfortable having in my
living room. Most importantly there was a hum decreasing and increasing in
intensity with something like a 1 Hz frequency (think bwuUUum bwuUUum), that
was very annoying to listen too.

By diconnecting things one by one I came to the conclusion this came from
the RAID array. Having 3 drives close to eachother in a rigid frame each
spinning at 7200 RPM, they spin at slightly different speeds, and these
small differences cause this sort of hum. To try and mitigate this I tried
adding some electrical tape in well thought out locations around this area, and
other areas that seemed to increase the resonance of these sounds, and
it seems to work! The annoying hum is gone and I only have the much less
irritating fan whir remaining.

Next up was an OS. I choose to run Ubuntu, mostly since it's the Linux
distribution that I'm most used too, and it tends to live up to essentially
everything I ask from a linux distribution. Since I don't necessarily want
to update the version and risk breaking things every 6 months, I choose to
use the 16.04 LTS edition, which will receive security updates for a long
time to come.

Setting up the RAID was easy since I'm not booting from the RAID itself.
Essentially I just follow the setup instructions from the Linux RAID setup
page [here](https://raid.wiki.kernel.org/index.php/RAID_setup). After
setting up partitions on all of the three Raid drives, I install
the management tool - mdadm with `sudo apg-get install mdadm`.

Then it's easy to create the RAID device with

{% highlight bash %}
$ sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /sdd1
{% endhighlight %}

And then create an ext4 filesystem and put it in /etc/fstab.

Once this is done the samba connection needs a setup as well. There's a nice
guide for doing this too on the
[ubuntu community wiki](https://help.ubuntu.com/community/Samba/SambaServerGuide).
I setup
some folders in my newly mounted partition for private, public and guest.
The idea being that people visiting and connecting to my network should be able
to access media files like video and music, but not things like photos.
Accordingly, I chmod my folders (777 for guest, 775 for public and 770 for
private), and edit my /etc/samba/smb.conf.

First I make sure to switch workgroup and turn on WINS support
(I add my computer as a WINS server in my router's DHCP settings as well)
to get better performance in browsing computers on the network. I also
specify the interface that is connected to the local network. Then I simply add
the following to the end of the file:

{% highlight conf %}

[public]
   comment = Publicly shared folders
   browseable = yes
   writeable = yes
   path = /media/RAID/public
   create mask = 755
   directory mask = 755
[private]
   comment = privately shared folders
   browsable = yes
   writeable = yes
   path = /media/RAID/private
   create mask = 700
   directory mask = 700
[guest]
   comment = Sandbox for guests
   browsable = yes
   writeable = yes
   path = /media/RAID/guest
   create mask = 777
   directory mask = 777
   guest ok = yes

{% endhighlight %}

After setting the samba password with `sudo smbpasswd <username>`
and restarting samba with `sudo smbd reload`,
I now had the NAS part of the server working as it should! The rest of the
setup (things like media center and steam in-home streaming)
will have to be covered in another post.