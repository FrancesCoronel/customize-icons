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

OS X El Capitan introduced a new security policy preventing users from changing any system icon.

However, you can still continue to change your apps and volumes icons normally.

Apps like `LiteIcon` still work pretty well for this sort of thing, but it requires a lot of manual dragging.

If you're like me and enjoy using the `Terminal` to automate work-flows, I think you'll enjoy what's to follow.

## tools

- `Terminal` or an alternative like `iTerm 2`
- this `GitHub` repo located at `[github.com/fvcproductions/customize-icons](https://github.com/fvcproductions/customize-icons)`

## step 1

### Getting some cool icons.

[DeviantArt](http://www.deviantart.com) is my go-to place for icons sets, but you can also try [IconArchive](http://www.iconarchive.com/) for a broader range of options.

## step 2

### edit files

I include this command file in the repo under `ChangeIcons.command`

Now here comes the tricky part.

This command relies on a `JSON` file that is named `icon-data.json` and a `UNIX Executable File` called `setfileicon`.

![All The Icons Folder Screenshot - 1](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-10-54.png)

![All The Icons Screenshot - 2](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-18.png)

These files are both included in a folder called `set_icon` in the [`ZIP` file](https://github.com/fvcproductions/customize-icons) provided in **Step 1**. The `icon-data.json` file looks something like this:

```json

{
    "1Password 5.app":"1Password 5",
    "Alfred 2.app":"Alfred 2",
    "Amphetamine.app":"Amphetamine"
}

```

It is formatted with the name of the app first in quotes followed by a semi-colon and then the name of the `icns` file.

Edit this `icon-data.json` file to include your own apps or create it yourself using your favorite text-editor.

Here is how the `JSON` file for the Utilities looks like.

![JSON file](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-49-06.png)

It is `case-sensitive`, so make sure to type everything correctly to suit what the app is called and what you named the corresponding `icns` file.

> When you are editing this file to add on your own apps, make sure there’s not a comma on the last line or there will be an error.

Now, using `Terminal`, type in the following: `defaults write com.apple.finder AppleShowAllFiles YES`.

Once you press `Enter`, this command will show all the hidden files on your Mac.

I would not recommend messing with any of these hidden files.

The reason Apple hides them is so that the user has less of a chance of messing things up.

> To make the files hidden again later, type in the same command but with a NO at the end like this: `defaults write com.apple.finder AppleShowAllFiles NO`.

After that, type in `killall Finder` into Terminal for the command to restart the Finder and have the hidden files be revealed in your Finder.

[![Show Hidden Files Command in Terminal](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-21-37.png)](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-21-37.png)

Now that you have your Finder revealing all the hidden files - in the folder where you have all your icons properly named, copy and paste the folder `set_icons` from the [`ZIP` file](https://github.com/fvcproductions/customize-icons "Icons") mentioned in **Step 1**, and rename it to `.set_icons`.

Adding a period in front of the folder name makes it hidden and you will therefore not be able to see it anymore.

It looks exactly like the `.set_icons` folder already included within the folder called `Utilities` that can be found in the [`ZIP` file](https://github.com/fvcproductions/customize-icons "Icons").

![Utility Sub-Folder](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-28-23-11-42.png)

So if you want to change your Utility icons as well, the `.set_icons` folder located in the sub-folder `Utilities` already has the `json` file with all the necessary modifications.

> The only difference between the `ChangeIcons.command` within the `All The Icons` folder and the `ChangeUtilityIcons.command located within the`Utilities folder`is that on Line 36, the app path is listed as`app_path = “/Applications/Utilities/#{key}”`.

## step 3

### edit command

Now you probably have something like the following:

*   a folder called `All The Icons` with
    *   all the icons you want to replace your old ones (in `icns` format)
    *   the `ChangeIcons.command` that was included in this [`ZIP` file](https://github.com/fvcproductions/customize-icons "Icons")
    *   a _hidden_ sub-folder called `.set_icons` with
        *   a modified `icon-data.json` file to include your own personal apps
        *   the `setfileicon` UNIX executable file

At this point, if you’ve done everything right, you can “hide” your hidden files again in your Finder by executing the command `defaults write com.apple.finder AppleShowAllFiles NO` in `Terminal`.

Make sure to execute `killall Finder` as well so that your Finder restarts and shows the changes.

Now go ahead and click the `ChangeIcons.command` to change all your icons simultaneously.

[![ChangeIcons.command in Terminal](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-44.png)](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-44.png)

You will be prompted to enter your password and **walla** you have all your snazzy new icons in place in seconds!

### troubleshooting

- You tried to edit the command files and now have a syntax error, like in the form of quotes - just make sure to use _straight quotes_.
- You have a syntax error in your `icon-data.json` file, like a comma on the last line.
- You forgot to include a certain app in your `icon-data.json` file and so the icon does not change when you execute the command.
- An app is locked and, therefore, the icon cannot be changed. To unlock an app, go to the app, right click,  `Get Info`. Uncheck the `Locked` button.

![Locked App Error In Terminal](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-01-54.png)

![Locked App - Dropbox](https://fvcproductions.files.wordpress.com/2015/03/screenshot-2015-03-29-00-09-37.png)

## contributing

This is the `icon_data.json`. This contains all the necessary information the Unix executable file `setfileicon` will need to change your Mac App icons. You will never be able to see either of these files because they are hidden in a system folder called `.set_icons`. To be able to view and edit these files, you will have to run the following 2 commands in `Terminal` to temporarily reveal all hidden folders/files:

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
    // and so on
}
```

So if we wanted to add an icon for the **Ember** Mac App, then we would just add the following line right after the line that has **EasyImageConverter** (so that it stays in alphabetical order):

```json
    "Ember.app": "Ember",
```

There would have to be a file called `Ember.icns` in the directory and the user would need the `Ember.app` installed on their Mac's `Applications` directory for this icon change to actually work.

If Ember wasn't installed, then the script would just skip that line.

**To submit a successful pull request**, you have to do the following:

## credits

- <a title="deWith" href="http://dewith.com/" target="_blank">Sebastian de With
- <a title="Yoios" href="https://github.com/mmarfil/yoios" target="_blank">Yoios

A special thanks to [James Moore](https://twitter.com/foozmeat "James Moore"), who created the `ChangeIcons.command` to replace all the icons and Damien Bobillot who created the `setfileicon` UNIX Executable File.