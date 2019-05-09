class PodmanRemote < Formula
  desc "Podman manages pods, containers, images, and volumes"
  homepage "https://podman.io/"
  url "https://github.com/garethahealy/podman-remote-build/archive/1.3.1-dev_2019-05-09.tar.gz"
  sha256 "007323311890702c90444f6c5978799263db80b1a85ef40cc0002b731037acac"

  depends_on "go"

  def install
    mv "bin/podman-remote-darwin", "bin/podman-remote"

    bin.install "bin/podman-remote"
    prefix.install_metafiles
  end

  test do
    system bin/"podman-remote", "version"
  end
end
