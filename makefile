PAKET=./.paket/paket.exe
FAKE=./packages/FAKE/tools/FAKE.exe

.PHONY: all install bootstrap build

all: bootstrap install build

bootstrap:
	mkdir -p ./.paket
	mkdir -p ./tmp
	wget https://www.nuget.org/api/v2/package/Paket -O paket.zip &&\
	unzip ./paket.zip -d ./tmp &&\
	mv ./tmp/tools/paket.exe $(PAKET) &&\
	rm -rf ./tmp
	rm -f paket.zip

install:
	mono $(PAKET) install

build:
	mono $(FAKE) ./build.fsx
