#!/usr/bin/env python

import os, sys
os.system('whoami > whoami.txt')
f = open('whoami.txt', 'r'); user = f.read().strip(); f.close()
os.system('rm whoami.txt')
if user == 'root':
    print('run this as a regular user and not as root')
    sys.exit()
print("user:",user)

path = '/home/%s/.alex/' % user
if not os.path.exists(path): os.makedirs(path)

print("0/2 ...")
os.system('wget -nv -q https://yliowsubmit.pythonanywhere.com/static/downloads/alex.cpython-37.pyc')
os.system('mv alex.cpython-37.pyc /home/%s/.alex/alex.pyc' % user)

print("1/2 ...")
os.system('wget -nv -q https://yliowsubmit.pythonanywhere.com/static/downloads/alexrunner.py')
os.system('mv alexrunner.py /home/%s/.alex/alexrunner.py' % user)

print("2/2 ...")
os.system('cp /home/%s/.bashrc /home/%s/.bashrc.backup' % (user, user))
f = open('/home/%s/.bashrc' % user, 'r')
s = f.read()
f.close()
t = "alias alex='python /home/%s/.alex/alexrunner.py'" % user
if t not in s:
    s += '\n' + t + '\n'
    f = open('/home/%s/.bashrc' % user, 'w'); f.write(s); f.close()

print("if this is a fresh install you'll need to open a new shell and execute 'alex' (without quotes) to run alex")
