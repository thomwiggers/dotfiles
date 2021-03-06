require 'rake'

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
	  if backup || backup_all
		`mkdir -p $HOME/.dotbackup`
		if File.directory?(target)
		  `mv "#{target}" "$HOME/.dotbackup/"`
		  next
		end
		`mv "$HOME/.#{file}" "$HOME/.dotbackup/#{file}.backup"`
      end		
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end

  puts "Setting up git:"
  puts "Please enter your name (git config --global user.name): "
  STDOUT.flush
  username = gets
  `git config --global user.name "#{username.strip}"`
  puts "Please enter your email address (git config --global user.email):"
  email = gets
  `git config --global user.email "#{email.strip}"`

  `zsh ~/.dotfiles/xresources/gnome-terminal-colors-solarized/install.sh`
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
    if File.exists?("#{ENV["HOME"]}/.dotbackup/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

task :default => 'install'
