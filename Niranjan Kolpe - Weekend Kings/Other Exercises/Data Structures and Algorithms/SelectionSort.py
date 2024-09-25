def selection_sort(arr):
    for i in range(len(arr)):
        min_index = i
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[min_index]:
                min_index = j
        arr[i], arr[min_index] = arr[min_index], arr[i]

arr = [234, 46, 32, 74, 53, 32, 4, 54645, 232, 6, 356, 2]
print(arr)

selection_sort(arr)
print("Sorted Array: ", arr)
