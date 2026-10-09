cask "glancet" do
  version "0.2.4"
  sha256 "2a81e19e1755a93a58e8d90c91dabab2e7a6a00f3525f42ad97bfc488df27fa8"

  url "https://glancet.io/downloads/Glancet-#{version}.zip"
  name "Glancet"
  desc "Menu-bar app surfacing live coding-agent session status in the notch"
  homepage "https://glancet.io/"

  # The app ships a Sparkle feed, so the cask tracks the same source of truth
  # the installed copy already updates itself from.
  livecheck do
    url "https://glancet.io/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Glancet.app"

  # LSUIElement agent with no Dock icon — it keeps running after the window is
  # gone, and a live copy would otherwise be replaced underneath itself.
  uninstall quit: "io.glancet.Glancet"

  # `~/.glancet` holds the hook forwarder. The hook ENTRIES merged into each
  # agent's own settings file are deliberately NOT touched here: they live in
  # files the user owns (~/.claude/settings.json and friends), removing them
  # means re-parsing third-party config, and a leftover entry fails open — the
  # forwarder gets connection-refused and exits 0. Use "Remove Glancet…" in the
  # app first for a full uninstall.
  zap trash: [
    "~/.glancet",
    "~/Library/Caches/io.glancet.Glancet",
    "~/Library/HTTPStorages/io.glancet.Glancet",
    "~/Library/Preferences/io.glancet.Glancet.plist",
    "~/Library/Preferences/design.ioki.glancet.plist",
  ]
end
