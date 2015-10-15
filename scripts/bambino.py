#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from .tools import *
except:
    from tools import *

from itertools import chain

from lxml import html
import requests

SITE_URL = "http://www.bambino.si/100-najpogostejsih-starih-slovenskih-imen.html"

content = requests.get(SITE_URL)
content.encoding="utf-8"
tree = html.fromstring(re.sub("\s\s+", " ", content.text.strip()))

#from pdb import set_trace ; set_trace()
#exit(2)

if sex() is "m":
    for name in clean([str(x.text) for x in tree.xpath("//table[@width=326]//tr/td[2]//span")]):
        print(name)
else:
    for name in clean([str(x.text) for x in tree.xpath("//table[@width=326]//tr/td[3]//span")]):
        print(name)