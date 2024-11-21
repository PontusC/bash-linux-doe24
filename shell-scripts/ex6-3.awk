## Format to print is input1\tinput2\tinput3 converts to
# <row>
# <entry>input1</entry>     # because its first string on a new line
# <entry>
# input2                    # only take second tab separate string
# </entry>
# </row>
# Repeat for all lines in input

BEGIN {FS="\t"}           # Sets separator to :
{printf $1, $2}