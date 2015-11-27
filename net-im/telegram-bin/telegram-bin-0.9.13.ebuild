# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed."
HOMEPAGE="https://telegram.org/"

SRC_URI="
	amd64? ( https://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz )
	x86? ( https://updates.tdesktop.com/tlinux32/tsetup32.${PV}.tar.xz )
"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip mirror"

DEPEND="
	x11-libs/libX11
	x11-libs/libxcb
	dev-libs/glib
	x11-libs/libXau
	x11-libs/libXdmcp
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/Telegram"

src_install() {
	insinto "/opt/${PN}/"
	doins -r ${S}/*

	fperms +x "/opt/${PN}/Telegram"

	dosym "/opt/${PN}/Telegram" "/usr/bin/Telegram"
	
	insinto "/usr/share/applications"
	doins "${FILESDIR}/telegramdesktop.desktop"

	doicon "${FILESDIR}/icon.png"
}
