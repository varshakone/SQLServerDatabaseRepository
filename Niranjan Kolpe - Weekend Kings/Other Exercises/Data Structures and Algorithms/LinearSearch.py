arr = [23, 356, 572, 352, 457 ,34, 65, 2, 6, 4, 634, 243]

def LinearSearch(array):
    value = int(input("Enter a number: "))
    for i in array:
        if i == value:
            return str(f"The number {value} is at index: {arr.index(i)}")
    return str(f"The number {value} is not present in the collection.")

result = LinearSearch(arr)
print(result)