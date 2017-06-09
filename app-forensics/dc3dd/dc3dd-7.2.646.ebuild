# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Patched GNU dd for forensic acquisition of data"
HOMEPAGE="https://sourceforge.net/projects/dc3dd/"
SRC_URI="mirror://sourceforge/dc3dd/${P}.7z"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

DEPEND="nls? ( sys-devel/gettext )
	app-arch/p7zip"
RDEPEND="${DEPEND}"

src_configure() {
	chmod +x configure || die
	econf \
		$(use_enable nls)
}
