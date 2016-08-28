# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ ${PV} = 9999 ]]; then
	inherit git-r3
fi

DESCRIPTION="highly flexible status line for the i3 window manager (gaps fork)"
HOMEPAGE="https://github.com/Airblader/i3blocks-gaps"
if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="https://github.com/Airblader/${PN}"
	EGIT_BOOTSTRAP=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/Airblader/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

SLOT="0"
LICENSE="GPL-3"
RDEPEND="app-admin/sysstat
	x11-wm/i3-gaps
	!x11-misc/i3blocks"
DEPEND="${RDEPEND}
	app-text/ronn"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
