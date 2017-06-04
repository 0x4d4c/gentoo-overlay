# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Offers quick access to files and directories"
HOMEPAGE="https://github.com/clvv/fasd"
EGIT_REPO_URI="git://github.com/clvv/fasd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}

pkg_postinst() {
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		elog "To get fasd working in a shell, some initialization code must"
		elog "be run. Put the line below in your shell rc:"
		elog "  eval \"\$(fasd --init auto)\""
		elog "This will setup a command hook that executes on every command"
		elog "and advanced tab completion for zsh and bash."
	fi
}
