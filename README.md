# FDFORMAT
fdformat - Set of floppy utilities including xformat.exe - Format Floppy Disks with Higher Capacity

This project is of historic interest only.  
[Christoph Hochstätter](https://github.com/christoh) worked on it between 1988 and 1991.  
It is written in Turbo Pascal and x86 Assembly.  
It runs under MS-DOS/PC-DOS 3.20 or higher and also Windows 95/98/98SE/ME. 

SYSTEM REQUIREMENTS
-------------------

IBM or compatible Computer  
DOS 3.20 or above  
4.77Mhz. 8088  


FEATURES OF FDFORMAT
--------------------

FDFORMAT is a replacement for the DOS-Format program, which has the 
following advantages:

1) Supporting 3½"-1.44 MB drives with any BIOS-Versions in ATs and
   Clones. This saves you a lot of money, you would need for a new
   BIOS-Version.
2) Formatting and using of 720/820 kByte disks in AT 5¼"-1.2 MByte
   Drives using cheap double-density (DD) disks.
3) Increasing the capacity of your disks up to 300 kByte additional
   storage.
4) Supporting 3½"-360 kByte format. This is useful, when you want to
   make copies of 5¼"-disks to 3½"-Disks using DISKCOPY
5) Enhance speed of your diskette I/O up to 100% with sector sliding.
   This is a method of physical ordering sectors in a  way, that your
   drive is ready to read the next logical sector, when your head
   advances one track.
6) Improved BOOT-Sector, which automatically boots from harddisk, if
   the diskette in drive A: is not a system disk. This allows you to
   leave the diskette in drive A:, when you reboot the system.


GETTING STARTED
---------------

To make full use of FDFORMAT, you have to make a small TSR resident in 
memory. There are two different TSRs for XT-computers and AT-
computers. 80386/80486 machines are treated as AT computers here. The 
TSR for AT computers is FDREAD.EXE and for XT computers it is 
FDR88.EXE. Both TSRs use less than 200 Bytes resident memory.

