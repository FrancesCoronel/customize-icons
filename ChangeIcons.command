#!/usr/bin/env ruby

require 'json'
require 'shellwords'

banner = %q[



 _______           _______
(  ____ \|\     /|(  ____ \
| (    \/| )   ( || (    \/
| (__    | |   | || |
|  __)   ( (   ) )| |
| (       \ \_/ / | |
| )        \   /  | (____/\
|/          \_/   (_______/




]

puts banner

puts "All The Icons compiled by FVCproductions - fvcproductions.com"
puts "Uses setfileicon by Damien Bobillot"
puts "This icon setting script generously made by James Moore (@foozmeat) \n \n"


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

  puts %Q(Finished!

  If you want to undo any of these icons

  • "Get Info" on the app
  • Select the icon
  • Press delete
  )

end