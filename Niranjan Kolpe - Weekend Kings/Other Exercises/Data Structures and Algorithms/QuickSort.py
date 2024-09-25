def partition(array, lower, upper):
    pivot = array[upper]
    i = lower - 1
    for j in range(lower, upper):
        if array[j] <= pivot:
            i = i + 1
            (array[i], array[j]) = (array[j], array[i])
    (array[i + 1], array[upper]) = (array[upper], array[i + 1])
    return i + 1

def QuickSort(arr, low, high):
    if low < high:
        pi = partition(arr, low, high)
        QuickSort(arr, low, pi - 1)
        QuickSort(arr, pi + 1, high)

input = [23, 745, 12, 6743, 3, 66, 113, 40386, 323]
print(input)
QuickSort(input, 0, len(input) - 1)
print("Sorted Array: ", input)