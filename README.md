# customize-icons

> customize your icons on El Capitan

## index

- [intro](#intro)
- [tools](#tools)
- [step-1](#step-1)
- [step-2](#step-2)
- [step-3](#step-3)
- [troubleshooting](#troubleshooting)
- [contributing](#contributing)
- [credits](#credits)

## intro

OS X El Capitan introduced a new security policy preventing users from changing any system icon. You can still continue to change your apps and volumes icons normally.

Apps like `LiteIcon` still work pretty well for this sort of thing, but it requires a lot of manual dragging.

If you're like me and enjoy using the terminal to automate work-flows, I think you'll enjoy what's to follow.

## tools

- `Terminal` or an alternative like `iTerm 2`
- this `GitHub` repo located at <code><a href="https://github.com/fvcproductions/customize-icons">github.com/fvcproductions/customize-icons</a></code>

## step 1

### Getting some cool icons.

<a title="DeviantArt" href="http://www.deviantart.com" target="_blank">DeviantArt</a> is my go-to place for icons sets, but you can also try <a title="IconArchive" href="http://www.iconarchive.com/" target="_blank">IconArchive</a> for a broader range of options.

## step 2

<h1>Step 2 - Get The Command</h1>
I include this command file in the <a title="Icons" href="https://github.com/fvcproductions/customize-icons" target="_blank"><code>ZIP</code> file</a> mentioned in <strong>Step 1</strong>, but for reference, here is the code for the <code>ChangeIcons.command</code>.

[code language="plain"]#!/usr/bin/env ruby

require 'json'
require 'shellwords'

if ENV['USER'] != 'root'
  puts "You'll be prompted once to enter you administrator password."
end

Dir.chdir(File.dirname(__FILE__)) do

  file = File.read(%Q(.set_icons/icon_data.json))
  icon_data = JSON.parse(file)

  icon_data.each do |key, value|

    app_path = "/Applications/#{key}"

    if Dir.exists?(app_path) and File.exists?("#{value}.icns")
      puts "Changing icon for #{app_path}"
      `sudo .set_icons/setfileicon "#{value}.icns" "#{app_path}"`
    end

  end

  puts "Restarting Finder and the Dock"
  # `killall Dock`
  # `killall Finder`

  puts %Q(Finished!)

end
[/code]

Now here comes the tricky part. This command relies on a <code>JSON</code> file that is named <code>icon-data.json</code> and a <code>UNIX Executable File</code> called <code>setfileicon</code>.

<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-10-54.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-10-54.png" alt="All The Icons Folder Screenshot - 1" align="middle" /></a><a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-18.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-18.png" alt="All The Icons Screenshot - 2" align="middle" /></a>

These files are both included in a folder called <code>set_icon</code> in the <a title="Icons" href="https://github.com/fvcproductions/customize-icons" target="_blank"><code>ZIP</code> file</a> provided in <strong>Step 1</strong>.

The <code>icon-data.json</code> file looks something like this:

[code language="plain"]{
    "1Password 5.app":"1Password 5",
    "Alfred 2.app":"Alfred 2",
    "Amphetamine.app":"Amphetamine"
}
[/code]

It is formatted with the name of the app first in quotes followed by a semi-colon and then the name of the <code>icns</code> file.

Edit this <code>icon-data.json</code> file to include your own apps or create it yourself using your favorite text-editor.

Here is how the <code>JSON</code> file for the Utilities looks like.

<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-49-06.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-49-06.png" alt="JSON file" align="middle" /></a>

It is <code>case-sensitive</code>, so make sure to type everything correctly to suit what the app is called and what you named the corresponding <code>icns</code> file.
<blockquote>When you are editing this file to add on your own apps, make sure there’s not a comma on the last line or there will be an error.</blockquote>
Now, using <code>Terminal</code>, type in the following: <code>defaults write com.apple.finder AppleShowAllFiles YES</code>. Once you press <code>Enter</code>, this command will show all the hidden files on your Mac. Don’t mess with any of these hidden files. The reason Apple hides them is so that the user has less of a chance of messing things up.
<blockquote>To make the files hidden again later, type in the same command but with a NO at the end like this: <code>defaults write com.apple.finder AppleShowAllFiles NO</code>.</blockquote>
After that, type in <code>killall Finder</code> into Terminal for the command to restart the Finder and have the hidden files be revealed in your Finder.

<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-21-37.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-21-37.png" alt="Show Hidden Files Command in Terminal" align="middle" /></a>

Now that you have your Finder revealing all the hidden files - in the folder where you have all your icons properly named, copy and paste the folder <code>set_icons</code> from the <a title="Icons" href="https://github.com/fvcproductions/customize-icons" target="_blank"><code>ZIP</code> file</a> mentioned in <strong>Step 1</strong>, and rename it to <code>.set_icons</code>. Adding a period in front of the folder name makes it hidden and you will therefore not be able to see it anymore.

It looks exactly like the <code>.set_icons</code> folder already included within the folder called <code>Utilities</code> that can be found in the <a title="Icons" href="https://github.com/fvcproductions/customize-icons" target="_blank"><code>ZIP</code> file</a>.

<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-42.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-42.png" alt="Utility Sub-Folder" align="middle" /></a>

So if you want to change your Utility icons as well, the <code>.set_icons</code> folder located in the sub-folder <code>Utilities</code> already has the <code>json</code> file with all the necessary modifications.
<blockquote>The only difference between the <code>ChangeIcons.command</code> within the <code>All The Icons</code> folder and the <code>ChangeUtilityIcons.command located within the</code>Utilities folder<code>is that on Line 36, the app path is listed as</code>app_path = “/Applications/Utilities/#{key}”`.</blockquote>
<em>A special thanks to <a title="James Moore" href="https://twitter.com/foozmeat" target="_blank">James Moore</a>, who created the <code>ChangeIcons.command</code> to replace all the icons and Damien Bobillot who created the <code>setfileicon</code> UNIX Executable File.</em>
<h1>Step 3 - Execute Command</h1>
<blockquote>otherwise known as <code>TLDR</code></blockquote>
Now you probably have something like the following:
<ul>
    <li>a folder called <code>All The Icons</code> with
<ul>
    <li>all the icons you want to replace your old ones (in <code>icns</code> format)</li>
    <li>the <code>ChangeIcons.command</code> that was included in this <a title="Icons" href="https://github.com/fvcproductions/customize-icons" target="_blank"><code>ZIP</code> file</a></li>
    <li>a <em>hidden</em> sub-folder called <code>.set_icons</code> with
<ul>
    <li>a modified <code>icon-data.json</code> file to include your own personal apps</li>
    <li>the <code>setfileicon</code> UNIX executable file</li>
</ul>
</li>
</ul>
</li>
</ul>
At this point, if you’ve done everything right, you can “hide” your hidden files again in your Finder by executing the command <code>defaults write com.apple.finder AppleShowAllFiles NO</code> in <code>Terminal</code>. Make sure to execute <code>killall Finder</code> as well so that your Finder restarts and shows the changes.

Now go ahead and click the <code>ChangeIcons.command</code> to change all your icons simultaneously.

<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-44.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-44.png" alt="ChangeIcons.command in Terminal" align="middle" /></a>

You will be prompted to enter your password and <em>walla</em> you have all your snazzy new icons in place in seconds!
<blockquote>If you want to change your Utility icons as well, go ahead and click <code>ChangeUtilityIcons.command</code> too within the sub-folder called <code>Utilities</code>, assuming you properly named all the icons so that it works with the <code>json</code> file that is shown in <strong>Step 2</strong>.</blockquote>
<h3><strong>Possible Errors You May Encounter</strong></h3>
<ul>
    <li>You tried to edit the command files and now have a syntax error, like in the form of quotes - just make sure to use <em>straight quotes</em>.</li>
    <li>You have a syntax error in your <code>icon-data.json</code> file, like a comma on the last line.</li>
    <li>You forgot to include a certain app in your <code>icon-data.json</code> file and so the icon does not change when you execute the command.</li>
    <li>An app is locked and, therefore, the icon cannot be changed. To unlock an app, go to the app, right click,  <code>Get Info</code>. Uncheck the <code>Locked</code> button.</li>
</ul>
<a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-54.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-54.png" alt="Locked App Error In Terminal" align="middle" /></a><a href="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-09-37.png"><img class="aligncenter" src="https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-09-37.png" alt="Locked App - Dropbox" align="middle" /></a>
<h3>Have fun with your new icons! 😍</h3>
<blockquote>Tips or tricks?
<blockquote>contact me <a title="FVCproductions" href="http://twitter.com/fvcproductions" target="_blank">@fvcproductions</a></blockquote>
</blockquote>

## contributing

This is the `icon_data.json`. This contains all the necessary information the Unix executable file `setfileicon` will need to change your Mac App icons.

You will never be able to see either of these files because they are hidden in a system folder called `.set_icons`.

To be able to view and edit these files, you will have to run the following 2 commands in `Terminal` to temporarily reveal all hidden folders/files:

```bash
$ defaults write com.apple.finder AppleShowAllFiles YES
$ killall Finder
```

To undo this, enter the following into `Terminal`:

```bash
$ defaults write com.apple.finder AppleShowAllFiles NO
$ killall Finder
```

> On the left we have the name of the Mac App with the `.app` extension.

> On the right we have the actual name of the icon we want to use for that Mac App except without the extension of the image which should always be a `.icns` extension

```json
{
    "1Checker.app": "Calibre",
    "1Password 5.app": "1Password 5",
    "Alchemize.app": "Alchemize",
    "Alfred 2.app": "Alfred 2",
    "Alternote.app": "Alternote",
    "Amphetamine.app": "Amphetamine",
    "AppCleaner.app": "AppCleaner",
    "App Store.app": "App Store",
    "Automator.app": "Automator",
    //"Awareness.app":"Awareness",
    "Bartender.app": "Bartender",
    "BetterSnapTool.app": "BetterSnapTool",
    "Blocs.app": "Blocs",
    "Blogo.app": "Blogo",
    "Blotter.app": "Blotter",
    "Brackets.app": "Brackets",
    "Byword.app": "Byword",
    "Calculator.app": "Calculator",
    "Calendar.app": "Calendar",
    "Candlelight.app": "VOX",
    "Cathode.app": "iTerm",
    //"cDock.app":"cDock",
    "Characters.app": "Characters",
    "Chess.app": "Chess",
    "Chrome App Launcher.app": "Chrome App Launcher",
    "CleanMyMac 3.app": "CleanMyMac",
    "Coda 2.app": "Coda",
    "CodeKit.app": "CodeKit",
    "CodeRunner.app": "CodeRunner",
    "Contacts.app": "Contacts",
    "CrashPlan.app": "CrashPlan",
    "Dash.app": "Dash",
    "Dashboard.app": "Dashboard",
    "Day One.app": "Day One",
    "Deckset.app": "Deckset",
    "Dictionary.app": "Dictionary",
    "Dropbox.app": "DropBox",
    "DVD Player.app": "DVD Player",
    "Easy Image Converter.app": "Easy Image Converter",
    "Evernote.app": "Evernote",
    "FaceTime.app": "FaceTime",
    "Fantastical 2.app": "Fantastical",
    "Flux.app": "Flux",
    "Font Book.app": "FontBook",
    "Game Center.app": "Game Center",
    "GitBook.app": "GitBook",
    "Google Chrome.app": "Google Chrome",
    "Google Drive.app": "Google Drive",
    "Google Photos Backup.app": "GooglePhotosBackup",
    "Healthier.app": "Lep",
    "Image2icon.app": "BambooDock",
    "iBooks.app": "iBooks",
    "iBooks Author.app": "iBooksAuthor",
    "iConvert Icons.app": "iConvert Icons",
    "Image Capture.app": "Image Capture",
    "iMovie.app": "iMovie",
    "iStudiez Pro.app": "iStudiez",
    "iTerm.app": "iTerm",
    // "iTunes.app":"iTunes",
    "iTunes Producer.app": "Celtx",
    "Keynote.app": "Keynote",
    "LaunchPad.app": "LaunchPad",
    "LiteIcon.app": "LiteIcon",
    "MacUpdate Desktop.app": "MacUpdate",
    "Mail.app": "Mail",
    "Maps.app": "Maps",
    "Marked.app": "Marked 2",
    "Marked 2.app": "Marked 2",
    "MenuTab for Trello.app": "Anki2",
    "Messages.app": "Messages",
    "Mint QuickView.app": "Mint",
    "Mission Control.app": "MissionControl",
    "Mobirise.app": "iOS Simulator",
    "Mou.app": "Mou",
    "MySQLWorkbench.app": "MySQLWorkbench",
    "Notes.app": "Notes",
    "Numbers.app": "Numbers",
    "Pages.app": "Pages",
    "Photo Booth.app": "Photo Booth",
    "Preview.app": "Preview",
    "PopcornTime.app": "PopcornTime",
    "puush.app": "Puush",
    "QuickTime Player.app": "QuickTime",
    "Raindrop.app": "Raindrop",
    "Reminders.app": "Reminders",
    "RescueTime.app": "Origin",
    "Safari.app": "Safari",
    "ScreenFlow.app": "ScreenFlow",
    "Screenhero.app": "Screenhero",
    "Shazam.app": "Shazam",
    "Sip.app": "Sip",
    "Sketch.app": "Sketch",
    "Skype.app": "Skype",
    "Slack.app": "Slack",
    "Sorty.app": "Sorty",
    "SoundCloud Downloader.app": "SoundCloud",
    "Stickies.app": "Stickies",
    "Sublime Text.app": "Sublime Text",
    "System Preferences.app": "System Preferences",
    "TextEdit.app": "TextEdit",
    "The Unarchiver.app": "The Unarchiver",
    "Time Machine.app": "Time Machine",
    "Tower.app": "Tower",
    "Ulysses.app": "Ulysses",
    "uTorrent.app": "uTorrent",
    "VLC.app": "VLC",
    "Xcode.app": "Xcode",
    "Xpressive.app": "Xpressive",
    "Yoink.app": "Yoink",
    "YNAB 4.app": "YNAB"
}

```

So if we wanted to add an icon for the **Ember** Mac App, then we would just add the following line right after the line that has **EasyImageConverter** (so that it stays in alphabetical order):

```json
    "Ember.app": "Ember",
```

There would have to be a file called `Ember.icns` in the directory and the user would need the `Ember.app` installed on their Mac's `Applications` directory for this icon change to actually work.

If Ember wasn't installed, then the script would just skip that line.

**To submit a successful pull request**, you have to do the following:

-

## credits

- icons
    - <a title="deWith" href="http://dewith.com/" target="_blank">Sebastian de With</a>
    - <a title="Yoios" href="https://github.com/mmarfil/yoios" target="_blank">Yoios</a>
