# Slovenian names

List of Slovenian [names](data/names.csv) with genre.

## Details

- Data-set contains 610 male and 421 female names.
- Files are in UTF-8
- [f-combined.txt](data/f-combined.txt) contains female names.
- [m-combined.txt](data/m-combined.txt) contains male names.
- [names.csv](data/names.csv) contains all names in CSV format.
- [names.sql](sql/names.sql) contains MySQL `TABLE` and `INSERT`.
- Data is collected from publicly available data sources.

## Development

    mkvirtualenv \
      --no-site-packages \
      --python=/usr/local/Cellar/python3/3.4.3_2/bin/python3 imena
    workon imena
    pip install --upgrade -r requirements.txt
    
    make ./data/names.csv
    
## Author
- [Oto Brglez](https://github.com/otobrglez)

## License

- MIT, 2015