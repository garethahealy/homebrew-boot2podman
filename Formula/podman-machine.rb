class PodmanMachine < Formula
  desc "Machine lets you create Podman hosts on your computer"
  homepage "https://boot2podman.github.io/"
  url "https://github.com/boot2podman/machine/archive/v0.14.tar.gz"
  sha256 "ad266d01f14d9e0ef3160cf216ab88268f562bd7750c55e5fd52ba1edd5e8ea0"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/boot2podman/machine"
    dir.install buildpath.children

    cd dir do
      system "make", "podman-machine.darwin-amd64"
      mv "podman-machine.darwin-amd64", "podman-machine"

      bin.install "podman-machine"
      prefix.install_metafiles
    end
  end

  test do
    system bin/"podman-machine", "version"
  end
end
