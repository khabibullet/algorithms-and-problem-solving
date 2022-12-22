import math as m

def hord(n, k):
	return m.sin(m.pi * k / n) / b

def ger(a, b, c):
	p = (a + b + c) / 2
	return m.sqrt(p * (p - a) * (p - b) * (p - c))

def upper_bound(n):
	return int(n / 2) + 1

def lower_bound(n):
	if n % 3 == 0:
		return int(n / 3)
	else:
		return int(n / 3) + 1

def get_total_area(min, mid, max, sub_max):
	area = ger(h[min], h[mid], h[max])
	area += get_sub_area(min)
	area += get_sub_area(mid)
	if sub_max == True:
		area += get_sub_area(max)
	return area

def get_sub_area(edge):
	if edge - 2 < 2:
		return 0
	max = edge - 2
	min = int(max / 2)
	mid = max - min
	return get_total_area(min, mid, max, False)


n = int(input())

b = m.sin(m.pi / n)

h = list(map(lambda x: hord(n, x), list(range(n))))

low = lower_bound(n)
up = upper_bound(n)

max_area = 0

for max_edge in range(low, up + 1):
	min_edge = int((n - max_edge) / 2)
	mid_edge = n - max_edge - min_edge
	total_area = get_total_area(min_edge, mid_edge, max_edge, sub_max = True)
	if total_area > max_area:
		max_area = total_area

print(round(max_area, 6))
