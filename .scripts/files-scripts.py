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


def visibility(f: str) -> None:
    if f[0] == '.':
        n = join(os.getcwd(), f[1:])
    else:
        n = join(os.getcwd(), f".{f}")
    os.system(f'mv {join(os.getcwd(), f)} {n}')
    subprocess.Popen((['echo', f'{f} >> {n}']))


def execute(f: str):
    command = {
        "deno run": ["js", "ts"],
        "evince": ["pdf"],
        "feh": ["jpg", "png", "jpeg", "bmp", "gif"],
        "firefox": ["html", "htm", "xhtm"],
        "java": ["java"],
        "mpv": ["mp4", "mp3", "m4a", "aac", "flac"],
        "python": ["py"],
        "sh": ["sh", "bash", "zsh"],
    }
    ext = get_extension(f)
    if get_key(ext, command) is None:
        key = 'nvim'
    else:
        key = get_key(ext, command)
    os.system(f'{key} "{f}" || vim "{f}"')


def extract(f: str):
    command = {
        "uncompress": ["z"],
        "unxz": ["xz"],
        "unlzma": ["lzma"],
        "gunzip": ["gz"],
        "cabextract": ["exe"],
        "cpio -id <": ["cpio"],
        "unzip": ["cbz", "epub", "zip"],
        "tar xvf": ["cbt", "tar.bz2", "tar.gz", "tar.xz", "tbz2", "tgz", "txz", "tar"],
        "unrar x -ad": ["cbr", "rar"],
        "unace x": ["cba", "ace"],
        "bunzip2": ["bz2"],
        "z x": ["7z", "arj", "cab", "cb7", "chm", "deb", "dmg", "iso", "lzh", "msi", "pkg", "rpm", "udf", "wim", "xar"],
    }
    ext = get_extension(f)
    if get_key(ext, command) is not None:
        key = get_key(ext, command)
    else:
        return None
    os.system(f'{key} {f}')


def watch(f: str):
    if re.search("[0-9]{2}| [0-9]{4}", f):
        os.system(f"firefox localhost:{f} || brave localhost:{f}")
    os.system(f"firefox {f} || brave {f}") if re.search("http://|https://|localhost://", f) else os.system(
        f'bat ./"{f}" || cat "{f}"')


def info():
    print(""" Scripts para organizar archivos
  -h, --help: Muestra esta ayuda
  -r <file?>, --rename <file?>: Renombra los archivos
  -o, --organize: Organiza los archivos
  -e <file>, --execute <file>: Ejecuta el archivo especificado
  -ex <file>, --extract <file>: Extrae el archivo especificado
  -w <file>|<url>|<port>, --watch <file>|<url>|<port>: Muestra la localizacion
  -v <file>, --visibility <file>: Cambia la visibilidad de los archivos """)


def main():
    if len(sys.argv) == 1 or sys.argv[1] == '-h' or sys.argv[1] == '--help':
        info()
    else:
        if sys.argv[1] == '-r' or sys.argv[1] == '--rename':
            rename_files(f=sys.argv[2], folder=False) if len(sys.argv) == 3 else rename_files(folder=True)
        elif sys.argv[1] == '-o' or sys.argv[1] == '--organize':
            organize_files()
        elif sys.argv[1] == '-e' or sys.argv[1] == '--execute':
            execute(sys.argv[2]) if len(sys.argv) == 3 else print('Error: no file specified')
        elif sys.argv[1] == '-ex' or sys.argv[1] == '--extract':
            extract(sys.argv[2]) if len(sys.argv) == 3 else print('Error: no file specified')
        elif sys.argv[1] == '-w' or sys.argv[1] == '--watch':
            watch(sys.argv[2]) if len(sys.argv) == 3 else print('Error: no file/url specified')
        elif sys.argv[1] == '-v' or sys.argv[1] == '--visibility':
            visibility(sys.argv[2]) if len(sys.argv) == 3 else print('Error: no file specified')
        else:
            print('Error: invalid command')


if __name__ == '__main__':
    main()
