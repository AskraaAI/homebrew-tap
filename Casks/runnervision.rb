cask "runnervision" do
  version "1.0.1"
  sha256 "38d69f610061b3b3c0a274e401c209fd088e04e77be618bf3533ae5afc59a532"

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
