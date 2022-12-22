def func_quick(n):
	if n % 2 == 0:
		return (int(n / 2), int(n / 2))
	
	i = 3
	while i <= n:
		if n % i == 0:
			a = int(n / i)
			b = n - a
			return a, b
		i += 2

n = int(input())

a, b = func_quick(n)
print(a, b)




