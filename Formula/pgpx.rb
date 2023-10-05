class Pgpx < Formula
  desc "Single-backend PostgreSQL proxy for enabling RDS IAM-based authentication with dynamic passwords on Postgres client apps that do not support dynamic credentials."
  homepage "https://github.com/kurianoff/pgpx"
  version "0.0.3"
  license "Mozilla Public License Version 2.0"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/netsucket-darwin-arm64"
    sha256 "99e7501b9483cc8def9e269c63cb084ad1950ef8def5266058d282888be40fd2"
  else
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/netsucket-darwin-amd64"
    sha256 "6139f6efed73fd8fd88bb03f96dafc3d3fe59e7bcfca1a047035bda7474b52c5"
  end

  def install
    bin.install "pgpx-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "pgpx"
  end

  test do
    assert_match "pgpx version v0.0.3", shell_output("#{bin}/pgpx --version")
  end
end
