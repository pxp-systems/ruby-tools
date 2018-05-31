require 'YAML'

y = <<YAML_TEXT
first: >
    This is a folded block,
    line breaks are discarded
    for spaces. The line ends
    with a return.
second: |
    This is a literal block,
    and so the line-breaks
    are preserved. Again the
    line ends with a return
third:
    This is a folded block
    too, as YAML defaults
    to that. However, this time
    there is no return at the end.
fourth: And again a folded
         block formated slightly
         differently, with no return
         at the end.
YAML_TEXT

h = YAML.load(y)
puts h

p h[:first]
 # => "This is a folded block, line breaks are discarded for spaces. The line ends with a return.\n"
p h[:second]
 # => "This is a literal block,\nand so the line-breaks\nare preserved. Again the\nline ends with a return\n"
p h[:third]
 # => "This is a folded block too, as YAML defaults to that. However, this time there is no return at the end."
p h[:fourth]
 # => "And again a folded block formated slightly differently, with no return at the end." 
