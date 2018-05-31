
# =============== setup =============== 
require 'yaml'

print "save file?: "
out_file_name = gets.strip
out_file = File.open out_file_name, "a+"





def next_level(hash, next_key, level, out_file)
	
	# ==== sort the padding ===
	level += 1
	right_pad = "  "
	line_pad = ""
	1.upto(level) do |i|
		line_pad << right_pad
	end
	# ============

	c_hash = hash[next_key]
	c_hash.each do |key, value|
		eval_key(key, value, c_hash, level, line_pad, out_file)
	end
	level -= 1

	@res = []
	@res.push(c_hash, level) 
end

def unpack(hash,  level, out_file)
	
	# ==== sort the padding ===
	level += 1
	right_pad = "  "
	line_pad = ""
	1.upto(level) do |i|
		line_pad << right_pad
	end
	# ============

	c_hash = hash
	c_hash.each do |key, value|
		eval_key(key, value, c_hash, level, line_pad, out_file)
	end
	level -= 1

	@res = []
	@res.push(c_hash, level) 
end

def eval_key(key, value, hash, level, line_pad, out_file)
	out_file.print(line_pad)
	if value.class == Hash
		out_file.print(key, ": ", "\n")
		h = next_level(hash , key, level, out_file)	
		#print h[1]
	
	elsif value.class == Array
		value.each do |i|
			#print i.class, " ", "\n" #, i, "\n"
			if i.class == String
				#print line_pad, i, "\n"
				out_file.print(line_pad, i, "\n")
			elsif i.class == Hash
				i.each do |k,v|
					#unpack(i,  level, out_file)
					print line_pad, k, ": ", v, "\n"
				end
				
			else
				print "Unhandled class: ", i.class
				print i
			end	
		end
	else
		out_file.print(key, ": ", value, "\n")	
	end
	
end

file_name = 'market1.txt'

#yml = YAML::(File.open(file_name))
yml = YAML.load_file(file_name)

current_path = []

yml.each do |key1, value1|
    # do whatever you want with key and value here
	#out_file.print(key1, ": ", "\n")	
	#print key1, " ", value1.size, " class: ", value1.class, "\n"
	level = 0
	line_pad = ""
	eval_key(key1, value1, yml, level, line_pad, out_file)
	
end



# ====== Shut down gracefully  =======
out_file.close