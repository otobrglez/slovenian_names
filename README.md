# Slovenian names

Tools and collection of Slovenian names, sorted by sex.

## Installation & development

    mkvirtualenv \
      --no-site-packages \
      --python=/usr/local/Cellar/python3/3.4.3_2/bin/python3 imena
    workon imena
    pip install --upgrade -r requirements.txt

## Compiling list

    SRC=hervardi && SEX=f && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv
    SRC=hervardi && SEX=m && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv
    SRC=slovarji_info && SEX=f && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv
    SRC=slovarji_info && SEX=m && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv
    SRC=bambino && SEX=m && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv
    SRC=bambino && SEX=f && ./scripts/$SRC.py $SEX > data/$SEX/$SRC.csv

## Author
- [Oto Brglez](https://github.com/otobrglez)
