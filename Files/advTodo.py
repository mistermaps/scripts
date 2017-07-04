#!/usr/bin/env python
import sys
done = False
#category = ['-- ']
marker = '--'
category = []
cat = 0
catNum = 0
c = False
f = open('/home/maps/Scripts/Files/todoadv', 'r+')
print("Here's what's on your to do list:\n")
for line in f:
	sys.stdout.write(line)
	sys.stdout.flush()
	words = line.lower().split()
	for word in words:
		if word == marker:
			cat = cat + 1
			newcat = line.split(marker,1)[1]
			newcat = newcat.replace(':', '').strip()
			category.append(newcat)
def item():
	item = input('New item >>\t')
	#sys.stdout.flush()
	f.write(str(item) + '\n')
#def catItem(str(category[0])):
#	item = input('New item >>\t')
#	sys.stdout.flush()
#	return item

print('\n\nHit enter to enter a new item. Type print to display list. Type done or hit Ctrl-C to exit program.')
print('available categories:')
for x in range(0, cat):
	print(str(x + 1) + ")\t" + category[x])
while done == False:
	sel = input('\n(enter/category/print/sort/done)\t')
	if sel == '' or sel == 'enter' or sel == 'e':
		item()
		#f.write(str(item) + '\n')
		#item = input('New item >>\t')
		#sys.stdout.flush()
		#f.write(str(item) + '\n')
	if sel == 'done':
		done = True
		#print(cat)
		print(category[0:cat])
	if sel == 'print':
		f = open('todo', 'r+')
		for line in f:
			sys.stdout.write(line)
			sys.stdout.flush()
	if sel == 'category':
		while c == False:
			selectCat = input('Please select a category, or type cancel.')
			if selectCat in category:
				print(category.index(selectCat))
				catNum = category.index(selectCat)
				#item()
				if line.split(marker,1)[0] == selectCat:
					
					f.write(item())
			elif selectCat == 'cancel':
					c = True
			else:
				if selectCat == 'cancel':
					print("cancelled.")
					c = True
				else:
					print('I do not recognize that category')
			choice = input('choose another category? (y/n)\n')
			if choice == 'yes':
				c = False
			if choice == 'no':
				c = True
	if sel == 'sort':
		category = sorted(category)
		print(category)

f.close()
