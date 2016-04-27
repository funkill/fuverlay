# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

HASH_VERSION="fa6d0f03813dfb9df4589c30121e9fcffa8a8ec8"
RELEASE_CHANNEL="stable"
BINARY_SUFFIX=""

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	amd64? ( https://az764295.vo.msecnd.net/${RELEASE_CHANNEL}/${HASH_VERSION}/VSCode-linux-x64-${RELEASE_CHANNEL}.zip -> VSCode-linux-${PV}-x64.zip )
	x86? ( https://az764295.vo.msecnd.net/${RELEASE_CHANNEL}/${HASH_VERSION}/VSCode-linux-ia32-${RELEASE_CHANNEL}.zip -> VSCode-linux-${PV}-ia32.zip )
"

LICENSE="Microsoft"
SLOT=${RELEASE_CHANNEL}
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip mirror"

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	gnome-base/gconf
"
RDEPEND="${DEPEND}
	net-print/cups
"

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
	dosym "/opt/${PN}/code${BINARY_SUFFIX}" "/usr/bin/visual-studio-code"
	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}.desktop
	insinto "/usr/share/pixmaps"
	doins ${FILESDIR}/${PN}.png
	fperms +x "/opt/${PN}/code${BINARY_SUFFIX}"
}

pkg_postinst() {
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
