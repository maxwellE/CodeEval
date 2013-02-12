#! /usr/bin/env python
import sys


class ReverseBinary:
    def __init__(self, input_str):
        self.input_str = input_str

    def perform_reversal(self):
        bin_str = bin(int(self.input_str, 10))[2:]
        return str(int(bin_str[::-1], 2))


def main():
    print ReverseBinary(sys.stdin.readline().strip()).perform_reversal()

if __name__ == "__main__":
    main()
