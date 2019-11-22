Dir.glob("*.aif") do |f|
   `sox "#{f}" tmp.aif reverse silence 1 0.0001 0.08% fade 0.0001 reverse`
   `mv tmp.aif "#{f}"`
end