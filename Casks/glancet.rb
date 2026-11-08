cask "glancet" do
  version "0.3.3"
  sha256 "5f269f1973f3f678add99b1d91c10ad947d914d7926d6c99b6e3382cd6c202f6"

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
