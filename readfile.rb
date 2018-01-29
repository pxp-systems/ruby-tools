
# ===== setup === 
file= File.open "Y3T.txt"
recordCount = 0
load "./yaml_output.rb"
# ====== 

print "Create json for which table?: "
table_search = gets.strip
match_tables = Array.new

file.each_line do |line|
	data = line.split("\t")
	tableName, columnName = data[1], data[2]
	
#	puts tableName, " ", columnName
	
#	puts "Table name: #{table} column: #{column}"
	recordCount += 1

	if /#{table_search}/.match(tableName)
#		puts tableName#
		match_tables << tableName
	end

end

u_tables = match_tables.uniq	
k = u_tables.size
specific_match = false

if k == 0
	puts "No matching tables found. try CAPS. \n \n"	
	
elsif k > 1
	
	u_tables.each_with_index do |value, index|
          puts "#{index}: #{value}" 
	end

	print "Which one of these? (type number): "
	chooser = gets.strip.to_i
	puts u_tables[chooser]
	specific_match = true
	specific_table = u_tables[chooser]

elsif k == 1

	specific_match = true
	specific_table = u_tables[0]
end

if specific_match == true
	file.close
	file= File.open "Y3T.txt"
	file.each_line do |line|
	  data = line.split("\t")
	  tableName, 
	  columnName, 
	  type, 
	  example, 
	  description, 
	  min,	
	  max, 
	  x_table_map, 
	  x_ui_map,
	  x_permissions = data[1], 
		 	data[2],
		 	data[3].sub("DATE", "string").sub("VARCHAR2","string").sub("CHAR", "string").sub("NUMBER","number").sub("BLOB", "object").sub("CLOB", "object"),
			"DESC",
			"EXAMPLE",
			data[5].sub("Y", "1").sub("N","0"),
			data[4],
			data[1]+ "." + data[2],
			"UI"
	  if tableName == specific_table
#	    puts "Table name: #{tableName} column: #{columnName}"
	    yaml_output(tableName, 
			columnName, 
			type, 
			example, 
			description, 
			min,
			max, 
			x_table_map, 
			x_ui_map)
			
	  end
 	end
end 



puts "#{recordCount} columns scanned"
