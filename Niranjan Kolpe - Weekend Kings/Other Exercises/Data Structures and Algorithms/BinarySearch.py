def binary_search(arr, target):
    low = 0
    high = len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1
arr = [34, 745, 74, 2, 4 , 21, 44]
value = int(input("Enter a number: "))
result = binary_search(arr, value)
print(f"Element found at index {result}") if result != -1 else print("Element not found in array")