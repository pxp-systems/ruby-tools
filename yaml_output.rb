class String
  def titleize
    self.split("_").map{|word| word.capitalize}.join(" ")
   end
end


def yaml_output(tableName, columnName, type, description, example, min, max, x_table_map, x_ui_map, x_permissions)
outFile = File.open "d:\market1.txt", "a+"
backupFile = File.open "backup-yaml.txt", "a+"
# backupFile.puts "====================="
# backupFile.puts Time.new

# object_name
# type (string, integer etc)
# example (some json)
# description (a story)
# minimum
# maximum
# x-table-map (mapping to the oracle database)
# x-ui-map (reference existing ui element)
# x-read-permissions (the user groups required to view the record)
# x-write-permissions (the user groups required to modify the record)


print "Tell me a story about #{columnName}: "
	description = gets.strip
print "Where on the ui? Screen.field: "
	x_ui_map = gets.strip
print "Example: "
	example = gets.strip
print "UC map: "
	x_uc_map = gets.strip 
#print "Who can read?: "
#	x_read_permissions = "[read[" + gets.strip + "],"
#print "Who can create?: "
#	x_permissions = x_permissions + "[create[" + gets.strip + "],"
#print "Who can update?: "
#	x_permissions = x_permissions + "[update[" + gets.strip + "],"
#print "Who can delete?: "
#	x_permissions = x_permissions + "[update[" + gets.strip + "]]"
print "Who can interact?: "
	x_permissions = gets.strip



yaml = "      #{columnName.titleize.delete(" ")}:\n        description: >-\n         #{description} \n        type: #{type} \n        example: #{example} \n        minimum: #{min} \n        maximum: #{max} \n        x-table-map: #{x_table_map} \n        x-ui-map: #{x_ui_map} \n        x-uc-map: #{x_uc_map} \n        x-permissions: #{x_permissions} \n"

timeNow = Time.new
backup = "#{timeNow}\, #{columnName.titleize.delete(" ")}\, #{description}\, #{type}\, #{example} \, #{min}\, #{max}\, #{x_table_map}\,#{x_ui_map}\,#{x_uc_map},#{x_permissions} \n"
puts yaml

outFile.puts(yaml)
backupFile.puts backup

outFile.close
end

