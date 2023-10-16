class Pgpx < Formula
  desc "PostgreSQL proxy that enables RDS IAM authentication on Postgres client apps"
  homepage "https://github.com/kurianoff/pgpx"
  version "0.0.6"
  license "MPL-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-arm64"
    sha256 "8487c8ba4488627c9ace59abc7fc27e43025b8c10251b0fb402e61fdf5bc3b78"
  else
    url "https://github.com/kurianoff/pgpx/releases/download/v#{version}/pgpx-darwin-amd64"
    sha256 "71e3ec49ce4689eb2a21ce29894f3db85671fcb4c5724d3527f69d5db0d9903f"
  end

  def install
    bin.install "pgpx-#{Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"}" => "pgpx"
  end

  test do
    assert_match "pgpx version v#{version}", shell_output("#{bin}/pgpx --version")
  end
end
