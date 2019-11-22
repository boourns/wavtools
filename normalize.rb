
Dir.glob("*.aif").each do |f|
  `sox #{f} tmp.aif norm`
  `mv tmp.aif #{f}`
end