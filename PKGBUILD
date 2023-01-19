# Maintainer: eneller <youremail@domain.com>
pkgname='schneller-setup-git'
pkgver='0.1'
pkgrel=1
pkgdesc="Basic i3 setup and tooling."
arch=('any')
url="https://github.com/eneller/schneller-setup"
license=('GPL')
# groups=()
depends=('git' 'i3-wm' 'xfce4-power-manager' 'nm-applet' 'blueman-applet' 'ddcutil' 'zsh' 'alacritty' 'neovim' 'firefox' 'picom' 'ulauncher' 'tmux' 'exa' 'ripgrep' 'nerd-fonts')
# TODO look at nerd-fonts packages, install and confuguration: font-config (fc-match Mono)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('tmux: Terminal sessions'
            'joplin-appimage: Self-hosted Notes'
            'bitwarden-desktop: GUI Password manager')
#provides=("${pkgname%-VCS}")
conflicts=('manjaro-i3-settings')
replaces=()
backup=()
options=()
install=
source=('FOLDER::VCS+URL#FRAGMENT')
noextract=()
md5sums=('SKIP')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
