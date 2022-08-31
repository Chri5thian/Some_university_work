import math
from numpy import interp

f = open("note_frequency_constants.vhd", "w")
f.write("library IEEE;\n")
f.write("use IEEE.std_logic_1164.all;\n")
f.write("use IEEE.numeric_std.all;\n")
f.write("package notes_freq_counts is\n")


keys =["C","Cs","D","Ds","E","F","Fs","G","Gs","A","As","B"]
count=0
for y in range(0,8):
    index=0
    f.write("\n\t--Octave"+str(y+1))
    for x in range(4,16):
        count=int(1/(256*(440*2**((x+12*y-49)/12))*(40*10**(-9))))
        f.write("\n\tconstant "+str(keys[index])+str(y+1)+" : integer := "+str(count)+";\t -- frequency:\t"+str(int(440*2**((x+12*y-49)/12)))+" Hz")
        index+=1
    f.write("\n")


f.write("\nend notes_freq_counts;\n")
f.write("package body notes_freq_counts is\n")
f.write("end notes_freq_counts;\n")
f.close()