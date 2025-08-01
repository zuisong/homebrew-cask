cask "assinador-serpro" do
  version "4.3.1"
  sha256 "03fdabc58c04e7956310899e83f7960e93da2708a929263223d545185898c127"

  url "https://assinadorserpro.estaleiro.serpro.gov.br/downloads/#{version}/AssinadorSerpro-#{version}.mpkg.zip"
  name "Assinador Serpro"
  desc "Validate and sign documents using digital certificates"
  homepage "https://www.serpro.gov.br/links-fixos-superiores/assinador-digital/assinador-serpro"

  livecheck do
    url :homepage
    regex(/Assinador\sSerpro\s(\d+(?:\.\d+)+)/i)
  end

  disable! date: "2026-09-01", because: :unsigned

  depends_on macos: ">= :sierra"

  pkg "AssinadorSerpro-#{version}.mpkg/Contents/Packages/AssinadorSerpro.pkg"

  uninstall pkgutil: "br.gov.serpro.desktop.assinador"

  zap trash: "~/Library/Preferences/org.demoiselle.signer.serpro.desktop.Main.plist"
end
