
n, m = map(lambda x: int(x), input().split(' '))

flights = [dict() for _ in range(n)]

# 0 for even parity and 1 for odd parity
# considering flights from 0 to n - 1

for i in range(m):
	depart_id, dest_id, parity = map(lambda x: int(x), input().split(' '))

	# checking if unique flight exists and adding if it doesn't

	old_parity = flights[depart_id - 1].get(dest_id)
	if old_parity == None:
		flights[depart_id - 1][dest_id] = parity
	elif old_parity != parity:
		flights[depart_id - 1][dest_id] = -1


def get_shortest(id, flights):
	if flights[id] == {}:
		return None, None
	if n in flights[id]:
		return 1, flights[id][n]
	shortest, parity = None, None
	for destination in flights[id]:
		length, parity = get_shortest(destination - 1, flights)
		if length == None:
			continue
		if shortest == None or length < shortest:
			shortest = length
			parity = flights[id][destination]
	if shortest == None:
		return None, None
	return shortest + 1, parity


airport_parities = []

for id in range(len(flights)):
	_, parity = get_shortest(id, flights)
	if parity == 1:
		airport_parities.append(0)
	else:
		airport_parities.append(1)


available_flights = []

for id in range(len(flights)):
	dest_list = dict()
	for dest in flights[id]:
		if flights[id][dest] == -1 or \
			flights[id][dest] == airport_parities[id]:
			dest_list[dest] = None
	available_flights.append(dest_list)


new_shortest, _ = get_shortest(0, available_flights)
if new_shortest == None:
	new_shortest = -1

print(new_shortest)
print("".join(list(map(lambda x: str(x), airport_parities))))