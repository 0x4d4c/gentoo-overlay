# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

MY_P="whhg-font"

DESCRIPTION="Icon font from WebHostingHub"
HOMEPAGE="http://www.webhostinghub.com/glyphs/"
SRC_URI="https://www.webhostinghub.com/glyphs/resources/${MY_P}.zip"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip test"

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

FONT_SUFFIX="ttf"
FONT_S="${S}/font"
