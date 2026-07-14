#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="$DIR/../assembled.svg"

cat > "$OUT" << 'SVGEOF'
<svg
    width="1180"
    height="610"
    viewBox="0 0 1180 610"
    fill="none"
    xmlns="http://www.w3.org/2000/svg">
SVGEOF

cat "$DIR/01-defs.svg" >> "$OUT"

echo '<g clip-path="url(#bannerClip)">' >> "$OUT"

for f in "$DIR"/02-background.svg "$DIR"/03-effects.svg "$DIR"/04-panels.svg \
         "$DIR"/05-ascii.svg "$DIR"/06-terminal.svg "$DIR"/07-skills.svg \
         "$DIR"/08-socials.svg "$DIR"/09-footer.svg; do
    cat "$f" >> "$OUT"
done

echo '</g>' >> "$OUT"
echo '</svg>' >> "$OUT"

echo "Assembled: $OUT"
