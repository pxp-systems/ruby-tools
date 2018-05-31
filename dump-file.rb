require 'securerandom'
print "save file?: "

file= File.open "estates.yaml"
out_file_name = gets.strip
out_file = File.open out_file_name, "a+"


class String
def isCamelCase?
  finder = /([A-Z][a-z]+[A-Z][a-zA-Z]+)/
  self.match(finder) ? bool = true : bool = false
end
end

file.each_line do |line|
	data = line.split(":")
	parent_node = ""
	key, value = data[0], data[1]
	if data.size > 2
	out_file.print(line)


	else
		if data.size == 2
	   	  nodeName = key.strip

			if nodeName.isCamelCase? == true
				#print nodeName, "\n"
				#if  nodeName[0] == nodeName[0].upcase
			  #		#print "nodename(",nodeName[0],")", "\n"
					key << ":"
					uuid = SecureRandom.uuid
					pad = key.split(nodeName[0])
					#print key, "\n"

					uuid = pad[0] << "  " << "x-uuid: " << uuid << "\n"
					print_uuid = true

				#else
			     #	key << ":"
				#end
			else
			  #	print key.strip[0]
				key << ":"
			end
		end
	#print "datasize[", data.size, "]", key,  value
	out_file.print(key,  value)

	if print_uuid == true
		out_file.print(uuid)
		print "pn: ", parent_node, "key/val: ", key, value
		print_uuid = false
	end

	end

end
