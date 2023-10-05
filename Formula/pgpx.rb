class Pgpx < Formula
  desc "Single-backend PostgreSQL proxy for enabling RDS IAM-based authentication with dynamic passwords on Postgres client apps that do not support dynamic credentials."
  homepage "https://github.com/kurianoff/pgpx"
  version "0.0.4"
  license "Mozilla Public License Version 2.0"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-arm64"
    sha256 "9f36851715bcda1e959004a10a3d7d71b8923b6267dfacde94ba2b1356ea97f8"
  else
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-amd64"
    sha256 "3bc7f1ce0693f938d239713dca6bde542b8e91576b09ad37d37653cebe4df40f"
  end

  def install
    bin.install "pgpx-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "pgpx"
  end

  test do
    assert_match "pgpx version v#{version}", shell_output("#{bin}/pgpx --version")
  end
end
