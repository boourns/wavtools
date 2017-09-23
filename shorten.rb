# recursively finds files that need to be renamed in order to be accessible from MPC1000
# which has max filename length of 16
#
require 'byebug'
require 'fileutils'

def same(str1, str2)
  out = ""
  i = 0
  while (i < str1.length)
    if str1[i] == str2[i]
      out += str1[i]
    else
      return out
    end
    i += 1
  end
  out
end

def rename(files)
  return if files.empty?
  prefix = files[0]
  files.each do |file|
    newprefix = same(prefix, file)
    if newprefix.length == 0
      puts "Ignore #{file}?"
      answer = gets.chomp
      if answer[0] == 'y' || answer[0] == 'Y'
        newprefix = prefix
      end
    end
    prefix = newprefix
  end

  puts "prefix is #{prefix}"
  puts "please enter replacement prefix"
  replace = gets.chomp

  if replace.empty?
    puts "blank replacement, skipping rename"
    return
  end

  files.each do |file|
    name = file.gsub(prefix, replace)
    puts "new filename is #{name}"
    FileUtils.mv(file, name) if file != name
  end
end

def check(files)
  prefixed = {}
  files.each do |file|
    prefixed[file[0..15]] ||= []
    prefixed[file[0..15]] << file
  end
  prefixed.keys.each do |prefix|
    if prefixed[prefix].count > 1
      rename(prefixed[prefix])
    end
  end
end

def enter(dirname)
  puts "Entering #{dirname}"
  Dir.chdir(dirname) do |dir|
    check(Dir['*.wav'])
    dirs = Dir.glob('*').select { |f| File.directory? f }
    dirs.each do |d|
      enter(d)
    end
    check(dirs)
  end
end

enter(".")
