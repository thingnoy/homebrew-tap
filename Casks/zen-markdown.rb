cask "zen-markdown" do
  version "0.1.4"
  sha256 "4cac88696bda814884bf8757b6d622ee5fa34b07c108e66ec90b6c4a97d4327f"

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
