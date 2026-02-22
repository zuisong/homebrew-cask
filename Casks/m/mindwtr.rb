cask "mindwtr" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.19"
  sha256 arm:   "891152af363b748d09ac923c3555bd74533e408ee82b770d6a1e5a160f217e25",
         intel: "8c6bd18501c569ca8bd475eff419e6c556a0fea5bde0ff60d0cfbab0c94e3b12"

  url "https://github.com/dongdongbh/Mindwtr/releases/download/v#{version}/mindwtr_#{version}_#{arch}.dmg"
  name "Mindwtr"
  desc "Local-first GTD productivity tool"
  homepage "https://github.com/dongdongbh/Mindwtr"

  app "Mindwtr.app"

  zap trash: [
    "~/Library/Application Support/mindwtr",
    "~/Library/Application Support/tech.dongdongbh.mindwtr",
    "~/Library/Preferences/tech.dongdongbh.mindwtr.plist",
    "~/Library/Saved Application State/tech.dongdongbh.mindwtr.savedState",
  ]
end
