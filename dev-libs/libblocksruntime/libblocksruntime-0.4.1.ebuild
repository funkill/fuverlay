# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils

DESCRIPTION="Blocks runtime for libdispatch-objc2"
HOMEPAGE="https://github.com/mheily/blocks-runtime"
SRC_URI="https://github.com/mheily/blocks-runtime/releases/download/v${PV}/libblocksruntime-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-devel/clang"
RDEPEND="${DEPEND}"

src_configure() {
        export CC=clang
        export CXX=clang++

       	append-flags -fblocks

       	local mycmakeargs="-DDISPATCH_INCLUDE_DIR=include"
        cmake-multilib_src_configure
}

src_install() {
        cmake-multilib_src_install

        #insinto /usr/include/dispatch
        #doins "${FILESDIR}/dispatch.h"
        #dosym dispatch/dispatch.h /usr/include/dispatch/dispatch.h
}
