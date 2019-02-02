# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib eutils

DESCRIPTION="Portable implementation of the kqueue() and kevent() system calls"
HOMEPAGE="https://github.com/mheily/libkqueue"
SRC_URI="https://github.com/mheily/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

DEPEND="dev-util/cmake"
