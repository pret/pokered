#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

case "$1" in
	--get-hash)
		action() { # owner/repo shallow-since commit
			printf "%s@%s-" "${1##*/}" "$3"
		}
		;;

	--get-paths)
		action() { # owner/repo shallow-since commit
			printf "test/%s," "${1##*/}"
		}
		;;

	*)
		echo "Fetching test dependency repositories"

		action() { # owner/repo shallow-since commit
			if [ ! -d ${1##*/} ]; then
				git clone https://github.com/$1.git --shallow-since=$2 --single-branch
			fi
			pushd ${1##*/}
			git checkout -f $3
			if [ -f ../patches/${1##*/}.patch ]; then
				git apply --ignore-whitespace ../patches/${1##*/}.patch
			fi
			popd
		}
esac

action pret/pokecrystal 2022-09-29 70a3ec1accb6de1c1c273470af0ddfa2edc1b0a9
action pret/pokered     2022-09-29 2b52ceb718b55dce038db24d177715ae4281d065
action AntonioND/ucity  2022-04-20 d8878233da7a6569f09f87b144cb5bf140146a0f
