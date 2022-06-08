import mimetypes
import os
import re
import subprocess
import sys
from os import listdir
from os.path import isfile, join


def list_files(root) -> list:
    return [f for f in listdir(root) if isfile(join(root, f))]


def get_key(e: str, dictionary: dict):
    for (k, v) in dictionary.items():
        if e in v:
            return k
    return None


def get_extension(f: str):
    return f.split('.')[-1]


def normalize(f: str):
    f = re.sub(r"[-|_|+]", ' ', f)
    f = re.sub(r'[^a-zA-Z0-9\s\.]', '', f).replace("..", ".")

    while f.find("  ") != -1:
        f = f.replace("  ", " ")

    return f[0] + f[1:].lower()


def organize_files():
    home = os.path.expanduser('~')
    extensiones = {
        'audio': join(home, 'Musica'),
        'video': join(home, 'Videos'),
        'image': join(home, 'Imagenes'),
        'text': join(home, 'Documentos'),
        'application': join(home, 'Documentos')}

    for f in list_files(os.getcwd()):
        tipo = mimetypes.guess_type(f)[0].split('/')[0]
        proceso = ['mv', f, extensiones[tipo]]
        subprocess.Popen((['echo', f'{f} >> {extensiones[tipo]}']))
        subprocess.Popen(proceso)


def rename_files(f='', folder=True):
    root = os.getcwd()
    ficheros = list_files(root)
    if folder:
        for f in ficheros:
            n = normalize(f)
            if f != n:
                subprocess.Popen((['echo', f'{f} >> {n}']))
                subprocess.Popen(['mv', f'{root}/{f}', f'{root}/{n}'])
    else:
        n = normalize(f)
        subprocess.Popen((['echo', f'{f} >> {n}']))
        subprocess.Popen(['mv', f'{root}/{f}', f'{root}/{n}'])


def info():
    print(""" Scripts para organizar archivos
  -h, --help: Muestra esta ayuda
  -r <file?>, --rename <file?>: Renombra los archivos
  -o, --organize: Organiza los archivos""")


def main():
    try:
        if sys.argv[1] in ["--help", "-h"]:
            info()
        elif sys.argv[1] in ['-o', '--organize']:
            organize_files()
        elif sys.argv[1] in ['-r', '--rename']:
            rename_files(sys.argv[2], True) if len( sys.argv) == 2 else rename_files(sys.argv[2], False)
    except:
        info()


if __name__ == '__main__':
    main()
