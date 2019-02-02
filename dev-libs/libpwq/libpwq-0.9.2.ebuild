# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Libpwq is a portable implementation of the pthread_workqueue API"
HOMEPAGE="https://github.com/mheily/libpwq"

SRC_URI="https://github.com/mheily/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}
