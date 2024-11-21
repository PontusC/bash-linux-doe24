## Format to print is input1\tinput2\tinput3 converts to
# <row>
# <entry>input1</entry>     # because its first string on a new line
# <entry>
# input2                    # only take second tab separate string
# </entry>
# </row>
# Repeat for all lines in input

BEGIN {FS="," ; printf "<exercise6-3>\n"}           # Sets separator to :
{printf "<row>\n"}
{printf "<entry>%s</entry>\n",$1}
{printf "<entry>\n%s\n</entry>\n",$2}
{printf "</row>\n"}
END {printf "</exercise6-3>\n"}