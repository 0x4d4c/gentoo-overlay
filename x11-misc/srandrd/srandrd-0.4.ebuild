# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Simple randr daemon"
HOMEPAGE="http://portix.bitbucket.org/srandrd/"
SRC_URI="https://bitbucket.org/portix/${PN}/downloads/${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	epatch "${FILESDIR}/${P}-Makefile.patch"
}
