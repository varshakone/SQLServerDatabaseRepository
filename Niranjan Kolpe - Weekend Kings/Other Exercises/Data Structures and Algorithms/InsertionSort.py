arr = [8, 4, 6, 3, 1, 9, 5]
def InsertionSort(array):
	n = len(array)
	if (n <= 1):
		return
	for i in range(1, n):
		temp = array[i]
		j = i-1
		while (j >= 0 and temp<array[j]):
			array[j+1] = array[j]
			j -= 1
		array[j+1] = temp
	return array
print(arr)
sorted_arr = InsertionSort(arr)
print(sorted_arr)