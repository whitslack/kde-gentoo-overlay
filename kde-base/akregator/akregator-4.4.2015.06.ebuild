# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kdepim"
KDE_HANDBOOK=optional
inherit kde4-meta

DESCRIPTION="KDE news feed aggregator (noakonadi branch)"
HOMEPAGE="http://www.kde.org/applications/internet/akregator"
KEYWORDS=""
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdelibs '' 4.6)
	$(add_kdebase_dep kdepimlibs '' 4.6)
	$(add_kdebase_dep libkdepim)
"
RDEPEND="${DEPEND}"

KMLOADLIBS="libkdepim"
