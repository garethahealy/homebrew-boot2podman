class PodmanRemote < Formula
  desc "Podman manages pods, containers, images, and volumes"
  homepage "https://podman.io/"
  url "https://github.com/garethahealy/podman-remote-build/archive/1.3.0-dev-13042019.tar.gz"
  sha256 "5c4d7ce5dee5f9b645e7ee908dbcd9ca8fdf79b87979572027e0790ceec34787"

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
