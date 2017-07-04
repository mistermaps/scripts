import sys
done = False
f = open('/home/maps/Scripts/Files/todo', 'r+')
print("Here's what's on your to do list:\n")
for line in f:
	sys.stdout.write(line)
	sys.stdout.flush()
print('\n\nHit enter to enter a new item. Type print to display list. Type done or hit Ctrl-C to exit program.')
while done == False:
	sel = input('\n(enter/print/done)\t')
	if sel == '':
		item = input('New item >>\t')
		sys.stdout.flush()
		f.write(str(item) + '\n')
	if sel == 'done':
		done = True
	if sel == 'print':
		f = open('todo', 'r+')
		for line in f:
			sys.stdout.write(line)
			sys.stdout.flush()
f.close()
