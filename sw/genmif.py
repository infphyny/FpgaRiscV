#!/usr/bin/env python3
from sys import argv
hexfile_name = argv[1]
nbytes  = argv[2]
wordlen = int(argv[3])
miffile_name = argv[4]


with open(hexfile_name,"r") as input_file:
    lines = list(input_file)



input_file.close()


depth = int(int(nbytes)/int(wordlen))

mif_file = open(miffile_name,"w")

mif_file.write("WIDTH="+str(wordlen*8)+";\n")
mif_file.write("DEPTH="+str(depth)+";\n\n")
mif_file.write("ADDRESS_RADIX=UNS;\n")
mif_file.write("DATA_RADIX=BIN;\n\n")
mif_file.write("CONTENT BEGIN\n")

for i in range(0,depth):
    #mif_file.write("\t"+str(i)+" : " + str(bin(int(lines[i],16))) + "\n")
    bs = ((int(lines[depth-1-i],16)))
    mif_file.write("\t"+str(depth-1-i)+" : " + format('{0:0{1}b}'.format((bs),32)) + ";\n")
    #mif_file.write("\t"+str(i)+" : " + format( '{0:0{0}b}'.format(int(lines[i],16))) + "\n")




mif_file.write("END")

mif_file.close()
