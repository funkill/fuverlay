# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils rpm

RELEASE_DATETIME="2014-10-20-17-32-25"
DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://www.valentina-db.com/en/studio/download/current/vstudio_x64_5_lin-rpm?format=raw -> ${P}.rpm"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}"

src_install() {
	insinto /opt
	doins -r ${WORKDIR}/opt/*
	insinto /usr
	doins -r ${WORKDIR}/usr/*
	dosym "/opt/VStudio/vstudio" "${I}/opt/bin/vstudio"
	exeinto "${I}/opt/VStudio/"
	doexe "${WORKDIR}/opt/VStudio/vstudio"
}


