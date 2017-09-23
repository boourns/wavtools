# retunes AdventureKid single-cycle WAVES from D2.2 to C
#

Dir["./*/AKWF_*.wav"].each do |filename|
  dir = File.dirname(filename)
  base = File.basename(filename)
  `sox #{filename} #{dir}/C#{base} speed -202c`
end