To make FDREAD (or FDR88) resident simply type FDREAD (or FDR88) from 
the DOS-Command-Line. Or install it in your AUTOEXEC.BAT file. If you 
have a memory-manager installed, that supports UMB (like QEMM, QRAM, 
mov'em or 386-Max), do not load FDREAD (or FDR88) high. The TSR 
automatically detects the memory manager and will load high itself.

FDREAD will also automatically load high on computers with a 286(!!!) 
processor and up, if DOS 5 or higher is used. You must have HIMEM.SYS 
(or another XMS-Driver) installed and put DOS=HIGH in your CONFIG.SYS 
file. Since this technique of high-loading is quite tricky, you must 
ensure, that FDREAD is loaded before any program that plays with the 
A20 line and grabs the Interrupt 13 (Hex). This is the case for some 
disk-caching programs like HYPERDISK(TM). If you are using a disk-
caching program, load FDREAD before the caching program. Also, if the 
system hangs, after you installed FDREAD, load FDREAD as the first 
TSR.

If you get the error "Too much memory available". You must load FDREAD 
twice to avoid this error.

The TSR is required to support diskette formats, which are non-
standard under DOS. If you intend to use FDFORMAT only with DOS-
standard-diskette-formats, you do not need FDREAD (or FDR88).

Note, that it is not possible to create bootable diskettes, which 
require the TSR. It may also be possible, that a format, which can be 
read without the TSR on your computer, will fail on another computer. 
If you are creating bootable diskettes, it is recommended only to use 
DOS-standard-formats.


USING FDFORMAT
--------------

The general Syntax for FDFORMAT is:

                 FDFORMAT <drive> [options]

<drive> may be A: or B:. FDFORMAT does not format harddisks. Options 
begin with a letter or number. Options may be preceeded by '/' or '-'. 
If you do not preceed options with '/' or '-', you must seperate the 
options with spaces. '.' and ':' are always ignored. So the following 
commands will all format a 1.44 MByte Disk in Drive A:

```
 FDFORMAT A: /F:1.44
 FDFORMAT A: -F144
 FDFORMAT A: F144
```

You may precede all numbers with a $-sign to indicate, that they are 
hexadecimal numbers.

OPTIONS USED IN FDFORMAT
------------------------

The most important option is the F-Option. The F-Option determines the 
general Format, which is used for the target diskette.

The following table shows, which parameters are allowed for the F-
Options and for which type of Disk-Drive:

```
	F-Opt Format          360k-Drive 720k-Drive 1.2M-Drive 1.44M-Drive
	----- --------------- ---------- ---------- ---------- -----------
	F160  160 kByte Disk  yes        FDREAD     yes        FDREAD
	F180  180 kByte Disk  yes        FDREAD     yes        FDREAD
	F200  200 kByte Disk  FDREAD     FDREAD     FDREAD     FDREAD
	F205  205 kByte Disk  FDREAD     FDREAD     FDREAD     FDREAD
	F320  320 kByte Disk  yes        FDREAD     yes        FDREAD
	F360  360 kByte Disk  yes        FDREAD     yes        FDREAD
	F400  400 kByte Disk  FDREAD     FDREAD     FDREAD     FDREAD
	F410  410 kByte Disk  FDREAD     FDREAD     FDREAD     FDREAD
	F720  720 kByte Disk  no         yes        FDREAD     yes
	F800  800 kByte Disk  no         FDREAD     FDREAD     FDREAD
	F820  820 kByte Disk  no         FDREAD     FDREAD     FDREAD
	F120  1.2 MByte Disk  no         no         yes        yes
	F12   1.2 MByte Disk  no         no         yes        yes
	F144  1.44 MByte Disk no         no         FDREAD     yes
	F14   1.44 MByte Disk no         no         FDREAD     yes
	F148  1.48 MByte Disk no         no         FDREAD     yes
	F16   1.6 MByte Disk  no         no         no         FDREAD
	F164  1.64 MByte Disk no         no         no         FDREAD
	F168  1.68 MByte Disk no         no         no         FDREAD
	F172  1.72 MByte Disk no         no         no         FDREAD
```

FDREAD in the above table means, that this format will work only, if 
FDREAD (or FDR88) is installed. You may find out, that this table will 
not be valid for your table and that you can use certain diskette 
formats without FDREAD (or FDR88), that are listed to work with FDREAD 
(or FDR88) only.

The other options are:

```
    1    : Format single sided Disk (provided for DOS-FORMAT
           compatibility).
    4    : Format Standard 360 kByte Disk (provided for DOS-FORMAT
           compatibility).
    8    : Format 8 sector Disk (provided for DOS-FORMAT compatibility).
    A    : Use BIOS-Calls only to switch to different diskette types.
    Bnnn : Use Disk-Type Byte nnn (for use with older BIOS Versions).
    Cnnn : Use nnn Sectors per Cluster (nnn = 1 or 2).
    Dnnn : Use nnn Root-Directory-Entries (nnn = 1-224).
    Gnnn : Use Gap-Length of nnn (for use by experts only).
    Hnnn : Use nnn heads (nnn = 1 or 2).
    Innn : Use an Interleave of nnn (for use by experts only).
    K    : Do not wait for any keyboard input, when starting FDFORMAT.
           (Useful, when starting FDFORMAT from batch files).
    Mnnn : Use Media Byte nnn (Useful for ATARI formats).
    Mnnn : Use Media-Descriptor-Byte nnn. (Useful when formatting ATARI ST
           disks).
    Nnnn : Use nnn Sectors.
    O    : Format 720 kByte disk for use with AT&T/Olivetti M24/M28.
    Q    : Quick Format. Only rewrite the System-Area.
    R    : Do not verify disk (and save 33% time).
    S    : Make System-Disk.
    Snnn : Use nnn Sectors.
    Tnnn : Use nnn Tracks.
    U    : Unconditionally format the diskette.
    V    : Write Label to Disk.
    W    : Format with erase. Physically reformat diskette without data
           loss
    Xnnn : Slide nnn Sectors, when head changes.
    Ynnn : Slide nnn Sectors nnn, when track changes.
```

Examples:

```
    FDFORMAT A: /4                                    (format 360 kB disk)
    FDFORMAT A: /F:1.72                              (format 1.72 MB disk)
    FDFORMAT A: /T:80 /N:9                            (format 720 kB disk)
    FDFORMAT A: /O                    (format 720 kB disk for AT&T M24/28)
    FDFORMAT A: /F:720 M$F7 B$54         (format 720 kB disk for ATARI ST)
    FDFORMAT A: /F:12 D64                (format 1.2 MB disk with 64 RDEs)
    FDFORMAT A: /F:410 R               (format 410 kB Disk without verify)
```


DETAILED DESCRIPTION OF OPTIONS
-------------------------------


The Q and the U option
----------------------

Beginning with version 1.8. FDFORMAT formats disks the same way as 
DOS-FORMAT of DOS Version 5. If the Q and U options are not specified, 
FDFORMAT checks, if the diskette is already formatted in the format 
you have choosen. If this is true, FDFORMAT only verifies the disk and 
rewrites the System-Area. If the disk is formatted in another format, 
a real low-level formatting is performed. If you specify the U option, 
the diskette will be low-level formatted in any case.

The Q option specifies a quick format. FDFORMAT tries to determine the 
current diskette format and then only rewrites the system area. All 
options to specify a different format are ignored, if you specify the 
Q option. FDFORMAT will also skip verifying, if the Q option is 
selected. If the Q option is selected and FDFORMAT cannot find a valid 
boot sector, the diskette will be low-level formatted with the format 
you specified.


The Tnnn option - Use nnn Tracks
--------------------------------

This option tells FDFORMAT, how many tracks are to be used. A Standard 
360 kB diskette has 40 tracks, all other standard formats have 80 
tracks. You can set this option to 1-41 for an 360 kB drive and to 1-
82 for all other drives. The more tracks you use, the more storage you 
will receive. Some drives allow even more than 41 or 82 tracks, but 
you may have trouble, when trying to read this diskette on another 
disk drive. The default is 40 for a 360 kB Drive and 80 for all other 
drives.

Example: FDFORMAT A: /T:41 (format a disk with 41 Tracks. This will 
give you 369 kB storage in a 360 kB drive)


The Nnnn option - Use nnn Sectors per Track
-------------------------------------------

This option determines the number of sectors per track you will use. 
The standard and default values for the different formats are:

```
    disk format standard value maximum value possible
    ----------- -------------- ----------------------
    360 kB            9                  10
    720 kB            9                  10
    1.2 MB           15                  18
    1.44 MB          18                  21
```

You may use this option to increase the storage of your diskette too.

Example: FDFORMAT A: /N:10 (format a disk with 10 sectors. This gives 
you 400 kB storage in a 360 kB drive).


The Hnnn option - Use nnn sides (1 or 2)
----------------------------------------

You can set this option to 1 or 2. The default is always 2. Normally 
you do not need this option, since single-sided disks are rarely used.


Using T,N and H together
------------------------

These three options determine your diskette storage. The formula for 
the diskette storage is:

                      tracks * sectors * sides
      storage in kB = ------------------------
                                  2

Since diskettes use usually 2 sided, you can simplify this formula to:

      storage in kB = tracks * sectors

Examples:

```
          FORMAT A: /T:80 /N:9 /H:2 (format a 720 kB disk)
          FORMAT A: /T:82 /N:10 /H:2 (format a 820 kB disk)
          FORMAT A: /T:40 /N:9 /H:2 (format a 360 kB disk)
          FORMAT A: /T:41 /N:10 /H:2 (format a 410 kB disk)
```

You can use the F-Option (described above) as a shortcut for the T, H 
and N options (eg. FORMAT A: /F:1.44 is equal to FORMAT A: /T:80 /N:18 
/H:2).

Note: Always use High-Density-Diskettes when you format with more than 
11 sectors/track and always use double-density-disks, when you format 
with 10 sectors and below.

Look at the following table to see, which values are maximum for T, H 
and N.

```
    Drive and disk                  max T  max N  max H Storage
    ------------------------------  -----  -----  ----- -------
    360 kB drive with DD-diskette    41     10      2    410 kB
    720 kB drive with DD-diskette    82     10      2    820 kB
    1.2 MB drive with DD-diskette    82     10      2    820 kB
    1.2 MB drive with HD-diskette    82     18      2   1.48 MB
    1.44 MB drive with DD-diskette   82     10      2    820 kB
    1.44 MB drive with DD-diskette   82     21      2   1.72 MB
```

The Cnnn option - Use nnn sectors per cluster (1 or 2)
------------------------------------------------------

A cluster is the minimum allocation unit DOS can handle. DOS supports 
1 or 2 sectors per cluster for floppy disks. If you specify /C:1 space 
is allocated in 512 Bytes steps. /C:2 means that space is allocated in 
1024 Byte steps. You can optimize your disk organization, if you use 
/C:1, when you plan to store "many small" files and specify /C:2, when 
you plan to store "few large" files on the disk to be formatted. The 
default is /C:1 for high density disks and /C:2 for double density 
disks

Example: FORMAT A: /F:360 /C:1 (format a 360 kB disk with 1 sector
per cluster)

Note: A blank formatted disk with /C:2 always has more bytes free than 
with /C:1. But when files are stored to the disk, your disk space will 
be handled more dynamically.


The Dnnn option - Use nnn Root-Directory-Entries
------------------------------------------------

This option determines the number of Root-Directory-Entries. The 
default is 112 for double density disks and 224 for high density 
disks. This value can be reduced to get additional space on disk or 
increased up to 240 to reserve for space for files in the root 
directory. This option does not affect any of your subdirectories. 
Subdirectories are dynamically allocated. You only have to determine 
the size of root directory. Legal values for disks with 1 sector per 
cluster are 16, 32, 48, .... and for disks with 2 sectors per cluster 
16, 48, 80, .... if you specify a value between two legal values, it 
will be increased to next legal value
automatically.

Example: You need a disk that will not have more than 40 files in the 
root directory. So type: FDFORMAT A: /D:40. You will get a disk with 
48 root directory entries and you have more space for data.


The O option - Format a disk for AT&T/Olivetti M24/M28 Computers
----------------------------------------------------------------

This option is actually a shortcut for /T:80 /N:9 /H:2 /D:144. The 
AT&T and Olivetti M24/M28 Computers use 720 kB Disks with 144 root 
directory entries. The standard IBM 720 kB format has 112 root 
directory entries. So simply use the /O option to format a diskette in 
a 5¼"-1.2 MB drive or a 5¼"-720 kB drive.

Example: FDFORMAT A: /O

Note: If you could not read M24/M28 720 kB disks in your 1.2 MB
drive until now, try again with FDREAD installed. It will work
fine.


The Mnnn option - Override media descriptor
-------------------------------------------

FDFORMAT uses the same media descriptor byte as DOS-Format would do. 
If you override this value, this has no effect under DOS 3.3x or DOS 
4.0x. But you may not be able to read the disk under DOS 3.2x. This 
option was added to support to format disks for the ATARI ST. Refer to 
the ATARI Documentation to set the correct Values for the media 
descriptor and track, heads, sectors.


The R option - Do not verify disk
---------------------------------

The R option skips verifying each track after it has been formatted. 
This saves 33%-50% of time during formatting a diskette. The 
disadvantage is that errors on the diskette are not detected. A 
typical example for missing error detection is typing FDFORMAT A: /R 
in an 1.2 MB drive with a double density disk inserted. FDFORMAT will 
not report any errors in this case. If you are sure that you have a 
good diskette and you specified no wrong parameters, the /R option is 
a good choice to save time.


The K option - No keyboard input
--------------------------------

The K option suppresses the message "Insert new disk in drive...." and 
starts formatting immediately, after FDFORMAT is started. This is 
useful, if you want to start FDFORMAT from a batch file or an external 
program. You can also suppress any screen output, if you add ">NUL" to 
the FDFORMAT command (See your DOS Manual for piping input and 
output). FDFORMAT returns an exit code or errorlevel, which can be 
used in batch files. The exit codes are:

```
Exit Code Meaning
--------- ----------------------------------------------------
  0       normal completion
  1       syntax error or illegal parameters
  2       specified drive cannot be formatted
  3       cannot determine format for format without erase
  4       aborted by user (after I/O error or by Ctrl-Break)
  8       I/O error for config file
 16       syntax error or illegal parameters in config file
 32       error writing disk label
128       incorrect DOS version (< 3.20)
```


The S Option - Format system disk
---------------------------------

The S option lets you format a system disk. It copies boot-sector, 
DOS-System-file and COMMAND.COM to your disk. FDFORMAT does not do 
these task by itself, but calls the DOS-Command SYS to do so. Thus you 
must make sure, that SYS.COM or SYS.EXE is in a directory, which is 
included in your PATH Environment Variable. The call to SYS is made to 
ensure compatibility with any DOS Version.

Note: You cannot create a system disk, which cannot be read without 
FDREAD.


```
Example: FDFORMAT A: /F:360 /S (correct)
         FDFORMAT A: /F:410 /S (incorrect, because this
                                format requires FDREAD)
```

The 1 Option - Single sided disk
--------------------------------

This is the same as the /H:1 option. provided for syntax compatibility 
with DOS-Format.


The 8 Option - 8 sector disk
----------------------------

This is the same as the /S:8 option. provided for syntax compatibility 
with DOS-Format.


The 4 option - 360 kB disk
--------------------------

This is the same as the /F:360 option. provided for syntax 
compatibility with DOS-Format.


The P option - Does nothing
---------------------------

This option does really nothing in FDFORMAT Versions above 1.2. It was
provided for compatibility with earlier versions.


The V option - Write volume label
---------------------------------

This option writes a volume label to your disk. You may specify simply 
/V. This will prompt you for a volume label. You may also specify 
/V:<disklabel>. This will write the name <disklabel> to your disk.

Example: FDFORMAT A: /F:820 /V (prompts for volume label)
         FDFORMAT A: /V:mydisk (Writes volume label MYDISK)


The X and Y options - Do sector sliding
---------------------------------------

These options can be used to enhance the performance of your disk up 
to 100%. This is a bit difficult to explain. Imagine a standard 360 kB 
disk. It has 9 sectors on each track numbered 1 to 9. Normally the 
sectors on all tracks ordered "1 2 3 4 5 6 7 8 9". With sector sliding 
of 1 you order "1 2 3 4 5 6 7 8 9" on track 0, "9 1 2 3 4 5 6 7 8" on 
track 1, "8 9 1 2 3 4 5 6 7" of track 2 and so on.

You can easily imagine, that it takes a little time, when your 
diskette drive head steps from one track to another. But your diskette 
continues rotating. Without sector sliding your diskette is positioned 
to sector 2 or 3 on the next track, when the stepping is done. It 
needs nearly a full revolution until sector 1 of the next track can be 
read. With sector sliding of 1 or 2 your diskette is positioned 
exactly on sector 1, when it starts reading again.

The DOS-Format program always formats with sector sliding 0. FDFORMAT 
provides two parameters to do sector sliding. /Xn slides n sectors, 
when you change the head, but not the track. /Ym slides m sectors, 
when you change the track. Normally only /Y is useful, but on some 
systems, especially XTs, you can reach additional speed by using /X.


Now, how to determine the correct value for sector sliding. In general 
you can say good values for /X are 0-2 and for /Y 0-4. The default is 
0 for /X and /Y. You to experiment with your configuration, which 
value is optimal for you. You may reconfigure your default sector 
sliding in the FDFORMAT.CFG file (described later). You have to find 
out this for each format seperately. Always good choices are the 
following:

```
Disk-Size          Good choice for sector sliding
------------------ ------------------------------
320-410 kB              /X:1 /Y:3
720-820 kB              /X:1 /Y:2
1.2 MB-1.72 MB          /X:2 /Y:3
```

This will improve your diskette perfomance 50%-100% on almost any 
system.

Example: FDFORMAT A: /4 /X:1 /Y:2 /R/K/V:SLIDE_DISK


The W option - Format without erase
-----------------------------------

This option is used to reformat a diskette. This is useful, when you 
have diskette, that is still readable, but only with several retries. 
This is often the case, if you try to read a 360 kB Diskette in a 360 
kB drive, that was written in an 1.2 MB drive.

If you choose this option, no modifications are made to diskette. If 
you e.g. specify a different format or volume label, these options are 
ignored. The diskette will be read in track by track. Then the track 
will be reformatted and the data is written back to the diskette.

It is safe to press Ctrl-Break during format without erase, because 
the exit-request is notified, when you press Ctrl-Break, but 
performed, when the current track is completely written.


The A option - Use BIOS-Calls only to change diskette type
----------------------------------------------------------

This option tells FDFORMAT to use only BIOS-Calls to change the 
diskette type and not to write the Media Byte directly. This option is 
required on most XT-Systems with HD-Controllers and external diskette 
drives. It has the typical disadvantage, that some BIOS Versions do 
not support every Media Type in every drive. So use this option only, 
if you encounter problems without it. This option is also configurable 
in the FDFORMAT.CFG file descrived later.


The Innn option - Use Interleave of nnn
---------------------------------------

The I option changes the Interleave factor for diskette format. 
Normally the best interleave is 1, thus it takes only 1 revolution to 
read an entire track. But there are 2 exceptions to it. When 
formatting a 21 sector 3½"-HD disk or a 18 sector 5¼"-HD disk. You 
need an interleave of 2 in these cases, because a data sector is used 
as GAP. If you do not use an interleave of at least 2, the disk will 
become unreadable.

But you do not have to take care about this option, FDFORMAT 
automatically determines the best interleave for you (1 or 2). However 
you can set your interleave whatever you like, but the only effect is, 
that your disk becomes slower.

Example: FDFORMAT A: /I:6 (format a very slow disk)


The Gnnn option - Specify GAP length
------------------------------------

The GAP length is the fill space between two sectors on one track. As 
with the Interleave, FDFORMAT determines the best value for you. You 
can reduce the GAP length to speed up your diskette. But this reduces 
your safety, when storing data, unless you choose an interleave of 2. 
And an interleave of drastically slows down your disk performance. If 
you want to reduce your GAP length anyway, do not set it below 32 for 
high density disks and not below 40 for double density disks.

For the safety of your data, it is recommended not to modify the GAP 
length. Sector sliding is a better method to speed up your diskette 
performance and does not affect the safety of your data.


The Bnnn option - Setting the disk type Byte

This option affects to 80286/80386/80486 Computers only and needs to 
be set, if you have an incompatible or older BIOS, which does not 
support 1.44 MByte Drives. It is configurable in the FDFORMAT.CFG file 
described later. This byte is made out of the following components:

```
Group Decimal Hexadecimal  Meaning
-----------------------------------------------------------------
         0         0       Media Type unknown
 1      16        10       Media Type known
-----------------------------------------------------------------

        32        20       double stepping (40 Tracks)
 2       0         0       single stepping (80 Tracks)
-----------------------------------------------------------------
         0         0       Data-Transfer-Rate: 500 kBaud
        64        40       Data-Transfer-Rate: 300 kBaud
 3     128        80       Data-Transfer-Rate: 250 kBaud
-----------------------------------------------------------------
         0         0       360 kB Disk in 360 kB Drive, unchecked
         1         1       360 kB Disk in 1.2 MB Drive, unchecked
         2         2       1.2 MB Disk in 1.2 MB Drive, unchecked
         3         3       360 kB Disk in 360 kB Drive, checked
         4         4       360 kB Disk in 1.2 MB Drive, checked
         5         5       1.2 MB Disk in 1.2 MB Drive, checked
 4       7         7       state not defined (3½"-Drive)
-----------------------------------------------------------------
```

To get the correct value for your format, select one Value out of each 
group and add these values. Normally the media type byte is set 
correctly, following these rules:

```
Group 1: Always set to 16
Group 2: 32, if tracks from 1-43, else 0
Group 3: high density disks: always 0 double density disks: 64 for
         5¼"-Disks, 128 for 3½"-Disks
Group 4: always set to 3
```

Why set group 4 always to 3? There is a problem with DTK-BIOS. DTK-
BIOS seems not to work with any other value than 3. All other BIOS 
Versions I have tested, seem to ignore the Value of Group 4. So it 
will be the best choice to set it always to 3. In some few cases. Your 
System will not work with the default value. In this case, try out any 
value from 0-7 for Group 4. It should work with at least one value. If 
you have determined the correct value, you can write it in the 
FDFORMAT.CFG file.


CONFIGURING FDFORMAT WITH FDFORMAT.CFG
--------------------------------------

Before you start setting up a configuration file, you should try, if 
all formats will work correctly. FDFORMAT normally automatically 
determines the best options for you. If something seems to fail, then 
set up a configuration file.

You must also create a configuration file, if you have one of the
following situations.

1) You have an XT with a high density controller to support 1.2 MByte
    or 1.44 MByte drives.
