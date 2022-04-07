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
    args = {"-h": info, "--help": info, "-r": rename_files, "--rename": rename_files, "-o": organize_files, "--organize": organize_files, "-e": execute,
            "--execute": execute, "-ex": extract, "--extract": extract, "-w": watch, "--watch": watch, "-v": visibility, "--visibility": visibility}
    try:
        if len(sys.argv) == 1:
            args['--help']()
        elif len(sys.argv) == 2:
            args[sys.argv[1]]()
        elif len(sys.argv) == 3:
            args[sys.argv[1]](sys.argv[2])
    except:
        args['--help']()


if __name__ == '__main__':
    main()
