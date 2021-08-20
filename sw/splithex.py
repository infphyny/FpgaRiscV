#!/usr/bin/python3

#split 32 bits word hex file generated from genhex program into 4 8 bits files

from sys import argv

hexword_file_name = argv[1]
hexbyte_file_name_0 = argv[2]
hexbyte_file_name_1 = argv[3]
hexbyte_file_name_2 = argv[4]
hexbyte_file_name_3 = argv[5]

output_file_0 = open(hexbyte_file_name_0,"w")
output_file_1 = open(hexbyte_file_name_1,"w")
output_file_2 = open(hexbyte_file_name_2,"w")
output_file_3 = open(hexbyte_file_name_3,"w")

with open(hexword_file_name) as input_file :
    lines = list(input_file)



for line in lines :
    bn_3 = format(int(line[0:2],16),"02x")
    output_file_3.write(bn_3 + "\n")
    bn_2 = format(int(line[2:4],16),"02x")
    output_file_2.write(bn_2 + "\n")
    bn_1 = format(int(line[4:6],16),"02x")
    output_file_1.write(bn_1 + "\n")
    bn_0 = format(int(line[6:8],16),"02x")
    output_file_0.write(bn_0 + "\n")



input_file.close()
output_file_0.close()
output_file_1.close()
output_file_2.close()
output_file_3.close()