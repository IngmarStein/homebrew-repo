class OnepifToCsv < Formula
  desc "Convert 1pif files from 1Password to CSV"
  homepage "https://github.com/IngmarStein"
  url "https://github.com/IngmarStein/1pif-to-csv/archive/refs/tags/v0.3.tar.gz"
  sha256 "c4cad55818ab83f5a04bcd26c9c75ebed76acf69efb2e5400e4d051020163290"
  license "MIT"

  bottle do
    root_url "https://github.com/IngmarStein/homebrew-repo/releases/download/onepif-to-csv-0.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina:     "bad3b910d7dc516f109d6419c21551056cff1c3ea626505359c38593d83053e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "16f720d5bd8dca19db1411b127d4a185b4e2115e2756c7ed0b6b588c00c6a9fb"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "-o", bin/"1pif-to-csv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/1pif-to-csv --version")
  end
end
