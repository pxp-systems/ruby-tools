# ===== setup === 
file= File.open "yuss.txt"
recordCount = 0
load "./yaml_output.rb"
# ====== 

print "What are we looking for?: "
search_str= gets.strip
matches = Array.new
yaml_block = Array.new
last_key = ""
pad = 0
last_pad_size = 0
parent_node = ""
last_line = "0:0"
parent_pad_size = 1
last_pad = ""
save_block = false 

file.each_line do |line|
	data = line.split(":")
	
	if data.size > 1
  	  key, value = data[0].strip << ":", data[1].strip
	  pad = data[0].split(key[0])
	  	
  	  recordCount += 1
		
	  if save_block == true && pad[0].size == parent_pad_size
	  	save_block = false
		print "ps: ", pad[0].size, "ppd: ", parent_pad_size, "\n"
     	  end 	
	  if /#{search_str}/.match(value)
#		
		matches << "key: #{key} value: #{value} parent: #{last_key}"
		parent_pad_size = last_pad[0].size
		parent_node << last_line
		yaml_block << last_line
		save_block = true
	  end
	  last_key = key
	  last_line = line
	  last_pad = data[0].split(key[0])  
			  	  
	
	  if save_block == true
		yaml_block << line
	  end  			
			
	end
#print(parent_pad_size, " ", pad[0].size, " key: #{key} value: #{value} parent: #{last_key}", "\n")
end

#puts matches
puts yaml_block