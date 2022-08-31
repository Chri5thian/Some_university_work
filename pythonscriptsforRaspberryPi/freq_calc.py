keys =["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]

for y in range(1,9):
    index=0
    print("-------------------------------------------------------------------------------{} Octave".format(y))    
    for x in range(4,16):
        print(str(keys[index])+str(y),end="\t")
        index+=1
        print("frequency: ",end=" ")#frequency per note 
        print(int(440*2**((x+12*y-49)/12)),end="\t\t")
        
        print("periode time: ",end="")#periode per note 
        print(1/(440*2**((x+12*y-49)/12)),end="\t\t")
        
        print("clk cicles ",end=" ")  #clock cicles the chip has to complete for this frequency note: 40*10**(-9)=1/Fclk=1/(25*10**6)
        print(int(1/((440*2**((x+12*y-49)/12))*(40*10**(-9)))),end="\t\t")
        
        print("clk cicles correct for the 256 states ",end=" ")  #clock cicles the chip has to complete for this frequency  plus compensation for the 255 states within 8 bits for
        print(int(1/(256*(440*2**((x+12*y-49)/12))*(40*10**(-9)))))  

#print(1/(25*10**6))