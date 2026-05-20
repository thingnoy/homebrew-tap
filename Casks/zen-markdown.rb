cask "zen-markdown" do
  version "0.1.4"
  sha256 "4cac88696bda814884bf8757b6d622ee5fa34b07c108e66ec90b6c4a97d4327f"

  url "https://github.com/thingnoy/zen-markdown/releases/download/v#{version}/zen-markdown-macos-arm64.dmg"
  name "zen-markdown"
  desc "Fast, native markdown editor built with Rust + egui"
  homepage "https://github.com/thingnoy/zen-markdown"

  depends_on arch: :arm64

  app "zen-markdown.app"

  # The app is not notarized (no paid Apple Developer cert), so a
  # quarantined copy trips Gatekeeper ("damaged"). Strip the quarantine
  # attribute after install so it opens without manual steps.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/zen-markdown.app"]
  end

  caveats <<~EOS
    zen-markdown is not notarized (no paid Apple Developer cert).
    This cask removes the download quarantine automatically so it opens
    normally. If macOS still complains, run:

      xattr -dr com.apple.quarantine "/Applications/zen-markdown.app"
  EOS

  zap trash: [
    "~/Library/Saved Application State/com.thingnoy.zen-markdown.savedState",
  ]
end
