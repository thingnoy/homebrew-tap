cask "zen-markdown" do
  version "0.1.2"
  sha256 "7107f5a0ad752d1644a5eae71a21157bbee526e40246d33fbeec297266e81c57"

  url "https://github.com/thingnoy/zen-markdown/releases/download/v#{version}/zen-markdown-macos-arm64.dmg"
  name "zen-markdown"
  desc "Fast, native markdown editor built with Rust + egui"
  homepage "https://github.com/thingnoy/zen-markdown"

  depends_on arch: :arm64

  app "zen-markdown.app"

  caveats <<~EOS
    zen-markdown is not notarized (no paid Apple Developer cert), so
    Gatekeeper blocks the first launch. After installing, run once:

      xattr -dr com.apple.quarantine "/Applications/zen-markdown.app"

    or right-click the app in Finder and choose Open.
  EOS

  zap trash: [
    "~/Library/Saved Application State/com.thingnoy.zen-markdown.savedState",
  ]
end
