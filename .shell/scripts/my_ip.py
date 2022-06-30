import sys
import socket
import uuid
import re
import requests
import json


def get_hostname():
    import socket
    host_name = socket.gethostname()
    return host_name


def get_mac_address():
    return(':'.join(re.findall('..', '%012x' % uuid.getnode())))


def get_public_ip():
    from requests import get
    ip = get('https://api.ipify.org').text
    return ip


def get_private_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP


def get_connection_info(ip):
    url = f"https://ipinfo.io/widget/demo/{ip}"
    file = 'ip_info.json'
    payload = {}
    headers = {
        'Accept': '*/*',
        'Accept-Language': 'es-ES,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br',
        'Referer': 'https://ipinfo.io/',
        'Content-Type': 'application/json',
        'DNT': '1',
        'Alt-Used': 'ipinfo.io',
        'Connection': 'keep-alive',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'Sec-GPC': '1',
        'TE': 'trailers'
    }
    response = requests.request("GET", url, headers=headers, data=payload)
    return json.dumps(response.json(), indent=2)


def speed_test():
    import speedtest
    s = speedtest.Speedtest()
    s.get_best_server()
    s.download()
    s.upload()
    res = s.results.dict()

    r = {
        "ping": '{:3.2f} s'.format(res['ping']),
        "upload": '{:5.2f} Mb/s'.format(res['upload'] / (1024*1024)),
        "download": '{:5.2f} Mb/s'.format(res['download'] / (1024*1024))
    }
    return json.dumps(r, indent=2)


def get_ip_info():
    ip = {
        "Hostname": get_hostname(),
        "MAC address": get_mac_address(),
        "Public IP": get_public_ip(),
        "Private IP": get_private_ip(),
    }
    return json.dumps(ip, indent=2)


def info():
    print("""
    Usage:
        -h, --help: show this help
        -s, --speed: run speed test
        -i, --ip: show ip info
        -c, --con: show connection info
    """)


if __name__ == '__main__':
    if sys.argv[1] in ["--speed", "-s"]:
        print(speed_test())
    elif sys.argv[1] in ["--ip", "-i"]:
        print(get_ip_info())
    elif sys.argv[1] in ["--con", "-c"]:
        print(get_connection_info(get_public_ip()))
    else:
        info()
