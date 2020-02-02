#!/usr/bin/env python3

from packaging import version
import re
import os
import shutil
import subprocess
import tempfile
from urllib.request import urlopen
from urllib.parse import urlencode
import xml.etree.ElementTree as ET

VERSION_RE = re.compile(r'^.+(\d+\.\d+\.\d+)\.nupkg$')

base_url = 'https://pvsc.blob.core.windows.net/python-language-server-stable'
params = {
    'restype': 'container',
    'comp': 'list',
    'prefix': 'Python-Language-Server-linux-x64',
}
url = f'{base_url}?{urlencode(params)}'

with urlopen(url) as rs:
    body = rs.read()
    root = ET.fromstring(body)
    blob_urls = sorted([
        n.text for n in root.findall('./Blobs/Blob/Url') if n.text])

    versions = []
    for blob_url in blob_urls:
        match = VERSION_RE.match(blob_url)
        if match:
            v = version.parse(match.groups()[0])
            versions.append((v, blob_url))
    latest_url = sorted(versions, reverse=True)[0][1]

latest_fname = latest_url.rsplit('/', 1)[1]
fname = os.path.join(tempfile.gettempdir(), latest_fname)
if not os.path.exists(fname):
    print('Downloading', latest_url)
    subprocess.check_call(
        ['curl', '-O', latest_url], cwd=tempfile.gettempdir())

destdir = os.path.join(tempfile.gettempdir(), 'mspyls')
if os.path.exists(destdir):
    print('Clearing', destdir)
    shutil.rmtree(destdir)

print('Extracting', fname)
subprocess.check_call(['unzip', '-d', destdir, fname])

print('Fixing permissions')
subprocess.check_call([
    'chmod', '+x', os.path.join(destdir, 'Microsoft.Python.LanguageServer')])

print('Install')
if os.path.exists('/opt/mspyls'):
    subprocess.check_call(['sudo', 'mv', '/opt/mspyls', '/opt/mspyls-old'])
subprocess.check_call(['sudo', 'mv', '-f', destdir, '/opt'])

print('Installed', fname)
