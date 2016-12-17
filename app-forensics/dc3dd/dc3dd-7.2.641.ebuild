# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Patched GNU dd for forensic acquisition of data"
HOMEPAGE="https://sourceforge.net/projects/dc3dd/"
SRC_URI="mirror://sourceforge/dc3dd/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

DEPEND="nls? ( sys-devel/gettext )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable nls)
}
