import mimetypes
import os
import re
import subprocess
import sys
from os import listdir
from os.path import isfile, join

rootPath = os.path.expanduser("~")


def list_files(root) -> list:
    return [f for f in listdir(root) if isfile(join(root, f))]


def normalize(f: str) -> str:
    f = re.sub(r"[-|_|+]", ' ', f)
    f = re.sub(r'[^a-zA-Z0-9\s\.]', '', f).replace("..", ".")

    while f.find("  ") != -1:
        f = f.replace("  ", " ")

    return f[0] + f[1:].lower()


def organize_files():
    downloads = {
        'path': os.path.join(rootPath, "Descargas/")
    }
    music = {
        'path': os.path.join(rootPath, "Música/"),
        'extensions': ['.mp3', '.wav', '.flac', '.m4a']
    }
    video = {
        'path': os.path.join(rootPath, "Vídeos/"),
        'extensions': ['.mp4', '.mkv', '.avi', '.flv', '.wmv', '.mov', '.mpg', '.mpeg']
    }
    documents = {
        'path': os.path.join(rootPath, "Documentos/"),
        'extensions': ['.zip', '.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx']
    }
    images = {
        'path': os.path.join(rootPath, "Imágenes/"),
        'extensions': ['.png', '.jpg', '.jpeg', '.gif', '.bmp']
    }

    for filename in list_files(downloads['path']):
        name, extension = os.path.splitext(downloads['path'] + filename)
        src = downloads['path'] + filename

        if extension in images['extensions']:
            dst = images['path'] + filename
        elif extension in music['extensions']:
            dst = music['path'] + filename
        elif extension in documents['extensions']:
            dst = documents['path'] + filename
        elif extension in video['extensions']:
            dst = video['path'] + filename
        else:
            print('Not moved: ' + filename)
            continue
        os.rename(src, dst)
        print(f'Moved: {src} >> {dst}')


def rename_files(f='', folder=True):
    root = os.getcwd()
    ficheros = list_files(root)
    if folder:
        for f in ficheros:
            n = normalize(f)
            if f != n:
                os.rename(f'{root}/{f}', f'{root}/{n}')
    else:
        n = normalize(f)
        os.rename(f'{root}/{f}', f'{root}/{n}')
    print(f'Renamed: {f} >> {n}')


def info():
    print(""" Scripts para organizar archivos
  -h, --help: Muestra esta ayuda
  -r <file?>, --rename <file?>: Renombra los archivos
  -o, --organize: Organiza los archivos""")


if __name__ == '__main__':
    if sys.argv[1] in ['-o', '--organize']:
        organize_files()
    elif sys.argv[1] in ['-r', '--rename']:
        rename_files(sys.argv[2], True) if len(
            sys.argv) == 2 else rename_files(sys.argv[2], False)
    else:
        info()
