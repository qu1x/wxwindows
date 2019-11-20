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
	cd $@ && curl -Lo 'wx168#1.tgz' '$(URL)wx168{_1,_2,htm,pdf,ps}.tgz/download'
	cd $@ && shasum -c ../wxwindows_1.68e.orig.sha

Makefile:;
