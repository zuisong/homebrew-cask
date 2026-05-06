cask "firefox@nightly" do
  version "152.0a1,2026-05-05-21-45-04"

  language "ca" do
    sha256 "7e8b85cdb7c1b73c74737b9d80d8ddd946726c5855d53a1f2f36dc3f60073fa8"
    "ca"
  end
  language "cs" do
    sha256 "8f1a3c2b4d6d16c16f73895830baccb4d9928511a301f3b2bdcd3e5993ff186d"
    "cs"
  end
  language "de" do
    sha256 "db49d499865e32bc2310eca767680207029b92cbeb2ebf3e64707255d5c712b9"
    "de"
  end
  language "en-CA" do
    sha256 "c2be222dd02b4713b3a84945dbecbb88864c2af5b5390826fa7035df009ca39f"
    "en-CA"
  end
  language "en-GB" do
    sha256 "0d25fc17d308bcdaaef5894c675e07fc25a02e615327d389878da5aceeaf5365"
    "en-GB"
  end
  language "en", default: true do
    sha256 "2305d9f121c3abfe9e06ac967b7e6a5686a4fd5cf6bece708af2079198f797b8"
    "en-US"
  end
  language "es" do
    sha256 "e23d1b6a9e1c0823345ad8441b54228ab19985ffb31631a1c254548a0f84f628"
    "es-ES"
  end
  language "fr" do
    sha256 "da46bf3713c4e56651b87448e51499336b22d17ffb37f57aa80b178f2024eda2"
    "fr"
  end
  language "it" do
    sha256 "ad77f8ab03d1596e851ff0a4958a4f546b0caba41445221c5fc4ffc89b70cf8a"
    "it"
  end
  language "ja" do
    sha256 "f5b8a0dd0dfd9b5eea237e3d082a236db7b390e70dc9592c279311a28bfde958"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "7986e7640e2a65574628b6b61724032c6f0ac572882e39588b6dfdd5bd12ca57"
    "ko"
  end
  language "nl" do
    sha256 "a73e492a70385ea1e89ec25f470323c6386bd3a3696ae8a15282c2a50c0a5a4a"
    "nl"
  end
  language "pt-BR" do
    sha256 "ed719f830660b777db3c0b5e3ab2468fc75f19738a70af949d56bac3326dbe60"
    "pt-BR"
  end
  language "ru" do
    sha256 "1ac7b1707e606f272f6f40087b8f8815f84094ef8a0724a15b94280deaa7e062"
    "ru"
  end
  language "uk" do
    sha256 "075c2fd8737c1bc3d825a427efa96c5f49422c9d2565761cfc1ff940a100d0b6"
    "uk"
  end
  language "zh-TW" do
    sha256 "c4708c01c6b642df84c5a3113778937ffd8cc894281fd4184320302731822fe7"
    "zh-TW"
  end
  language "zh" do
    sha256 "d0a4adcdb30b0a8792b081b2d43ca58fc8d017d7a45675b126de48922c48b1a1"
    "zh-CN"
  end

  url "https://ftp.mozilla.org/pub/firefox/nightly/#{version.csv.second.split("-").first}/#{version.csv.second.split("-").second}/#{version.csv.second}-mozilla-central#{"-l10n" if language != "en-US"}/firefox-#{version.csv.first}.#{language}.mac.dmg"
  name "Mozilla Firefox Nightly"
  desc "Web browser"
  homepage "https://www.mozilla.org/firefox/channel/desktop/#nightly"

  livecheck do
    url "https://product-details.mozilla.org/1.0/firefox_versions.json"
    regex(%r{/(\d+(?:[._-]\d+)+)[^/]*/firefox}i)
    strategy :json do |json, regex|
      version = json["FIREFOX_NIGHTLY"]
      next if version.blank?

      content = Homebrew::Livecheck::Strategy.page_content("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-#{version}.en-US.mac.buildhub.json")
      next if content[:content].blank?

      build_json = Homebrew::Livecheck::Strategy::Json.parse_json(content[:content])
      build = build_json.dig("download", "url")&.[](regex, 1)
      next if build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Firefox Nightly.app"

  zap trash: [
        "/Library/Logs/DiagnosticReports/firefox_*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.firefox.sfl*",
        "~/Library/Application Support/CrashReporter/firefox_*",
        "~/Library/Application Support/Firefox",
        "~/Library/Caches/Firefox",
        "~/Library/Caches/Mozilla/updates/Applications/Firefox",
        "~/Library/Caches/org.mozilla.firefox",
        "~/Library/Preferences/org.mozilla.firefox.plist",
        "~/Library/Saved Application State/org.mozilla.firefox.savedState",
        "~/Library/WebKit/org.mozilla.firefox",
      ],
      rmdir: [
        "~/Library/Application Support/Mozilla", #  May also contain non-Firefox data
        "~/Library/Caches/Mozilla",
        "~/Library/Caches/Mozilla/updates",
        "~/Library/Caches/Mozilla/updates/Applications",
      ]
end
