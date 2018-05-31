


def getYamlBlock
return Proc.new {
		puts "Enter a multi line response ending with a tab"

		response = gets("\t\n").chomp
		response.gsub! /\t/, "\n"
		}
end
