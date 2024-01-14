Raspberry-Pi Emulator Setup
====================
An `armv6l` Raspberry-Pi emulator running Raspbian Jessie 2017 (stablest version for QEMU).

### Setup Instructions
1. Clone the repository anywhere (will be deleted later), then move the file `raspi-vm` to a desired location (will take up >8 GiB).
    ```
    $ git clone https://github.com/s7a19t4r/s7a19t4r
    $ mv s7a29t4r/raspi-vm/ <your raspi dir>
    ```
    If you are not going to use my other config files, delete the cloned repository (be careful with this command):
    ```
    $ rm -rf s7a19t4r/
    ```
2. Download the image file for Raspbian Jessie 2017 (4 GiB): [Click Here for Direct Download](https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip) (from [Raspberry-Pi Downloads Page](https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/))
3. Move the downloaded image file to the directory of the Raspberry-Pi emulator:
    ```
    $ mv <dir of download> <raspi dir>
    ```
4. Boot the emulator with provided shell script:
    ```
    $ ./launch.sh
    ```
    When booting, it will say that it failed to start linux kernel modules, this is fine and the emulator will still function normally.
5. After the emulator boots, open the terminal and enable SSH
    ```
    $ sudo service ssh enable
    ```
    To enable SSH by default, add the above command (without the `$`) to the `/etc/rc.local` file. Make sure the command is <b>above</b> `exit 0` (or it will not be run). To do this:
    ```
    # use any command line text editor like nano or vim, which is preinstalled, to open the file
    $ sudo nano /etc/rc.local
    ```
    Then add `sudo service ssh enable` somewhere <b>above</b> `exit 0`, and save and exit with `ctrl+x` then `y` then `<enter>`.

6. Change the password of the Raspberry-Pi to avoid using the default:
    ```
    $ sudo passwd
    ```
    Then follow the simple instructions.

---

Because of full screening issues with the QEMU emulator and issues with VIM on the terminal console, open a new terminal tab/window and `SSH` into the emulator to use:
```
$ ssh pi@127.0.0.1 -p 5022
```
This is why we enabled SSH be default when the emulator boots. 
It is advised to never use the actual emulator, and to only use the console (the terminal window that the emulator was booted from, 
where the status messages for boot were printed) when you are not using VI, VIM, or any other command line editor.

Otherwise, you can easily `ssh` into the Raspberry-Pi by setting an alias for the `ssh` command and placing it in your `.bashrc` or `.zshrc`
```sh
alias rpissh='ssh pi@127.0.0.1 -p 5022'
```

---

At this point, the emulator will easily run out of memory from `apt` libraries when software such as GDB is used.
This is why the image file downloaded must be resized from 4 GiB to 8 GiB and the disk (`sda2` for this emulator) must be repartitioned.

<b>Instructions to resize and repartition:</b>

[This article](https://sandilands.info/sgordon/increasing-kvm-virtual-machine-disk-using-lvm-ext4) 
explains the process of repartitioning step by step (so it is pointless to re-explain everything in this document).

I recommend resizing to 8 GiB, as that will be enough for normal use (running programs, GDB, etc.) and will not take up too much space on the host drive.
The disk partition to delete and replace is `sda2`, the disk type is `primary`. When the article says to launch the VM/emulator, use the `./launch.sh` script.
Skip the LVM step, as we are not using LVM.

---
#### Transferring Files
To transfer files from the host to the virtual machine, you can use `scp`:
```
scp -P 5022 <src file> pi@127.0.0.1:<remote dir>
```
Below is an alias to save from typing out the long `scp` command (place in `.bashrc`, `.zshrc`, etc.):
```sh
function rpiscp(){
    local src=${1}
    local dir=${2}
    scp -P 5022 ${src} pi@127.0.0.1:~/hostshared/asm/${dir}
}
```
---
### Known Issues:
- GDB has issues with refreshing, so running GDB commands like `s` and `n` require a `ref` afterwards. You can fix this by redefining commands in your `.gdbinit` to execute that command, then refresh. Example below:
    ```
    define n
        next
        refresh
    end
    ```
    note that if you put `define n`, the command inside the definition should be written out, like `next`. If not, it will refresh twice, which wastes time, and GDB is quite slow on the emulator.

