input()
words = input().split(' ')
colors = input()

count = 0
first_color_id = 0

for word in words:
	for id in range(first_color_id, first_color_id + len(word) - 2):
		if (colors[id] == colors[id + 1]):
			count += 1
			break
	first_color_id += len(word)

print(count)
