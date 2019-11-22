choices = [
  "C1",
  "C3",
  "C5"
]

Dir.glob("*.aif").each do |file|
	`play "#{file}"`
	puts "Commands: 1, 2, 3, (S)kip, (D)elete"
	cmd = gets.chomp.upcase
	puts "you entered #{cmd}."
	if cmd == '1'
		`mv "#{file}" C1`
	elsif cmd == '2'
		`mv "#{file}" C3`
	elsif cmd == '3'
		`mv "#{file}" C5`
	elsif cmd == 'D'
		`rm "#{file}"`
	end
end