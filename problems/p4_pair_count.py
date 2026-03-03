import sys

def count_pairs(arr, k):
    seen = set(arr)
    return sum(1 for x in arr if (x + k) in seen)

def main():
    lines = sys.stdin.read().splitlines()
    if len(lines) < 2:
        return
    n, k = map(int, lines[0].split())
    arr = list(map(int, lines[1].split()))
    print(count_pairs(arr, k))

if __name__ == "__main__":
    main()
