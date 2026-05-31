# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/featherbread/xt/releases/download/v0.21.0/xt-aarch64-apple-darwin.tar.gz"
      sha256 "23596dfbc2fdbc93f35ed7f2a9dd4ab0e77d46baa430af7f6f68e4ec8f9e99c3"
    end

    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.21.0/xt-x86_64-apple-darwin.tar.gz"
      sha256 "473e03048db4b14c53b2a217c29a39aa6a9a42feb09e2fef3acb26774b50adde"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.21.0/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ffb8476112a1e1321f7a9f1e2bdf24d518cae15d2d9bd01ad66f30eadb056829"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.21.0/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eea4ac7c8858452fb5aae92e5fdd4e7298d36c64c7ee495048b0b290b3d6465f"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.21.0/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "572c6138d1dc60f9a931aca0c308c6d1d35eea22f4286231f985e65fabc7831e"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
