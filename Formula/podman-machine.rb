class PodmanMachine < Formula
  desc "Machine lets you create Podman hosts on your computer"
  homepage "https://boot2podman.github.io/"
  url "https://github.com/boot2podman/machine/releases/download/v0.17/podman-machine.darwin-amd64"
  sha256 "079bc9941d7479214149d0d38599489fab1164f56721b333714b8817cef5e88a"

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
