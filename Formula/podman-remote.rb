class PodmanRemote < Formula
  desc "Podman manages pods, containers, images, and volumes"
  homepage "https://podman.io/"
  url "https://github.com/garethahealy/podman-remote-build/archive/1.3.0-dev-01052019.tar.gz"
  sha256 "65cf4c26620d2e2ba9cd1a847ad32d7cd743df9c7d5e614dcc08b8893c0a2ba0"

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
