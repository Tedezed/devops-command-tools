#!/bin/bash
# Stress site: stress_site.sh https://example.com/sitemap.xml
# By Tedezed

URL_SITEMAP_XML=$1
for url in $(curl -f -L ${URL_SITEMAP_XML} | grep -Eo 'https?://\S+?"' | sed 's/"//')
do
	echo "Check ${url}"
	ab -n 10 -c 10 ${url} &
	sleep 0.2
done
