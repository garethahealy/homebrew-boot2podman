class PodmanMachine < Formula
  desc "Machine lets you create Podman hosts on your computer"
  homepage "https://boot2podman.github.io/"
  url "https://github.com/boot2podman/machine/archive/v0.15.tar.gz"
  sha256 "1bc47532af45d5adf5cc835ed6c1c7fc73eea7f5a663648f6bc8965e756e5718"

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
