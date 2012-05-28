require 'rake'

desc 'Install Janus'
task :janus do
  system %Q{curl -Lo- https://bit.ly/janus-bootstrap | bash}
  system %Q{ln -s "#{ENV['HOME']}/.dotfiles/janus" "#{ENV['HOME']}/.janus"}
end

# From https://github.com/franciscoj/dot-files/blob/b06c589f0340e8cda98c96ac79a50c03c1ed46b2/Rakefile
desc 'Install Oh-My-Zsh'
task :ohmyzsh do
  system %Q{rm -rf "$HOME/.oh-my-zsh"}
  system %Q{/usr/bin/env git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh}
  system %Q{chsh -s /bin/zsh}
  system %Q{ln -s "#{ENV['HOME']}/.dotfiles/zsh/tharvey.zsh-theme" "#{ENV['HOME']}/.oh-my-zsh/themes/tharvey.zsh-theme"}
end

# Symlinks from Holman's dotfiles
# https://github.com/holman/dotfiles/blob/88d869cf8b498e82108a7f63393b71ed1882a599/Rakefile
desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end
    
    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

task :default => 'install'
