include /usr/src/completesearch/Makefile_orig

CS_CODE_DIR = /usr/src/completesearch

DB = ../data/input
BASE_NAME = ../data/input

WORD_SEPARATOR_BACKEND = :

prepare_input:
	$(MAKE) pall PARSER_OPTIONS="--base-name=$(BASE_NAME) --write-docs-file --write-words-file-ascii --normalize-words --encoding=utf8 --maps-directory=parser/ ${OPTIONS}"
	cp ../data/{input.hybrid,input.vocabulary,input.docs.DB} server/
	$(MAKE) start_server

delete_input:
	-$(CS_BIN_DIR)/startCompletionServer --kill $(PORT)
	rm -rf ../data/*
	rm -rf server/input.*

start_server:
	-$(CS_BIN_DIR)/startCompletionServer --kill $(PORT)
	cd server && ./startCompletionServer -r input.hybrid

start_server_debug:
	-$(CS_BIN_DIR)/startCompletionServer --kill $(PORT)
	cd server && ./startCompletionServer -Z input.hybrid
