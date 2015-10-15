SCRAPERS = wikipedia hervardi slovarji_info bambino narodne_pesmi
SEXES = data/m data/f
FEMALES = $(SCRAPERS:%=./data/f/%.txt)
FEMALES_JOINED = $(SCRAPERS:%=./data/f.txt)
MALES = $(SCRAPERS:%=./data/m/%.txt)
MALES_JOINED = $(SCRAPERS:%=./data/m.txt)
GENRES = $(FEMALES) $(MALES)
GENRES_JOINED = $(MALES_JOINED) $(FEMALES_JOINED)

.PHONY: all mk_sexes $(SEXES)

all: mk_sexes ./data/names.csv

mk_sexes:
	mkdir -p $(SEXES)

./data/names.csv: ./data/f-combined.txt ./data/m-combined.txt
	echo '"Name","Genre"' > ./data/names.csv
	cat ./data/f-combined.txt | sed 's/.*/"&","f"/' >> ./data/names.csv
	cat ./data/m-combined.txt | sed 's/.*/"&","m"/' >> ./data/names.csv

./data/f-combined.txt: mk_sexes $(FEMALES)
	sort -u ./data/f/*.txt > ./data/f-combined.txt

./data/m-combined.txt: mk_sexes $(MALES)
	sort -u ./data/m/*.txt > ./data/m-combined.txt

data/%.txt:
	./scripts/$(*F).py $(*D) > $@

clean:
	rm -rf data/*.csv
	rm -rf data/{f,m}.txt
	rm -rf data/{f,m}
