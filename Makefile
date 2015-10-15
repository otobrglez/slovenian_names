# .PHONY: scrape

scrapers = hervardi slovarji_info bambino narodne_pesmi wikipedia

#$(patsubst %,%.csv,$(scrapers)):
#	echo "test" > $@

sexes = m f

females = $(scrapers:%=./data/f/%.csv)
males = $(scrapers:%=./data/m/%.csv)

$(males): %.csv: %.py
	echo $@

%.py:
	echo "doing py"
	echo $@
	echo $(subst data,scripts,$@)
	echo "done"

#all: $(scrapers)

#$(scrapers): %.csv: %.py
#	echo $@

clean:
	rm -rf data/$(sexes)
