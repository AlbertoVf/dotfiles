from os import path
import sys
import re

keys = dict()


def read_file(file):
    home = path.expanduser('~')
    return open(path.join(home, '.config', file), 'r').readlines()


def read_sxhkd_keys():
    content = read_file(path.join('sxhkd', 'sxhkdrc'))
    for i, line in enumerate(content):
        key = line.strip()
        if (i % 2) == 0:
            action = content[i+1].strip()
            keys[key] = action
    return keys


def read_qtile_keys():
    content = read_file(path.join('qtile', 'settings', 'keys.py'))
    for l in content:
        if l.find(r'Key(') != -1:
            l = l.split("Key")[1].split("lazy.", 1)
            key = re.sub(r'[()",]', '', l[0]).strip()
            action = ''.join(l[1:])
            action = re.sub(r"lazy.|[(),]", '', action).strip()
            keys[key] = action
    return keys


def read_kitty_keys():
    content = read_file(path.join('kitty', 'kitty.conf'))
    for l in content:
        if l.find('map ') != -1:
            l = l.split('map ')[1].split(' ', 1)
            key = l[0].strip()
            action = l[1].strip()
            keys[key] = action
    return keys


def transform_keys(keys: dict()):
    for key, action in keys.items():
        key = key.strip().rjust(25)
        action = action.strip()
        print(f'\033[1;31m{key} \033[1;33m: \033[0;32m{action}')


def export_json():
    import json

    keys = {
        "qtile": read_qtile_keys(),
        "kitty": read_kitty_keys(),
        "sxhkd": read_sxhkd_keys()
    }
    with open('keys.json', 'w') as f:
        json.dump(keys, f, indent=2, sort_keys=True)


def info():
    print("""
    Usage:
        -h, --help: show this help
        -q, --qtile: show qtile keys
        -k, --kitty: show kitty keys
        -s, --sxhkd: show sxhkd keys
        -a, --all: show all keys
        -e, --export: export all keys to json file
    """)


if __name__ == '__main__':
    try:
        if sys.argv[1] in ["--export", "-e"]:
            export_json()
        else:
            if sys.argv[1] in ["--qtile", "-q"]:
                keys = read_qtile_keys()
            elif sys.argv[1] in ["--kitty", "-k"]:
                keys = read_kitty_keys()
            elif sys.argv[1] in ["--sxhkd", "-s"]:
                keys = read_sxhkd_keys()
            elif sys.argv[1] in ["--all", "-a"]:
                keys = read_kitty_keys()
                keys.update(read_qtile_keys())
                keys.update(read_sxhkd_keys())
            transform_keys(keys)
    except:
        info()
