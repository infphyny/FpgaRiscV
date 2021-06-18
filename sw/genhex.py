#!/usr/bin/env python3



from sys import argv
vhfile = argv[1]
nbytes = int(argv[2])
hexfile = argv[3]

#print(vhfile)
#print(nbytes)
#print(hexfile)

with open(vhfile,"r") as input_file:
#input_file = open(vhfile,"r")
	lines = list(input_file) #.read_lines()


#read_file = open("temp_sensor.vh","r")

#lines = r_file.readlines()

ram = bytearray([0x00]*nbytes)


address = 0
for line in lines:
#	print(line)

	if(len(line) >0):
		if(line[0] == '@'):
	#		print(line[1:])
			address = int((line[1:]),16)
	#		print(address)
		else:
			bytes = line.split()

			for byte in bytes:
			#	print(byte)
				ram[address] = int(byte,16)
				address = address + 1



input_file.close()

#write_file = open("prog.bin","wb")

#write_file.write(ram)
#write_file.close()

hex_file = open(hexfile,"w")

address = 0
for i in range(0,len(ram),4):

	hex_file.write(format( '{0:0{1}X}'.format(ram[i+3],2)))
	hex_file.write(format( '{0:0{1}X}'.format(ram[i+2],2)))
	hex_file.write(format( '{0:0{1}X}'.format(ram[i+1],2)))
	hex_file.write(format( '{0:0{1}X}'.format(ram[i],2)))
	hex_file.write('\n')
	 #  ram[i].format(), 'x'))
#	if (i % 4) == 3:
#		hex_file.write('\n')



hex_file.close()



#write_file = open
