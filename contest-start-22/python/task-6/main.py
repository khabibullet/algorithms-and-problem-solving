my_set = set()

q = int(input())
max_xor = 0

for _ in range(q):
	k = int(input())

	for elem in my_set:
		xor = elem ^ k
		if xor > max_xor:
			max_xor = xor
	my_set.add(k)
	print(max_xor)
