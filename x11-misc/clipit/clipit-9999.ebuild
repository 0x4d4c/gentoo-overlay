# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils fdo-mime git-r3

DESCRIPTION="Lightweight GTK+ clipboard manager (Parcellite fork)"
HOMEPAGE="http://gtkclipit.sourceforge.net"
EGIT_REPO_URI="https://github.com/0x4d4c/ClipIt.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="appindicator nls gtk3"

COMMON_DEPEND="
	!gtk3? ( >=x11-libs/gtk+-2.10:2 )
	gtk3? ( x11-libs/gtk+:3 )
	appindicator? (
		dev-libs/libappindicator:2
	)
	nls? (
		sys-devel/gettext
	)"

DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	nls? (
		dev-util/intltool
	)"

RDEPEND="${COMMON_DEPEND}
	x11-misc/xdotool
"

src_prepare() {
	default
	./autogen.sh
}

src_configure(){
	econf \
		$(use_enable appindicator) \
		$(use_enable nls) \
		$(use_with gtk3)
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
