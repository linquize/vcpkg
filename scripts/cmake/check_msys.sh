#!/bin/sh
cat "$(dirname "$0")"/vcpkg_acquire_msys.cmake | grep '    URL "' | cut -d '"' -f 2 | while read url; do
	http_code="$(curl -L -s -I "$url" -o /dev/null -w "%{http_code}")"
	echo "$url" "$http_code"
done
