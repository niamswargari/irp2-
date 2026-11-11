import sys

def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1

def main():
    lines = sys.stdin.read().splitlines()
    if len(lines) < 3:
        return
    n = int(lines[0].strip())
    arr = list(map(int, lines[1].strip().split()))
    target = int(lines[2].strip())
    print(binary_search(arr, target))

if __name__ == "__main__":
    main()

#pushing another commit