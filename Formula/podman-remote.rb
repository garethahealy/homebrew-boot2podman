class PodmanRemote < Formula
  desc "Podman manages pods, containers, images, and volumes"
  homepage "https://podman.io/"
  url "https://github.com/garethahealy/podman-remote-build/archive/1.3.0-dev-25042019.tar.gz"
  sha256 "e912c0e18a6c025169bf3dd0692ebf930e196fa9fd07b420d36928d15034874b"

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
