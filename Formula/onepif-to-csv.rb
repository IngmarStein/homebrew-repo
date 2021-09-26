class OnepifToCsv < Formula
  desc "Convert 1pif files from 1Password to CSV"
  homepage "https://github.com/IngmarStein"
  url "https://github.com/IngmarStein/1pif-to-csv/archive/refs/tags/v0.3.tar.gz"
  sha256 "c4cad55818ab83f5a04bcd26c9c75ebed76acf69efb2e5400e4d051020163290"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "-o", bin/"1pif-to-csv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/1pif-to-csv --version")
  end
end
