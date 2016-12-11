# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3.git"

EGIT_REPO_URI="https://github.com/Airblader/i3.git"
EGIT_BRANCH="gaps"
EGIT_COMMIT="7db96987682251af574014df054fc584c985e859"

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
	x11-libs/xcb-util-xrm
	x11-libs/xcb-util-wm
	>=x11-libs/cairo-1.14.4[X,xcb]
	>=x11-libs/pango-1.30.0[X]"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS
	!x11-wm/i3"

DOCS=( RELEASE-NOTES-${PV} )

src_prepare() {
	default
	cat <<- EOF > "${T}"/i3-gaps
		#!/bin/sh
		exec /usr/bin/i3
	EOF
	epatch_user
}

src_compile() {
	emake V=1 CC="$(tc-getCC)" AR="$(tc-getAR)"
	emake -C man/
}

src_install() {
	default
	doman man/*.1
	exeinto /etc/X11/Sessions
	doexe "${T}"/i3-gaps
}

pkg_postinst() {
	einfo "There are several packages that you may find useful with ${PN} and"
	einfo "their usage is suggested by the upstream maintainers, namely:"
	einfo "  x11-misc/dmenu"
	einfo "  x11-misc/i3status"
	einfo "  x11-misc/i3lock"
	einfo "Please refer to their description for additional info."
}
