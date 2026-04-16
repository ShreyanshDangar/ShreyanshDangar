#!/usr/bin/env bash

set -euo pipefail

readonly base_url="https://github-readme-stats-fast.vercel.app"
readonly output_dir="assets/readme-cards"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}

trap cleanup EXIT

fetch_svg() {
  local destination="$1"
  local url="$2"

  curl --fail --silent --show-error --location \
    --retry 3 \
    --retry-delay 2 \
    --output "${tmp_dir}/${destination}" \
    "$url"

  if ! grep -q "<svg" "${tmp_dir}/${destination}"; then
    echo "Downloaded asset is not SVG: ${destination}" >&2
    exit 1
  fi
}

fetch_svg \
  "project-crop-pilot.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=Crop-Pilot&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "project-x-portfolio.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=X-Portfolio&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "project-react-pro.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=React-Pro&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "project-design-forge.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=Design-Forge&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "project-backend-catalyst.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=Backend-Catalyst&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "project-apex-portfolio-engine.svg" \
  "${base_url}/api/pin/?username=ShreyanshDangar&repo=Apex-Portfolio-Engine&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&icon_color=DC2626&text_color=F5F5F5&border_color=DC2626&description_lines_count=3"
fetch_svg \
  "github-stats.svg" \
  "${base_url}/api?username=ShreyanshDangar&show_icons=true&hide_border=false&count_private=false&theme=github_dark&bg_color=0A0A0A&title_color=DC2626&text_color=F5F5F5&icon_color=DC2626&border_color=DC2626"

mkdir -p "${output_dir}"
cp "${tmp_dir}/"*.svg "${output_dir}/"
