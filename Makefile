CC=gcc

CFLAGS=-Wall -Wextra -Werror -pedantic -fstack-protector-all -pedantic -std=c99
SANITY_FLAGS=-Wfloat-equal -Wshadow -Wpointer-arith

PREFIX ?= /usr

SOURCE=autohtpasswd.c

OUTPUT=autohtpasswd

ALL: $(OUTPUT)

debug: CFLAGS += -g -O0
debug: $(OUTPUT)

release: CFLAGS += -static -O3
release: $(OUTPUT)

$(OUTPUT): Makefile $(SOURCE)
	$(CC) $(CFLAGS) $(SANITY_FLAGS) $(SOURCE) -o $(OUTPUT)

install: $(OUTPUT)
	install -Dm755 "autohtpasswd"   "$(PREFIX)/bin/autohtpasswd"
	install -Dm644 "LICENSE"    "$(PREFIX)/share/licenses/autohtpasswd/LICENSE"
	#install -Dm644 "autohtpasswd.8" "$(PREFIX)/share/man/man8/autohtpasswd.8.gz"

uninstall:
	rm -f "$(PREFIX)/bin/autohtpasswd"
	rm -f "$(PREFIX)/share/licenses/autohtpasswd/LICENSE"
	#rm -f "$(PREFIX)/share/man/man8/autohtpasswd.8.gz"
