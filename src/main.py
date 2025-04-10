#!./venv/bin/python
"""This is app"""

import requests


access = {
    'cat': True,
    'dog': False,
    'elephant': False
}


def authorization(user_name: str) -> bool:
    if user_name == 'cat':
        return True
    return False


def request_to_site(url: str, user_name: str) -> requests.Response:
    if not authorization(user_name):
        raise Exception(f'{user_name} have not permissions!')

    headers = {}
    params = {}

    response = requests.get(
        url,
        headers=headers,
        params=params,
        timeout=10,
    )

    return response


if __name__ == '__main__':
    try:
        result = request_to_site('https://catfact.ninja/fact', 'cat')
    except Exception as exc:
        print(exc)
    else:
        print(result.status_code)
        print(result.json()['fact'])
    finally:
        print('Tadaaam!')
