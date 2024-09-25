def MergeSort(array):
    if len(array)>1:
        mid = len(array)//2
        left_arr = array[:mid]
        right_arr = array[mid:]

        MergeSort(left_arr)
        MergeSort(right_arr)

        i=j=k=0       
        while i < len(left_arr) and j < len(right_arr):
            if left_arr[i] < right_arr[j]:
                array[k]=left_arr[i]
                i=i+1
            else:
                array[k]=right_arr[j]
                j=j+1
            k=k+1

        while i < len(left_arr):
            array[k]=left_arr[i]
            i=i+1
            k=k+1

        while j < len(right_arr):
            array[k]=right_arr[j]
            j=j+1
            k=k+1

input = [14, 46, 43, 27, 57, 41, 45, 21, 70]
print(input)
MergeSort(input)
print("Sorted Array:", input)