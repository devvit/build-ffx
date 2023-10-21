#

curl -fsSL https://hg.mozilla.org/mozilla-unified/bookmarks | egrep -o 'esr(\d+)' | head -n1
