# XYZback
http://www.xyplorer.com/xyfc/viewtopic.php?f=7&t=15070

This little program is simply a little helper to integrate the excellent Zback by Davor Zorc, a small mirroring and backup program, with the awesome file manager XYplore. XYplorer does not really have a built in directory synchronization or mirroring so just for fun, I wrote a little tool that makes it work with Zback by Davor Zorc. I chose Zback mainly because it's small (main standalone executable is 473 KB as of version 2.85.0.c from December 2016) and portable yet also powerful. Zback supports scripting, command line inputs, lots of options, and filtering by file types, dates, and more. Hopefully it's somewhat useful...

Basically the idea is you have two directory on the left and on the right pane that you want to mirror/sync. You can then run the script which directs the directories and mode of operation to a little helper XYZback (the meat of the functionality). You can then tweak whatever options you want such as inclusion filters or exclusion filters (however syntax used belongs to Zback therefore filters are separated by commas), recurse sub-directories, and you could even swap the Source and Destination if you want. The resulting Zback scripting parameters are previewed in the Zback Parameters text field which is also updated on the fly every time you edit any of the other options or paths.

## How to Use
1. Go to [http://titan.fsb.hr/~dzorc/zback.html](http://titan.fsb.hr/~dzorc/zback.html) and downloaded the portable version of the latest version of Zback and extract all contents tin the `Zback` folder.
	* Optionally, download the manuals for `Zback` [[Zback Manual]](http://titan.fsb.hr/~dzorc/zback_manual.zip) and extract them also into the `Zback` folder.
2. Run `zb_uac.exe` with Admin privileges and select `No` to turn elevation requirements off.
3. Move `XYZback.exe` into the `Zback` folder.
    * `XYZback.exe` is 32bit and is the preferred version but if you prefer 64bit, simply move `XYZback x64.exe` instead of `XYZback.exe` into the `Zback` folder and rename it to `XYZback.exe`.
4. Move the entire `Zback` folder into XYplorer's `Script` folder.
5. Either run `XYZback.xys` in XYplorer or copy the content of the XYplorer script into a button or a catalog item.

### Note About `zb_uac.exe`
`zback.exe` as downloaded from the author's site requires Admin privileges to run at every startup which will not work with `XYZback` and a result, `zb_uac.exe`, a tool provided by the author to me for this specific program, allows you to disable the automatic Admin elevation. If you need to update `zback.exe`, simply downloaded the new `Zback` from the author's site and then follow the directions that are given in `zb_uac.exe.info.txt`.

## XYZback's Future
Don, the developer of XYplorer has expressed interest in adding syncing and mirroring capabilities into XYplorer natively as expressed here [[XYplorer's Roadmap](https://www.xyplorer.com/xyfc/viewtopic.php?t=830)] and therefore this tool in the near future will no longer be required. Therefore `XYZback` will most likely not be updated any further.

## Building XYZback
As of `XYZback` version 1.0 released on March 4, 2017, it is built with the latest Lazarus version 1.6.4 [[Lazaru's Home Page](http://www.lazarus-ide.org/)]. To compile, install both Lazarus's main installer (Lazarus IDE and FreePascal compiler) `lazarus-1.6.4-fpc-3.0.2-win32.exe` as well as the cross compiling support to compile 32bit executables from 64bit Lazarus/FreePascal compiler `lazarus-1.6.4-fpc-3.0.2-cross-i386-win32-win64.exe`. Load up Lazarus and load the `XYZback` project file `XYZback.lpi`. `XYZback` relies on `utf8tools` which is located in its respective directory. To load `utf8tools` to successfully compile `XYZback`, in Lazarus, go to menu item `Package > Open Package File (lpk)`, browse into the `utf8tools` folder and select `utf8tools.lpk`. You should now be able to compile `XYZback` with Lazarus' `Run > Compile`.

## Links
Zback by Davor Zorc's Website
[http://titan.fsb.hr/~dzorc/zback.html](http://titan.fsb.hr/~dzorc/zback.html)

Zback's `zb_uac.exe` Tool by Davor Zorc
[http://titan.fsb.hr/~dzorc/zb_uac.zip](http://titan.fsb.hr/~dzorc/zb_uac.zip)

XYplorer, Portable File Manager For Windows, by Don
[http://www.xyplorer.com/](http://www.xyplorer.com/)
