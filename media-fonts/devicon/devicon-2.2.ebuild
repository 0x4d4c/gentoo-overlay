# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="Devicon icon font"
HOMEPAGE="http://devicon.fr/"
SRC_URI="https://github.com/konpa/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip test"

DEPEND=""
RDEPEND=""

FONT_SUFFIX="ttf"
FONT_S="${S}/fonts"
