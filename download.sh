#

echo $(which curl)
echo $(which unzip)
echo $(which 7z)

# version=$1
# curl --retry 10 --retry-delay 5 --retry-all-errors \
#     --connect-timeout 30 --max-time 300 \
#     -fSL -k -JO -# "https://github.com/mozilla-firefox/firefox/archive/refs/heads/$version.zip"
# unzip -q firefox*.zip
# rm -rf firefox*.zip
# mv firefox* mozilla-unified
