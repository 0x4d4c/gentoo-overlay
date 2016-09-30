# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils autotools

DESCRIPTION="Lightweight calendar applet"
HOMEPAGE="http://dmedvinsky.github.io/gsimplecal/"
SRC_URI="https://github.com/dmedvinsky/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="x11-libs/gtk+:3"
DEPEND="
	virtual/pkgconfig
	${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	default
	eautoreconf
}
