#!/usr/bin/env python

try:
    from .tools import *
except:
    from tools import *

from lxml import html
import requests

SITE_URL = "http://slovarji.info/imena_slovenska.html"

content = requests.get(SITE_URL)
content.encoding = 'utf-8'
tree = html.fromstring(re.sub("\s\s+", " ", content.text.strip()))

if sex() is 'm':
    for name in clean([x.text for x in tree.xpath("//table[@id='highlight']//tr/td[2]")]):
        print(name)
else:
    for name in clean([x.text for x in tree.xpath("//table[@id='highlight']//tr/td[1]")]):
        print(name)
