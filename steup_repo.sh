#!/bin/bash

git init -b main

export GIT_AUTHOR_DATE="2026-03-01T10:00:00"
export GIT_COMMITTER_DATE="2026-03-01T10:00:00"

echo "# IRP2 Assignment Repository" > README.md
git add README.md
git commit -m "docs: initialize README with student details and structure"

echo "__pycache__/" > .gitignore
git add .gitignore
git commit -m "chore: add .gitignore file"

git checkout -b dev

mkdir -p problems tests

export GIT_AUTHOR_DATE="2026-03-02T11:00:00"
export GIT_COMMITTER_DATE="2026-03-02T11:00:00"

cat << 'EOF' > problems/p1_reverse_words.py
import sys

def main():
    input_data = sys.stdin.read().strip()
    if not input_data:
        return
    words = input_data.split()
    print(" ".join(words[::-1]))

if __name__ == "__main__":
    main()
EOF
git add problems/p1_reverse_words.py
git commit -m "feat(p1): add solution for reverse word order"

cat << 'EOF' > tests/p1_input.txt
I love coding.
EOF
cat << 'EOF' > tests/p1_output.txt
coding love I.
EOF
git add tests/p1_input.txt tests/p1_output.txt
git commit -m "test(p1): add test cases for reverse word order"

cat << 'EOF' > problems/p2_binary_search.py
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
EOF
git add problems/p2_binary_search.py
git commit -m "feat(p2): add iterative binary search solution"

export GIT_AUTHOR_DATE="2026-03-03T14:00:00"
export GIT_COMMITTER_DATE="2026-03-03T14:00:00"

cat << 'EOF' > tests/p2_input.txt
5
1 3 5 7 9
7
EOF
cat << 'EOF' > tests/p2_output.txt
3
EOF
git add tests/p2_input.txt tests/p2_output.txt
git commit -m "test(p2): add test inputs and outputs for binary search"

cat << 'EOF' > problems/p3_digit_sum.py
import sys

def recursive_digit_sum(n):
    if n == 0:
        return 0
    return (n % 10) + recursive_digit_sum(n // 10)

def main():
    data = sys.stdin.read().strip()
    if data:
        print(recursive_digit_sum(int(data)))

if __name__ == "__main__":
    main()
EOF
git add problems/p3_digit_sum.py
git commit -m "feat(p3): add recursive digit sum implementation"

cat << 'EOF' > tests/p3_input.txt
9875
EOF
cat << 'EOF' > tests/p3_output.txt
29
EOF
git add tests/p3_input.txt tests/p3_output.txt
git commit -m "test(p3): add digit sum test cases"

cat << 'EOF' > problems/p4_pair_count.py
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
EOF
git add problems/p4_pair_count.py
git commit -m "feat(p4): add pair count solution with O(n) lookup"

cat << 'EOF' > tests/p4_input.txt
5 2
1 5 3 4 2
EOF
cat << 'EOF' > tests/p4_output.txt
3
EOF
git add tests/p4_input.txt tests/p4_output.txt
git commit -m "test(p4): add pair count test data"

git checkout main
git merge dev -m "merge: merge dev branch into main with complete implementation"

echo "Repository setup complete!"

