cask "firefox@nightly" do
  version "149.0a1,2026-02-21-20-50-29"

  language "ca" do
    sha256 "e7077a07f82466a58f71c3f0899c9a6358f06e1a2bfea77054d8709b4905fe6a"
    "ca"
  end
  language "cs" do
    sha256 "ff274fb9eb86ae6a9d9b89bb39e948fc23eba5ec950d24e82f6d86366a1509e7"
    "cs"
  end
  language "de" do
    sha256 "54938273a950412db3223e0fb5815a7dbd8739d8935d8dc3e73a4dda50beaf5a"
    "de"
  end
  language "en-CA" do
    sha256 "66a39e631e021cbaaaa120fd676db6605df7c6dd14f537357450f2d0c61c0e57"
    "en-CA"
  end
  language "en-GB" do
    sha256 "ab3a557f4fd7117f612f7c68fea1c3c4dc936900bde6ed111b1b873c5b86d3f5"
    "en-GB"
  end
  language "en", default: true do
    sha256 "ee4ef7d1fe29924aa0de583bfc3677b8e4d804768752293a9ddbb0b29e52a6a5"
    "en-US"
  end
  language "es" do
    sha256 "2ce0f9d93ecfda90a13a27c1745849f380591527b1862b997acaa202ef098829"
    "es-ES"
  end
  language "fr" do
    sha256 "3ab8d24b60fb21c5c50c1d4d7778184609d639e03bd112cb9759da16cc65aa95"
    "fr"
  end
  language "it" do
    sha256 "5c264d7b99ec35bd979945ee4200830e56da95c1c2b84ac5683475d85b21503d"
    "it"
  end
  language "ja" do
    sha256 "05d15616b465a54cfe7133668cc620a186f91ee010a3f3c35355bcf13d3d7625"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "eb7894f04d5e8af89ffd45bd8c386b060a10e0b25931def1d07efcd55ae7f022"
    "ko"
  end
  language "nl" do
    sha256 "8d6010eca6a8bb7d13ac8cb8a84b674933b01a1799dbbe058427c2e83f926bec"
    "nl"
  end
  language "pt-BR" do
    sha256 "36d457c62ace20047b1493e4dcd0bc8ec5d0afffd5972b66773bfcaf43b26ac4"
    "pt-BR"
  end
  language "ru" do
    sha256 "9a7b5de94885cd6fb638f440b42889df1307e920608259357b4b7aa28aa9c921"
    "ru"
  end
  language "uk" do
    sha256 "8746d0653269dbe3a0cf74cc5cc09067aac77eaf9c768de8688a588bd09bbdb4"
    "uk"
  end
  language "zh-TW" do
    sha256 "c2e00987a2b197d9129685bdd7820ad73b541198b4842f3963eb42183e89c651"
    "zh-TW"
  end
  language "zh" do
    sha256 "e37184d1886830200aa291229b733120a4dc3b1c70ff50f6555413a0cf56d050"
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
