import math as math
f_read = open("C:/Users/Atharva/OneDrive/Desktop/NNSoP/VERILOG_1/Initialize.txt", "r") #These paths need to be changed for proper functioning
f_write = open("C:/Users/Atharva/OneDrive/Desktop/NNSoP/VERILOG_1/RTinitialize.h", "w")

# NETWORK PARAMETERS
x_dim = 4
y_dim = 4
address_size = int(math.log(x_dim,2) + math.log(y_dim,2))

x_dest=""
y_dest=""
for x_iter in range(int(math.log(x_dim,2))):
    x_dest=x_dest+"1"
for y_iter in range(int(math.log(y_dim,2))):
    y_dest=y_dest+"1"
dest = x_dest+y_dest
for line in f_read:
    x = line.split(" ")
    src_address = hex(int(x[0]))
    src_address_str = str(src_address)
    src_address_extend = src_address_str[2:] # To remove the 0x part that is attached by the 'hex' function
    f_write.write("@" + src_address_extend + "\n")
    RTfile = open("C:/Users/Atharva/OneDrive/Desktop/NNSoP/VERILOG_1/RT_Files/rt"+x[0]+".h", "w")
    RTfile.write("@" + src_address_extend + "\n")
    
    for iterator2 in range(x_dim*y_dim-len(x)+1):
        #s_address_str = str(format(int(x[0]), 'b'))
        #s_address_str_extend = s_address_str.zfill(address_size)
        f_write.write(dest)
        RTfile.write(dest)
        
    for iterator in range(len(x)-1, 0, -1):
        x_bin = str(format(int(x[iterator]), 'b'))
        x_bin_extend = x_bin.zfill(address_size)
        f_write.write(x_bin_extend)
        RTfile.write(x_bin_extend)
    f_write.write("\n")
    RTfile.write("\n")
    RTfile.close()
f_write.close()