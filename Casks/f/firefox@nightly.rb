cask "firefox@nightly" do
  version "152.0a1,2026-05-01-08-04-18"

  language "ca" do
    sha256 "1ff5230ea1e85523052a67791b976e903fb247435fa54c352c2195aa82617007"
    "ca"
  end
  language "cs" do
    sha256 "68b57298dd2e63becd6acdc64e8ed246d7579ef62ce1618519c8a7c200b293be"
    "cs"
  end
  language "de" do
    sha256 "624d017ffb5af440937c45deb84da8731c6d4b65fe987c18b1cc0cda42029cc0"
    "de"
  end
  language "en-CA" do
    sha256 "601f010c955c82504f62b5a2ba915d9c9813d38e8862e3b6639c7bf9d05be2bb"
    "en-CA"
  end
  language "en-GB" do
    sha256 "ecd3266ef10f06ec0b72d7501abb69183334a0a8a2904bc92cf43af3d4ad93ae"
    "en-GB"
  end
  language "en", default: true do
    sha256 "f9f90de308b0ae71ab58c2e7969001ea908081920d0c00d75d24cae9f2858338"
    "en-US"
  end
  language "es" do
    sha256 "c8065b5525ae9fb1787adc5fb4d284a7216ae03d456d56eaeff6e3d40426ee44"
    "es-ES"
  end
  language "fr" do
    sha256 "998bccb24000b9390ceb15b6c2e64777febca5bf8a07f230e3accaec0e4be8ec"
    "fr"
  end
  language "it" do
    sha256 "613345c260446d792d166de79603c6e4e4872e3ad10e82f29f143c56f41e3f17"
    "it"
  end
  language "ja" do
    sha256 "efcd1ff39e3b02bd6833a2e409e530eb8749a3029b800b95da67143de997dda3"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "5b300aee2f5d42d80eb313f63d9bc85a216819c7594eb5551a77aa51a5d20b35"
    "ko"
  end
  language "nl" do
    sha256 "b970995205418a8a42ccf8cf99eb61dd1dae83b1ad7d3787e21be941ae705914"
    "nl"
  end
  language "pt-BR" do
    sha256 "0d3d626bdc52982b0d6979cf8676a167af664548c8e0e1fe544b850fd01202a9"
    "pt-BR"
  end
  language "ru" do
    sha256 "44c367cf48c4e76ae85c7ea6be14b4a8aedfa17d92616244bf8cdb541331b31c"
    "ru"
  end
  language "uk" do
    sha256 "7d7a441c56cc8915e0d40ecfaf59b758bcc801fa69a8659be509f5381fd32e87"
    "uk"
  end
  language "zh-TW" do
    sha256 "45a08e296b720e6ec0635fe65773036172a08e233555834d21979d6d1f7d3afd"
    "zh-TW"
  end
  language "zh" do
    sha256 "e0f813ee69ec9d7616a55ccffca4985aa3e498a932a247dcbceb19a766e6902b"
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
