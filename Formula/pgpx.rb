class Pgpx < Formula
  desc "PostgreSQL proxy that enables RDS IAM authentication on Postgres client apps"
  homepage "https://github.com/kurianoff/pgpx"
  version "0.0.5"
  license "MPL-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-arm64"
    sha256 "574aa95e51231d7e284d99184fdf5cc033d4714981f4f1b6a16b25e97905e184"
  else
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-amd64"
    sha256 "2d85acac9a0ebcab30ca84062bbe53a774b2f55ee39091233d7e5864dfb14799"
  end

  def install
    bin.install "pgpx-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "pgpx"
  end

  test do
    assert_match "pgpx version v#{version}", shell_output("#{bin}/pgpx --version")
  end
end
