# XYZback
http://www.xyplorer.com/xyfc/viewtopic.php?f=7&t=15070

This little program is simply a little helper to integrate the excellent Zback by Davor Zorc, a small mirroring and backup program, with the awesome file manager XYplore. XYplorer does not really have a built in directory synchronization or mirroring so just for fun, I wrote a little tool that makes it work with Zback by Davor Zorc. I chose Zback mainly because it's small (main standalone executable is 460 KB) and portable yet also powerful. Zback supports scripting, command line inputs, lots of options, and filtering by file types, dates, and more. Hopefully it's somewhat useful...

Basically the idea is you have two directory on the left and on the right pane that you want to mirror/sync. You can then run the script which directs the directories and mode of operation to a little helper XYZback (the meat of the functionality). You can then tweak whatever options you want such as inclusion filters or exclusion filters (however syntax useed belongs to Zback therefore filters are separated by commas), recurse sub-directories, and you could even swap the Source and Destination if you want. The resulting Zback scripting parameters are previewed in the Zback Parameters text field which is also updated on the fly every time you edit any of the other options or paths.

Zback by Davor Zorc's Website
http://titan.fsb.hr/~dzorc/zback.html

XYplorer, Portable File Manager For Windows, by Don
http://www.xyplorer.com/
