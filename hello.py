#!/usr/bin/env python3

import sys
import argparse

ver=sys.version[0:3]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-v','--version',default=ver)
    parser.add_argument('-n','--name',default='Stranger')

    args = parser.parse_args()
    if args.version:
        v = version(args.version)
        print(v)
    else:
        print(f'latest version is: {ver}')

    if args.name:
        n = echo(args.name)
        print(n)


def echo(name):
    return f'Hello {name}'

def version(v):
    return f'latest version is: {v}'



if __name__ == '__main__':

    main()
