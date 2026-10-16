cask "crumb" do
  version "2.0.1"
  sha256 "0c40b08e52f540d75dce0489dc7bc08d455d0dafdfca26d885518b8c9fb02822"

  url "https://github.com/bhaskar0210s/crumb/releases/download/v#{version}/Crumb.dmg"
  name "Crumb"
  desc "Tiny clipboard history for text, pictures and files"
  homepage "https://github.com/bhaskar0210s/crumb"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  auto_updates true

  app "Crumb.app"

  # Crumb isn't notarized by Apple. Without the quarantine flag that Homebrew puts on downloads, macOS opens it
  # without asking whether it is free of malware.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Crumb.app"]
  end

  uninstall signal: [["TERM", "app.crumb.Crumb"]]

  zap trash: [
    "~/Library/Application Support/Crumb",
    "~/Library/Preferences/app.crumb.Crumb.plist",
  ]
end
