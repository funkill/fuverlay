# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="libpthread_workqueue is a portable implementation of the pthread_workqueue API first introduced in Mac OS X."
HOMEPAGE="http://sourceforge.net/projects/libpwq/"
SRC_URI="mirror://sourceforge/libpwq/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
