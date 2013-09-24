# require 'rake'
task :default => [:compact_configs]

desc 'pack up all of the configs and put them into the ~/home_configs dir'
task :compact_configs do
  user_home    = ENV['HOME']
  home_configs = 'home_configs'
  dest         = File.join(user_home,home_configs)

  file_patterns = ['.bashrc',
                   '.bash_profile',
                   '.bash_env',
                   '.bash_aliases',
                   '.bash_screen',
                   '.screenrc',
                   '.irbrc',
                   '.toprc',
                   ]

  files = file_patterns.map {|pattern| Dir.glob(File.join(user_home,pattern)) }.flatten 

  files.each do |file|
    FileUtils.cp_r file, dest, :verbose => true 

    file_basename = File.basename(file)
    new_filename  = file_basename.gsub(/^\./,'dot.')
    current_name  = File.join(dest,file_basename)
    new_dest      = File.join(dest,new_filename)
    # p [current_name, new_dest].join(' ')
    FileUtils.rm_r new_dest, :verbose => true if File.exists?(new_dest) && new_filename.match('dot.')
    FileUtils.mv current_name, new_dest, :verbose => true, :force => true
  end
end

desc 'unpack all of the configs into $HOME'
task :extract_configs do
  raise "Use :link_configs instead" 
  user_home    = ENV['HOME']
  home_configs = 'home_configs'
  src         = File.join(user_home,home_configs)

  file_patterns = ['dot.bash*',
    'dot.screenrc',
    'dot.irbrc',
    'dot.toprc',
    ]

  files = file_patterns.map {|pattern| Dir.glob(File.join(src,pattern)) }.flatten 

  files.each do |file|
    file_basename = File.basename(file)
    new_filename  = file_basename.gsub(/dot/,'')
    new_dest      = File.join(user_home,new_filename)
    FileUtils.cp_r file, new_dest, :verbose => true
  end

end

desc 'link all of the configs into $HOME'
task :link_configs, :force do |t,args|
  user_home    = ENV['HOME']
  home_configs = 'home_configs'
  src          = File.join(user_home,home_configs)
  force        = args[:force] || false

  file_patterns = ['dot.bash*',
    'dot.screenrc',
    'dot.irbrc',
    'dot.toprc',
    ]

  files = file_patterns.map {|pattern| Dir.glob(File.join(src,pattern)) }.flatten 

  files.each do |file|
    file_basename = File.basename(file)
    new_filename  = file_basename.gsub(/dot/,'')
    new_dest      = File.join(user_home,new_filename)
    FileUtils.ln_s file, new_dest, :force => force, :verbose => true
  end

end
