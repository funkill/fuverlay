# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils

DESCRIPTION="Blocks runtime for libdispatch-objc2"
HOMEPAGE="https://github.com/mheily/blocks-runtime"
SRC_URI="https://github.com/mheily/blocks-runtime/releases/download/v${PV}/libblocksruntime-${PV}.tar.gz"

LICENSE="UoI-NCSA rc BSD public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

DEPEND=">=sys-devel/clang-3.0:="
