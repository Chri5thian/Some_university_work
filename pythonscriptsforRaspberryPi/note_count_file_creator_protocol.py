import math
from numpy import interp

f = open("note_counts_constants.vhd", "w")
f.write("library IEEE;\n")
f.write("use IEEE.std_logic_1164.all;\n")
f.write("use IEEE.numeric_std.all;\n")
f.write("package notes_counts is\n")


counts=0
count=0
for x in range(48,73):
    counts=math.ceil((((5+interp(x, [48, 72], [1, 126])))/255)*((25*(10**6))/(8000)))
    f.write("\n\tconstant note_on_"+str(x)+" : integer := "+str(counts)+";\t--"+str(int(interp(x, [48, 72], [1, 126])))+"/255 is duty cycle")
    count+=1

count=0
print("---")
for x in range(48,73):
    counts=math.ceil((((5+interp(x, [48, 72], [129, 254])))/255)*((25*(10**6))/(8000)))
    f.write("\n\tconstant note_off_"+str(x)+" : integer := "+str(counts)+";\t--"+str(int(interp(x, [48, 72], [129, 254])))+"/255 is duty cycle")
    count+=1



f.write("\nend notes_counts;\n")
f.write("package body notes_counts is\n")
f.write("end notes_counts;\n")
f.close()