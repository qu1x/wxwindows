# Debian Packages: wxWindows Cross-platform C++ GUI toolkit

wxWindows (legacy version of wxWidges) is a class library for C++ providing
GUI components and other facilities on several popular platforms (and some
unpopular ones as well).

## Generate Debian Upstream Tarball

The Debian upstream tarball is generated from multiple original upstream
tarballs which will be fetched from [SourgeForge] and verified against
[checksums].

[SourgeForge]: https://sourceforge.net/
[checksums]: wxwindows_1.68e.orig.sha

```sh
make
```

## Build Debian Packages

```sh
cd wxwindows-1.68e/
dpkg-buildpackage --no-sign
lintian ../*.deb ../*.dsc
```
