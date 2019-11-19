PKG := wxwindows
VER := 1.68e
URL := https://sourceforge.net/projects/wxwindows/files/1.68E/unix/

SRC := $(PKG)_$(VER).orig/
DST := $(PKG)-$(VER)/
TGZ := $(PKG)_$(VER).orig.tar.gz

.PHONY: all
all: $(TGZ)

.PHONY: clean
clean:
	rm -f $(TGZ)
	rm -f *.dsc *.deb *.buildinfo *.changes

.PHONY: distclean
distclean: clean
	rm -rf $(DST)

$(TGZ): | $(DST)
	tar -czf $@ $|

$(DST): | $(SRC)
	mkdir $@
	tar -C $@ -xzf $|wx168_1.tgz
	tar -C $@ -xzf $|wx168_2.tgz
	tar -C $@ -xzf $|wx168htm.tgz
	tar -C $@ -xzf $|wx168pdf.tgz
	tar -C $@ -xzf $|wx168ps.tgz
	tar -C $@ -xzf $@contrib/wxshlib/sh167_1.tgz
	cp -a debian $@

$(SRC):
	mkdir $@
	wget -P $@ $(URL)wx168_1.tgz
	wget -P $@ $(URL)wx168_2.tgz
	wget -P $@ $(URL)wx168htm.tgz
	wget -P $@ $(URL)wx168pdf.tgz
	wget -P $@ $(URL)wx168ps.tgz
	cd $@ && shasum -c ../wxwindows_1.68e.orig.sha

Makefile:;
