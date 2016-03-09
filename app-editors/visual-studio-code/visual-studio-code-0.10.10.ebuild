# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

HASH_VERSION="5b5f4db87c10345b9d5c8d0bed745bcad4533135"

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	amd64? ( https://az764295.vo.msecnd.net/stable/${HASH_VERSION}/VSCode-linux-x64-stable.zip -> VSCode-linux-${PV}-x64.zip )
	x86? ( https://az764295.vo.msecnd.net/stable/${HASH_VERSION}/VSCode-linux-ia32-stable.zip -> VSCode-linux-${PV}-ia32.zip )
"

LICENSE="Microsoft"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	gnome-base/gconf
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VSCode-linux-x64"

ARCH="$(uname -m)"

pkg_pretend() {
	if [[ $ARCH != "x86_64" ]];then
		eerror "This package is ONLY for 64-bit architecure."
		eerror "So if you don't it, you can't install it."
	fi
	return
}

src_install() {
	insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/code" "/usr/bin/visual-studio-code"
	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}.desktop
	insinto "/usr/share/pixmaps"
	doins ${FILESDIR}/${PN}.png
	fperms +x "/opt/${PN}/code"
}

pkg_postinst() {
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
