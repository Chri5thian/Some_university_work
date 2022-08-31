import math
print("clk count for on and off keys and knobs:")
for x in range(1, 11):
    print("\t", end="")
    print(math.ceil(((x)/255)*((25*(10**6))/(8000))+6))
print("clk count for key data duty cycle:")
for x in range(13):
    print("\t", end="")
    print(math.ceil(((14+5+x*10)/255)*((25*(10**6))/(8000))))
