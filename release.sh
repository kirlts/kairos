#!/bin/bash
cd /home/kirlts/kairos

VERSION="v4.0.0"

# 1. kairos-version.txt
echo "$VERSION" > kairos-version.txt
cat new-manifest.txt >> kairos-version.txt

# 2. CHANGELOG.md
# We need to insert the new version block.
sed -i "s/## \[Unreleased\]/## [Unreleased]\n\n## [$VERSION] - $(date +%Y-%m-%d)\n\n### Changed\n- Completely refactored the entire Governance Engine (rules, skills, workflows, templates) into English to eliminate the 18-24% Translation Tax.\n- Applied Declarative System Framing to all instructions to maximize agent adherence and reduce imperative interference.\n- Updated memory guidelines for Hindsight and Composio integration./" docs/CHANGELOG.md

# 3. READMEs
sed -i "s/> \*\*Version:\*\* v3.5.0/> \*\*Version:\*\* $VERSION/" .github/README.md
sed -i "s/> \*\*Version:\*\* v3.5.0/> \*\*Version:\*\* $VERSION/" README-KAIROS.md

echo "Release $VERSION completed locally."
