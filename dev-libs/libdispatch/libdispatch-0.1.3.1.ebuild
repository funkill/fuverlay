# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-multilib

DESCRIPTION="Linux port of Apple's open-source concurrency library"
HOMEPAGE="http://nickhutchinson.me/libdispatch"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

EGIT_REPO_URI="https://github.com/nickhutchinson/libdispatch.git"
EGIT_COMMIT="v0.1.3.1"

RDEPEND="
	dev-libs/libpwq
	dev-libs/libkqueue[${MULTILIB_USEDEP}]
	dev-libs/libblocksruntime"

DEPEND="${RDEPEND}
	>=sys-devel/clang-3.0:=
	dev-lang/python:2.7
	>=dev-util/cmake-2.8.7"

src_configure() {
	export CC=clang
	export CXX=clang++

	cmake-multilib_src_configure
}
