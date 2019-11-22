prefix = "BIA-C4-Metal-"
count = 0
suffix = "aif"

Dir.glob("*.aif").each do |file|
	begin
		count = count + 1
		name = "#{prefix}#{count}.#{suffix}"
	end while File.exists?(name)

	puts "moving #{file} to #{name}"
	File.rename(file, name)
end