2) You have an AT and an 1.44 MByte drive, but you cannot install it
   with your setup program (e.g. IBM/Advanced diagnostics).
3) You have an XT (like EPSON QX-16 or AT&T/Olivetti M24/M28), which
   has one or more 720 kByte drives, that also supports 360 kByte
   diskettes.
4) You have a 5¼"-720 kByte drive in an AT.


Format of the configuration file FDFORMAT.CFG
---------------------------------------------

The general format for FDFORMAT.CFG is:

<drive>: [XT|AT] [BIOS] [40=n] [80=n] [F=n] [360=n] [720=n] [1.2=n] 
[1.44=n] [X=n] [Y=n]

Example for a configuration file:

 REM Configure drive B: for 1.44 MByte
 B: AT BIOS F=7 360=$B7 720=$97 1.44=$17 X=2 Y=2

 REM Configure drive A: for 5¼"-720 kByte
 A: AT F=2 BIOS 720=$54 X=0 Y=0
 REM All Numbers preceded by a $-sign are hexadecimal

The options in detail:

XT   : Tell FDFORMAT that your Computer is an XT or compatible and
       does not perform any AT-BIOS functions. This option is only
       needed, if FDFORMAT does not automatically recognizes, that
       your computer is an XT. This option is also needed, if your XT
       supports 720 kByte drives, that can handle 360 kByte diskettes
       too.

