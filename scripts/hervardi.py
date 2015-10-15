#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from .tools import *
except:
    from tools import *

from itertools import chain

from lxml import html
import requests

SITE_URL = "http://" + "www.her" + "vardi" + ".com/imena.php"

content = requests.get(SITE_URL)
content.encoding = "windows-1250"
tree = html.fromstring(re.sub("\s\s+", " ", content.text.strip()))

if sex() is "m":
    for name in clean(chain.from_iterable(
            [x.text.strip().split(" ") for x in tree.xpath("//table[@align='center'][@bgcolor='white']//tr/td[1]/font")
             if
             "(" not in x.text])):
        print(name)
else:
    for name in clean(chain.from_iterable(
            [x.text.strip().split(" ") for x in tree.xpath("//table[@align='center'][@bgcolor='white']//tr/td[2]/font")
             if
             "(" not in x.text])):
        print(name)
