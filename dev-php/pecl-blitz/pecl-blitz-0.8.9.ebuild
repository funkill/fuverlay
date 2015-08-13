# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

PHP_EXT_NAME="blitz"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="CREDITS EXPERIMENTAL README"

USE_PHP="php5-4 php5-5"

inherit php-ext-pecl-r2

KEYWORDS="amd64 x86"

DESCRIPTION="fast and powerfull template engine for very big internet projects"
HOMEPAGE="http://alexeyrybak.com/blitz/blitz_en.html"

SRC_URI="http://alexeyrybak.com/${PHP_EXT_NAME}/${PHP_EXT_NAME}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
