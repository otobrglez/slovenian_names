#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from .tools import *
except:
    from tools import *

from itertools import chain

from lxml import html
import requests

SITE_URL = "https://sl.wikipedia.org/wiki/Seznam_najpogostej%C5%A1ih_osebnih_imen_v_Sloveniji"

content = requests.get(SITE_URL)
content.encoding="utf-8"
tree = html.fromstring(re.sub("\s\s+", " ", content.text.strip()))

if sex() is "m":
    for name in clean([x.text for x in tree.xpath("//table[@class='sortable wikitable']//tr/td[2]//a")][1:]):
        print(name)
else:
    for name in clean([x.text for x in tree.xpath("//table[@class='sortable wikitable']//tr/td[4]//a")][1:]):
        print(name)