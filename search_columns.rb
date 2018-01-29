# ===== setup === 
file= File.open "Y3T.txt"
recordCount = 0
load "./yaml_output.rb"
# ====== 

print "What are we looking for?: "
search_str= gets.strip
match_tables = Array.new

file.each_line do |line|
	data = line.split("\t")
	tableName, columnName = data[1], data[2]
	
#	puts tableName, " ", columnName
	
#	puts "Table name: #{table} column: #{column}"
	recordCount += 1

	if /#{search_str}/.match(columnName)
#		puts tableName#
		match_tables << "Table name: #{tableName} column: #{columnName}"
	end

end

puts match_tables