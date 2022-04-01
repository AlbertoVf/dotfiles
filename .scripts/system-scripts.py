from os import path
import sys


# read the file sxhkdrc
def read_keys():
    home = path.expanduser('~')
    f = open(path.join(home, '.config', 'sxhkd', 'sxhkdrc'), 'r')
    content = f.readlines()
    f.close()
    for i, line in enumerate(content):
        if (i % 2) == 0:
            key = line.strip()
            key = key.rjust(25)
            action = content[i + 1].strip()
            print(f'\033[1;31m{key} \033[1;33m: \033[0;32m{action}')


def main():
    if len(sys.argv) == 1 or sys.argv[1] == '-h' or sys.argv[1] == '--help':
        read_keys()
    else:
        if sys.argv[1] == '-k' or sys.argv[1] == '--keys':
            read_keys()


if __name__ == '__main__':
    main()
