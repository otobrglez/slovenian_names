#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from .tools import *
except:
    from tools import *

from itertools import chain

from lxml import html
import requests

SITE_URL = "http://www.narodne-pesmi.si/?lang=&option=slovenska_imena&stran=Zakladi%20Slovenije"

content = requests.get(SITE_URL)
content.encoding="utf-8"
tree = html.fromstring(re.sub("\s\s+", " ", content.text.strip()))

if sex() is "m":
    for name in clean([x.text for x in tree.xpath("//div[contains(@style,'float:left')]//div[@id='leftcontentslimline_right']")]):
        print(name)
else:
    for name in clean([x.text for x in tree.xpath("//div[contains(@style,'float:right')]//div[@id='leftcontentslimline_right']")]):
        print(name)