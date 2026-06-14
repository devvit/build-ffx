#

version=$1
curl --retry 10 --retry-delay 30 --retry-all-errors \
    --connect-timeout 30 --max-time 1800 \
    -fSL -k -JO -# "https://github.com/mozilla-firefox/firefox/archive/refs/heads/$version.zip"
unzip -q firefox*.zip
rm -rf firefox*.zip
mv firefox* mozilla-unified
