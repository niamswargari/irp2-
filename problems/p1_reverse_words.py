import sys

def main():
    input_data = sys.stdin.read().strip()
    if not input_data:
        return
    words = input_data.split()
    print(" ".join(words[::-1]))

if __name__ == "__main__":
    main()

#trying to commit
