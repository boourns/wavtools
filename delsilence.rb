# deletes silent WAVs in current directory
#
def loudness(filename)
  result = `sox #{filename} -n stat 2>&1`
  amp = /Maximum amplitude:\s*([\d\.]+)\n/
  return result.scan(amp)[0][0].to_f
end

Dir["./*.wav"].each do |filename|
  if loudness(filename) < 0.01
    puts "deleting #{filename}"
    File.delete(filename)
  end
end


