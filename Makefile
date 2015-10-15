SCRAPERS = wikipedia hervardi slovarji_info bambino narodne_pesmi
SEXES = data/m data/f
FEMALES = $(SCRAPERS:%=./data/f/%.txt)
FEMALES_JOINED = $(SCRAPERS:%=./data/f.txt)
MALES = $(SCRAPERS:%=./data/m/%.txt)
MALES_JOINED = $(SCRAPERS:%=./data/m.txt)
GENRES = $(FEMALES) $(MALES)
GENRES_JOINED = $(MALES_JOINED) $(FEMALES_JOINED)

.PHONY: all mk_sexes $(SEXES)

all: mk_sexes ./data/names.csv ./sql/names.sql

mk_sexes:
	mkdir -p $(SEXES)

./data/names.csv: mk_sexes ./data/f-combined.txt ./data/m-combined.txt
	echo '"Name","Genre"' > ./data/names.csv
	cat ./data/f-combined.txt | sed 's/.*/"&","f"/' >> ./data/names.csv
	cat ./data/m-combined.txt | sed 's/.*/"&","m"/' >> ./data/names.csv

./sql/names_insert.sql: mk_sexes ./data/f-combined.txt ./data/m-combined.txt
	cat ./data/m-combined.txt | sed "s/.*/INSERT IGNORE INTO names VALUES ('&','m');/" > ./sql/names_insert.sql
	cat ./data/f-combined.txt | sed "s/.*/INSERT IGNORE INTO names VALUES ('&','f');/" >> ./sql/names_insert.sql
./sql/names.sql: ./sql/names_insert.sql
	cat ./sql/names_structure.sql ./sql/names_insert.sql > ./sql/names.sql

./data/f-combined.txt: mk_sexes $(FEMALES)
	sort -u ./data/f/*.txt | uniq > ./data/f-combined.txt

./data/m-combined.txt: mk_sexes $(MALES)
	sort -u ./data/m/*.txt | uniq > ./data/m-combined.txt

data/%.txt:
	./scripts/$(*F).py $(*D) > $@

clean:
	rm -rf sql/names_insert.sql sql/names.sql
	rm -rf data/*.csv
	rm -rf data/{f,m}.txt
	rm -rf data/{f,m}
