# Python Program for Bubble Sort
array = [5, 1, 4, 2, 8]
def BubbleSort(arr):
    temp = None
    for i in range (len(arr)):
        for j in range(len(arr)):
            if arr[i]>=arr[j]:
                continue
            else:
                temp = arr[j]
                arr[j] = arr[i]
                arr[i] = temp
    return arr
print(array)
arr = BubbleSort(array)
print("Sorted Array: ", arr)