AT   : Tell FDFORMAT that your Computer is an 80286/386 or 80486
       Computer or an XT, that supports AT-BIOS functions. This option
       is only needed, if FDFORMAT does not recognize, that you can
       use AT-BIOS functions. A typical case, where you need this
       parameter is, when you have an XT with a high density
       controller installed.

BIOS : This option works only with AT-like-BIOS. It tells FDFORMAT not
       to modify the disk type byte directly, as it is the default,
       but try to change the format information via BIOS-Calls. This
       option should only be used, if FDFORMAT does not work without
       this option. The BIOS option has the typical disadvantage that
       some BIOS-Versions do not support all formats for all drives.
       In this case you must set the disk type byte for the
       unsupported format in your configuration file. This option is
       described later.

40   : This option works only with a few XT-BIOS-Versions for 720
       kByte drives. You can specify an offset to the physical drive
       number, that indicates, that a 40 Track Diskette (360 kByte) is
       inserted, when calling BIOS-Disk I/O. Normally this option is
        set to 0.

80   : This option works with most XT-BIOS-Versions, that support 720
       kByte Drives, who also can handle 360 kByte diskettes. These
       are for example AT&T M24/M28 or EPSON-QX16. The most often used
       offset is 64. Try 64 first, if it does not work try 32, 16, 8,
       4 or 2. Do not try any other values, it will not work.

