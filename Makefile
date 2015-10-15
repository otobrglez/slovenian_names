SCRAPERS = wikipedia hervardi slovarji_info bambino narodne_pesmi
SEXES = data/m data/f
FEMALES = $(SCRAPERS:%=./data/f/%.csv)
FEMALES_JOINED = $(SCRAPERS:%=./data/f.csv)
MALES = $(SCRAPERS:%=./data/m/%.csv)
MALES_JOINED = $(SCRAPERS:%=./data/m.csv)
GENRES = $(FEMALES) $(MALES)
GENRES_JOINED = $(MALES_JOINED) $(FEMALES_JOINED)

.PHONY: all mk_sexes $(SEXES)

mk_sexes:
	mkdir -p $(SEXES)

$(SEXES): $(GENRES)

data/%.csv:
	./scripts/$(*F).py $(*D) > $@

all: mk_sexes $(SEXES)
	sort -u ./data/f/*.csv > ./data/f.csv
	sort -u ./data/m/*.csv > ./data/m.csv

clean:
	rm -rf data/{f,m}.csv
	rm -rf data/{f,m}
