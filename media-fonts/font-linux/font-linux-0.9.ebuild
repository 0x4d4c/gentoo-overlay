# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit font

DESCRIPTION="Icon font of Linux distributions logos"
HOMEPAGE="https://lukas-w.github.io/font-linux/"
SRC_URI="https://github.com/Lukas-W/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip test"

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"
FONT_S="${S}/assets"