F    : This option needs to be set only, if your BIOS does not support
       the your type of disk drive. You need this option, if you have
       an 1.44 MB drive installed and your BIOS does not support it.
       If you want to install this option use the following values:
       F=0 for 360 kByte Drive, F=1 for 1.2 MB drive, F=3 for 720 kB
       Drive and F=7 for 1.44 MB drive.

360  : Use this option to use another disk type byte for 360 kB
       diskettes than the default value of $73. If you have set the
       BIOS option, the 360 kByte format will not be set by BIOS, but
       directly using this disk type byte. Refer to the B command line
       option to see how you can determine the correct disk type byte.

720  : same as 360, but for 720 kB format.
1.2  : same as 360, but for 1.2 MB format.
1.44 : same as 360, but for 1.44 MB format.

X    : can be used to override the default of 0 for sector sliding,
       when the head changes.
Y    : can be used to override the default of 0 for sector sliding,
       when the track changes.


Sample Configuration Files
--------------------------


```
A: XT PC80=64               720 kB drive in XT like AT&T M24
A: AT F=7                   1.44 MB drive in AT or XT
A: AT F=1                   1.2 MB drive in AT or XT
A: AT F=2 360=$74 720=$57   720 kB 5¼"-Drive in AT
A: AT F=2 360=$73 720=$53   720 kB 5¼"-Drive in AT & DTK-BIOS
```

THANKS
------

Special thanks to the following people:

Christoph Hochstätter: The original Author

Jochen Roderburg: For suggestions and improvements to support 
compatibility with several BIOS-Versions.

Michael Ho: For an improvement in sector sliding.

Joel Armengaud: For supporting automatic detection of 720 kByte 
diskettes in FDREAD.

Jörg-Stefan Sell: For supporting an interface routine to less 
compatible XT computers.

Michael D. Lawler: For lots of suggestions of improvemnts.

Peter Summers: For an improvement in FDREAD/FDR88


