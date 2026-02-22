cask "owocr" do
  arch arm: "applesilicon", intel: "intel"

  version "1.25.3"
  sha256 arm:   "51ba26e27721aa75a722506830e9e5dc97b7cd6187880464a68f51c7b0cf16f6",
         intel: "aceb8ba0d85bcd620522b1cdf4c5d94b2d0541d515961712eb9362366b741fca"

  url "https://github.com/AuroraWright/owocr/releases/download/#{version}/owocr-mac_#{arch}.dmg"
  name "OwOCR"
  desc "Optical character recognition for Japanese text"
  homepage "https://github.com/AuroraWright/owocr/"

  app "OwOCR.app"

  zap trash: [
    "~/Library/Application Support/com.aury.owocr",
    "~/Library/Caches/com.aury.owocr",
  ]
end
