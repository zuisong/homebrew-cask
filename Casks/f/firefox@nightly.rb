cask "firefox@nightly" do
  version "152.0a1,2026-05-06-08-59-15"

  language "ca" do
    sha256 "004d29d1d398ca447addefe895b31b0b8835d870f592f556e7a7b6bb8adf9289"
    "ca"
  end
  language "cs" do
    sha256 "31d61bb7c37b64ed082ba2e27ac6618dddb5b692ec567ad255c95831ef996778"
    "cs"
  end
  language "de" do
    sha256 "a4ea49c4b1092aead4ce787e38338d68566ef4babea0b31f82041fc3f8f644a5"
    "de"
  end
  language "en-CA" do
    sha256 "23a77558f15540535644cea67e3d2b80a5e5c9ebc4ee8d91bcbc4ebde5b64c7d"
    "en-CA"
  end
  language "en-GB" do
    sha256 "8ef81ac11477e35444fc3367c7c3ff8b4d33f2e3adf83d0476e8565b3eb0d9c8"
    "en-GB"
  end
  language "en", default: true do
    sha256 "9f8f39359d25f6104c23b943c3fd0392bec6736492db892b74a4a113d4ad77ec"
    "en-US"
  end
  language "es" do
    sha256 "8d95a2ead39f2d433fb71478a2a14b53316c52b8f7c3e46b6518905167e0b454"
    "es-ES"
  end
  language "fr" do
    sha256 "5db4688dde637ae92952fe55a5b811428b820bb5c1d3d3521e56bf5e6c3cfcf6"
    "fr"
  end
  language "it" do
    sha256 "a4eb142ca0ad9861235b4a02b542de6b3d0ba4611edc11d3aab12d1eae5fd407"
    "it"
  end
  language "ja" do
    sha256 "cf9caf49eec6eda8c6bdf1e219c5be6757da26231752b24c859ed75f29b0c60b"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "09a8445c91a08e4e81f5929f0ca57a7e15f57151873d25ad126bb167725be6fc"
    "ko"
  end
  language "nl" do
    sha256 "bcbfb55aa98dbbb0712d509a16312627eccf41c06d6f39f510347efb88cb2405"
    "nl"
  end
  language "pt-BR" do
    sha256 "1fe4f57ec90333ba68cc7aeb6adc3a41717ecbe9b723a5eadd41b2af5dd97344"
    "pt-BR"
  end
  language "ru" do
    sha256 "b43df5e286192d056e97e04284f6ed7e40d1b01f676881a6a63f1f6df34a54b8"
    "ru"
  end
  language "uk" do
    sha256 "04efefbfc13b38410f9bf092a96a3778e33d464aa4282a2545202160336a615c"
    "uk"
  end
  language "zh-TW" do
    sha256 "9e4f91c50b725f45bc4058a64859b192b382c622d9f7c138b06be6b5921b11cb"
    "zh-TW"
  end
  language "zh" do
    sha256 "c4a4d35c38942a685accea2ae9da9fd10ff4e21a744c0fb9d090cc884b4b5803"
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
