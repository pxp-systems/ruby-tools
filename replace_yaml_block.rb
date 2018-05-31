# ===== setup ===
print "Source file: "
file_n = gets.strip
file = File.open file_n
print "Output file name: "
out_file_n = gets.strip
out_file = File.open out_file_n, "a+"
recordCount = 0
load "./yaml_output.rb"
load "./multi.rb"
# ======

print "Replace which uuid block?: "
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
overwrite_block = false

newYaml = getYamlBlock.call()



file.each_line do |line|

	data = line.split(":")

	# are we dealing with a data element?
	if data.size == 2
  	  key, value = data[0].strip << ":", data[1].strip
		  pad = data[0].split(key[0])

	  	recordCount += 1
			# are we still outputting the new block?
		  if overwrite_block == true && pad[0].size == parent_pad_size
		  	overwrite_block = false
			#print "ps: ", pad[0].size, "ppd: ", parent_pad_size, "\n"
	    end

			# let's find the value / block to overwrite
			if /#{search_str}/.match(value)
				# this var is a failsafe = we can check it to see if we got
				# more than 1 hit which could potentially be an issue
				matches << "key: #{key} value: #{value} parent: #{last_key}"

				parent_pad_size = last_pad[0].size
				parent_node << last_line
				overwrite_block = true
				# so we found the block to replace, let's replace it
				newYaml.each_line do |yaml_block_line|
				 out_file << pad[0] << yaml_block_line
  			end
			# key-value evaluation ends
	    end

			last_key = key
		  last_line = line
		  last_pad = data[0].split(key[0])

			# dealing with a key value, but not one that we intend to replace
		  if overwrite_block == false
				out_file << line
		  end

	else
		# not dealing with key value, so just output the line
		if overwrite_block == false
			out_file << line
		else
			print line
		end

	end
#print(parent_pad_size, " ", pad[0].size, " key: #{key} value: #{value} parent: #{last_key}", "\n")
end

out_file.close()
