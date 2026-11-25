cask "runnervision" do
  version "1.0.0"
  sha256 "79a2e2e16614186a5d0edb2c51f23970bf54dd48d13e098a7dd390ede386b4e3"

  url "https://runnervision.askraa.ai/download/RunnerVision-#{version}.dmg"
  name "RunnerVision"
  desc "Menu bar monitor for self-hosted GitHub Actions runners on Colima"
  homepage "https://runnervision.askraa.ai/"

  livecheck do
    url "https://runnervision.askraa.ai/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :sonoma"

  app "RunnerVision.app"

  uninstall quit: "ai.askraa.runnervision"

  zap trash: [
    "~/Library/Application Support/RunnerVision",
    "~/Library/Preferences/ai.askraa.runnervision.plist",
  ]
end
