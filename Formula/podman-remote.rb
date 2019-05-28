class PodmanRemote < Formula
  desc "Podman manages pods, containers, images, and volumes"
  homepage "https://podman.io/"
  url "https://github.com/garethahealy/podman-remote-build/archive/1.3.2-dev_2019-05-28.tar.gz"
  sha256 "47ed96bb6dc149cbc657b449aa3ee29434a78135838404cc5fae8716eac493ad"

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
