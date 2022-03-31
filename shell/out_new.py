#!/usr/bin/python3

from sys import argv
from subprocess import call
from typing import Tuple, List


def hidebin(args: List[str]) -> Tuple[List[str], List[str]]:
    return (["out_new"] + args[:2], args[2:])


def main(args: List[str]) -> None:
    commands, id_list = hidebin(args)
    for id in id_list:
        call(commands + [id])


if __name__ == "__main__":
    main(argv[1:])
