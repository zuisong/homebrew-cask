cask "firefox@nightly" do
  version "152.0a1,2026-04-29-09-19-01"

  language "ca" do
    sha256 "40f0c23e44fb65a5d77e3e69b1469f7981e40cfbabd98066c6d312b3d78f74c5"
    "ca"
  end
  language "cs" do
    sha256 "5abbbb9d4eefd8bab8db7e40e5bebe43c83caf2923d80685a9e75c93f4a044e8"
    "cs"
  end
  language "de" do
    sha256 "2b2bd86161a3d4aecec84a5c62ad349099959eed47e212f1dec88045885e823d"
    "de"
  end
  language "en-CA" do
    sha256 "41783d0e8315cf530fa6ea15214826a43ffae9d52b7b5b6294bd7ecebf288e86"
    "en-CA"
  end
  language "en-GB" do
    sha256 "6f7a24e713d35cde7d0b4a583222bc66970910840d21f56326d23cfb56c519b1"
    "en-GB"
  end
  language "en", default: true do
    sha256 "1a2d0d9987d12eb9c131741c2c7b5921d6c5b1fe9741130950ff92f4336976c7"
    "en-US"
  end
  language "es" do
    sha256 "2fb5478c7b518b470504b4366ca53617f932c772b165f455712a11c7610883ff"
    "es-ES"
  end
  language "fr" do
    sha256 "ebe8a2a4eeaceba4e761ad117b50621a58a0679f52d2af00148cc95799d8c3ba"
    "fr"
  end
  language "it" do
    sha256 "17f65651a3bb257bddb3bc61ae0734808177b18af2c2b53f11bbde7983abf6b0"
    "it"
  end
  language "ja" do
    sha256 "63475289d28ea666b8db542a25fb3b12876f8a04b4411586c2983f9996d534b7"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "b0e5493608bc71f661c57660b4559b9a872828201906ce57111f0db88523b418"
    "ko"
  end
  language "nl" do
    sha256 "c273545f0f618bbbcc673e85b7e26077b32aab4db745de95ea14c856b6b9eed0"
    "nl"
  end
  language "pt-BR" do
    sha256 "5b2da87ee6563465c5f500818b45979641085899a1f7f1f733167ce398a77d07"
    "pt-BR"
  end
  language "ru" do
    sha256 "b2a311cf3611e2c3944063d66d58e5ac608c8b1db0eb53d55080efc5f378bc31"
    "ru"
  end
  language "uk" do
    sha256 "427d5ac3f19450a3ebff1343a66aa76114d23d4abbfd6460fea3c7baab921972"
    "uk"
  end
  language "zh-TW" do
    sha256 "ea9df9f7310f673afe4f368df52ba450660b91e3ece56c7335640df0f4b6399d"
    "zh-TW"
  end
  language "zh" do
    sha256 "9099c2608b2f436f370e7618cd45bdc798522b267cb41c83f2a09e0e40b51e2c"
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
