# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kdepim"
KDE_HANDBOOK=optional
inherit kde4-meta

DESCRIPTION="A newsreader for KDE (noakonadi branch)"
KEYWORDS=""
IUSE="debug"

# test fails, last checked for 4.2.96
RESTRICT=test

DEPEND="
	$(add_kdebase_dep kdepimlibs '' 4.6)
	$(add_kdebase_dep libkdepim)
	$(add_kdebase_dep libkpgp)
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	libkpgp/
"

KMLOADLIBS="libkdepim"

src_unpack() {
	if use handbook; then
		KMEXTRA="
			doc/kioslave/news
		"
	fi

	kde4-meta_src_unpack
}