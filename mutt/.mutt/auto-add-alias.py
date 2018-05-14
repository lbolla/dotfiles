#!/usr/bin/env python

import sys
import email
import email.utils
import string
from functools import total_ordering


@total_ordering
class AliasItem:

    @staticmethod
    def decode(s):
        clean = s.replace('\\', '')
        return AliasItem._rot13(clean)

    @staticmethod
    def encode(s):
        return AliasItem._rot13(s)

    @staticmethod
    def _rot13(msg):
        rot13_trans = string.maketrans(
            "ABCDEFGHIJKLMabcdefghijklmNOPQRSTUVWXYZnopqrstuvwxyz",
            "NOPQRSTUVWXYZnopqrstuvwxyzABCDEFGHIJKLMabcdefghijklm")
        return string.translate(msg, rot13_trans)

    @staticmethod
    def fromstring(s):
        s = s.strip()
        if not s:
            return

        if '<' in s:
            return Alias.fromstring(AliasItem.decode(s))

        return Group.fromstring(AliasItem.decode(s))

    def __lt__(self, other):
        if isinstance(self, Alias) and isinstance(other, Group):
            return False
        if isinstance(self, Group) and isinstance(other, Alias):
            return True
        return self.name < other.name


class Alias(AliasItem):

    def __init__(self, name, addr, nick=None):
        self.name = name
        self.addr = addr
        self.nick = nick if nick is not None else Alias.make_nick(name, addr)

    @staticmethod
    def make_nick(name, addr):
        nick = name.strip().replace(' ', '.').lower()
        if not nick:
            return addr
        return nick

    @classmethod
    def fromstring(cls, s):
        nick, name_addr = s[6:].split(' ', 1)
        name, addr = email.utils.parseaddr(name_addr)
        if not name:
            name = addr
        return cls(name.strip(), addr.strip(), nick.strip())

    def tostring(self):
        return AliasItem.encode(
            'alias %s %s <%s>' % (self.nick, self.name, self.addr))


class Group(AliasItem):

    def __init__(self, name, nicks):
        self.name = name
        self.nicks = nicks

    @classmethod
    def fromstring(cls, s):
        name, nicks_ = s[6:].split(' ', 1)
        nicks = [n.strip() for n in nicks_.split(',')]
        return cls(name.strip(), nicks)

    def tostring(self):
        return AliasItem.encode(
            'alias %s %s' % (self.name, ', '.join(self.nicks)))


ALIAS_FILE = '/home/lbolla/.mutt/aliases.rot13'
aliases = filter(None, [AliasItem.fromstring(s)
                        for s in open(ALIAS_FILE, 'r').readlines()])
real_aliases_dict = dict(
    (a.addr, a)
    for a in aliases
    if isinstance(a, Alias))

msg = email.message_from_file(sys.stdin)
froms = msg.get_all('From', [])
ccs = msg.get_all('CC', [])
bccs = msg.get_all('BCC', [])

to_add = []
for name, addr in email.utils.getaddresses(froms + ccs + bccs):
    if addr not in real_aliases_dict:
        to_add.append(Alias(name, addr))

with open(ALIAS_FILE, 'w') as fid:
    for a in sorted(aliases + to_add):
        fid.write(a.tostring() + '\n')
