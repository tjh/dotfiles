#!/usr/bin/env ruby

puts ''
puts ' OSX Bootstrap'

puts ''
puts 'Check applications'

# Check for PhantomJS
if `which brew`.empty?
  puts " x You need to install Homebrew:"
  puts '    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  exit
else
  puts " + Homebrew found"
end

# Check for Git
if `which git`.empty?
  puts " x You need to install Git:"
  puts '   $ brew install git'
  exit
else
  puts " + Git found"
end

# Check for MacVim
if `which mvim`.empty?
  puts " x You need to install MacVim:"
  puts '   $ brew install macvim"'
  exit
else
  puts " + MacVim found"
end

# Check for ssh keys
if `cat ~/.ssh/id_rsa.pub`.empty?
  puts %Q[   $ ssh-keygen -t rsa -C "#{ENV['USER']}@#{`hostname`.to_s.strip}"]
  puts ''
  puts '   NOTE: After generating, copy the key into the pastebard and then add to GitHub:'
  puts '   $ cat ~/.ssh/id_rsa.pub | pbcopy'
  exit
else
  puts " + SSH Keys found"
end

# Check for Solarized files for iTerm
if `ls ~/.solarized`.empty?
  puts " x You need to clone solarized for iTerm:"
  puts "   $ git clone https://github.com/altercation/solarized.git ~/.solarized"
  exit
else
  puts " + Solarized found"
end

# Check for dotfiles
if `ls ~/.dotfiles`.empty?
  puts " x You need to clone your dotfiles:"
  puts "   $ git clone git@marcom-github.apple.com:#{ENV['USER']}/dotfiles.git ~/.dotfiles"
  exit
else
  puts " + Dotfiles found"
end

# Check for rbenv
if `which rbenv`.empty?
  puts " x You need to install Rbenv:"
  puts '   $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv'
  puts '   $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build'
  exit
else
  puts " + Rbenv found"
end

# Check for iTerm2
if !File.directory?('/Applications/iTerm.app/')
  puts " x You need to install iTerm2:"
  puts '   http://www.iterm2.com/#/section/downloads'
  exit
else
  puts " + iTerm2 found"
end

# Check for SizeUp
if !File.directory?('/Applications/SizeUp.app/')
  puts " x You need to install SizeUp:"
  puts '   https://www.irradiatedsoftware.com/sizeup/'
  exit
else
  puts " + SizeUp found"
end

puts ''
puts 'Apply OSX settings'
[
  { :name => 'Use list view in finder',
    :cmd  => 'defaults write com.apple.Finder FXPreferredViewStyle Nlsv' },
  { :name => 'Repeat key when held down instead of displaying special characters',
    :cmd  => 'defaults write -g ApplePressAndHoldEnabled -bool false' },
  { :name => 'Super-speed key repeat',
    :cmd  => 'defaults write NSGlobalDomain KeyRepeat -int 0' },
  { :name => 'Safari dev menu on',
    :cmd  => 'defaults write com.apple.Safari IncludeDevelopMenu -bool true' },
  { :name => 'Tap trackpad to click',
    :cmd  => 'defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1' },
  { :name => 'Turn on top-right hot corner for screensaver',
    :cmd  => 'defaults write com.apple.dock wvous-tr-corner -int 5 && defaults write com.apple.dock wvous-bl-modifier -int 0' },
  { :name => 'Allow AirDrop over wired networks',
    :cmd  => 'defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1' }
].each do |osx_setting|
  `#{osx_setting[:cmd]}`
  puts " + OSX: #{osx_setting[:name]}"
end

puts ''
puts 'Done!'
