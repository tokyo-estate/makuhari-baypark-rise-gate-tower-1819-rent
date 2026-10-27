#!/bin/bash
# index.html（日英中切替入り）から A4 の PDF 版を日英中で作り直す → pdf/1819_{ja,en,zh}.pdf ＋ スマホ用ビューア pdf/view.html
# 日本語本文を直したら: _幕張ベイパークRGT_i18n/make_mbp1819.py を直す → make_mbp1819_rent.py → python3 _幕張ベイパークRGT_i18n/apply_mbp.py rent → これ → _deploy.sh
set -e
cd "$(dirname "$0")"
python3 /Users/leetenki/AI_share/.claude/skills/property-site/scripts/make_pdf_brochure.py "$PWD" --name 1819
V=$(grep -o 'view.html?lang=ja&v=[0-9a-z]*' index.html | head -1 | sed 's/.*&//')
python3 _tools/make_viewer.py "$PWD" "$V"
ls -la pdf/*.pdf
