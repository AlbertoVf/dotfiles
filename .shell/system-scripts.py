from os import path
import sys
import re


def keybinding(key, action):
    key = key.strip().rjust(25)
    action = action.strip()
    return f'\033[1;31m{key} \033[1;33m: \033[0;32m{action}'


def read_file(file):
    home = path.expanduser('~')
    return open(path.join(home, '.config', file), 'r').readlines()


# read the file sxhkdrc
def read_sxhkd_keys():
    content = read_file(path.join('sxhkd', 'sxhkdrc'))
    for i, line in enumerate(content):
        if (i % 2) == 0:
            print(keybinding(line, content[i+1]))


def read_qtile_keys():
    content = read_file(path.join('qtile', 'settings', 'keys.py'))
    for l in content:
        if l.find(r'Key(') != -1:
            l = l.split("Key")[1].split("lazy.", 1)
            key = re.sub(r'[()",]', '', l[0])
            action = ''.join(l[1:])
            action = re.sub(r"lazy.|[(),]", '', action)
            print(keybinding(key, action))


def read_kitty_keys():
    content = read_file(path.join('kitty', 'kitty.conf'))
    for l in content:
        if l.find('map ') != -1:
            l = l.split('map ')[1].split(' ', 1)
            print(keybinding(l[0], l[1]))


def read_all_keys():
    print()
    read_kitty_keys()
    print()
    read_qtile_keys()
    print()
    read_sxhkd_keys()


def info():
    print("""
    Usage:
        -h, --help: show this help
        --qtile: show qtile keys
        --kitty: show kitty keys
        --sxhkd: show sxhkd keys
        --all:   show all keys
    """)


def main():
    args = {
        "--help": info,
        "--qtile": read_qtile_keys,
        "--kitty": read_kitty_keys,
        "--sxhkd": read_sxhkd_keys,
        "--all": read_all_keys,
    }
    try:
        args[sys.argv[1]]()
    except:
        args['--help']()


if __name__ == '__main__':
    main()
