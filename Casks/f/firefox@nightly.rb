cask "firefox@nightly" do
  version "152.0a1,2026-05-03-09-12-52"

  language "ca" do
    sha256 "b91cf58911292cabc0b62d494f7429a2fce5bd29ba1e76dd471825fe0dc39501"
    "ca"
  end
  language "cs" do
    sha256 "c29244637d3fde4d09a30b3efdfcea170a93b418b5aa09ae74d4f1ddd3f09bce"
    "cs"
  end
  language "de" do
    sha256 "5826ba0a184614df2cc5e92e7aa1a39019bd14f9b22b89029577f574f968687e"
    "de"
  end
  language "en-CA" do
    sha256 "a7ceab58e4cb5393c24e828001dfe99f6c1911db7ae6032a0508a7c807899d26"
    "en-CA"
  end
  language "en-GB" do
    sha256 "d24a60aa8b516ff292616428275ace03325098d5dd076b982a875e9b33c430cf"
    "en-GB"
  end
  language "en", default: true do
    sha256 "b9378281f22fa2ccb8f9fe7455ed24d051eb06f2d9068df66032f03fdb96b568"
    "en-US"
  end
  language "es" do
    sha256 "f0b569a09ad9c8a5d094cd9e050b0e5178cfbc9eab24146a2b84ffd2f6321de2"
    "es-ES"
  end
  language "fr" do
    sha256 "50dc95a0d77c9c0ec9ccdad1d454dcaa74a22a64f206429ed77daf44bbd517c7"
    "fr"
  end
  language "it" do
    sha256 "4411aba99445971d143011451f17f57c010ab3e2042bb8624fe5a366c705563d"
    "it"
  end
  language "ja" do
    sha256 "9ac3c7fe61a28c006cd3f8063941b7f231b9d6d63f8978df8eed3fc22cdf1d32"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "c7ce2e08b1b0d32a9fce80377f1462b8a029b4355bfe4087550b2f0c25a69ac5"
    "ko"
  end
  language "nl" do
    sha256 "2fd59d311ed87c7910812695bf32eb0c0969e023b5e2e8c3a39e1022109bb2a3"
    "nl"
  end
  language "pt-BR" do
    sha256 "9ffab861aa369ecc36b6724ed65e4ffdc295e90425b07d7154f30b7e6949b453"
    "pt-BR"
  end
  language "ru" do
    sha256 "55e226ed7d77ea32b28e1e389d59582e587afa60983a8cf56488859b87c185fb"
    "ru"
  end
  language "uk" do
    sha256 "ae19b260e629938cd5b449e0a3b49a275a0bb748de8bc7d9fa6b2162b6889544"
    "uk"
  end
  language "zh-TW" do
    sha256 "8c671f1e3229752e41a36b21d6a0dc2c2dc901ba88bbcb8900ee1940e1340946"
    "zh-TW"
  end
  language "zh" do
    sha256 "24a7e4b06f504ccb47173d6c4219a6c57766cae34fd42eebfde92520bc120b57"
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
