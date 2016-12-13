# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3.git"
SRC_URI="https://github.com/Airblader/i3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	>=x11-libs/cairo-1.14.4[X,xcb]
	>=x11-libs/pango-1.30.0[X]"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS"

if ! has nodoc ${FEATURES}; then
	DEPEND="${DEPEND} app-text/asciidoc"
fi

if ! has noman ${FEATURES}; then
	DEPEND="${DEPEND} app-text/asciidoc app-text/xmlto dev-lang/perl"
fi

S="${WORKDIR}/i3-${PV}"

src_prepare() {
	default
	sed -i 's/-non-git//' I3_VERSION
	if has nodoc ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_DOCS\],\).*/\1 false)/' -i configure.ac || die
	fi
	if has noman ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_MANS\],\).*/\1 false)/' -i configure.ac || die
	fi
	eautoreconf
	cat <<- EOF > "${T}"/i3wm
		#!/bin/sh
		exec /usr/bin/i3
	EOF
}

src_configure() {
	local myeconfargs=( --enable-debug=no --disable-maintainer-mode )
	econf "${myeconfargs[@]}"
}

src_compile() {
	emake -C "${CBUILD}"
}

src_install() {
	emake -C "${CBUILD}" DESTDIR="${D}" install
	exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}

pkg_postinst() {
	einfo "There are several packages that you may find useful with ${PN} and"
	einfo "their usage is suggested by the upstream maintainers, namely:"
	einfo "  x11-misc/dmenu"
	einfo "  x11-misc/i3status"
	einfo "  x11-misc/i3lock"
	einfo "Please refer to their description for additional info."
}
