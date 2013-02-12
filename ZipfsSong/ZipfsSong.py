import sys


class ZipfsSong:
    def __init__(self, input_ary):
        fixed_ary = [elem.strip() for elem in input_ary]
        split_first = fixed_ary.pop(0).split()
        self.num_songs = int(split_first[0], 10)
        self.num_picks = int(split_first[1], 10)
        self.songs = [(int(elem.split()[0], 10), elem.split()[1]) for elem in input_ary[1::]]

    def pick_songs(self):
        self


def main():
    ZipfsSong(sys.stdin.readlines())
if __name__ == "__main__":
    main()
