# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.19.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.3/xt-aarch64-apple-darwin.tar.gz"
      sha256 "686e7f6d2c348afa0436ef4d33d85d734c5e92f732f8ae9d00c409fefcdeed18"
    end

    if Hardware::CPU.intel?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.3/xt-x86_64-apple-darwin.tar.gz"
      sha256 "838fc96c8ad915f48ee1f48279ae2b617b5cedd9b5af7a5d99ceba009e3e665e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.3/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b85b4da3953cb8c21dba70438879538f98ccdb056f3b2c12b536d64342a9def"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.3/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a054aac47e6bde10259b55ebb21c2fa4ad25b5467a7e8bef6459a1290eda7cc8"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.3/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "b7c4a221cf63f261210bb42b1140b7ba912da2a6d9b816815db41a74f218a6ef"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
