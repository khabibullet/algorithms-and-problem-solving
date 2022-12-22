def count(sum, step):
	if sum < 0:
		return 0
	if sum == 0:
		return 1
	child = count(sum - c, 2)
	if step <= 0:
		child += count(sum - a, 0)
	if step <= 1:
		child += count(sum - b, 1)
	return child

a, b, c = tuple(map(lambda x: int(x), input().split(' ')))
x, y, z = tuple(map(lambda x: int(x), input().split(' ')))

sum = x * a + y * b + z * c

print(count(sum, 0))