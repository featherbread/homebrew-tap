# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.19.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/featherbread/xt/releases/download/v0.19.4/xt-aarch64-apple-darwin.tar.gz"
      sha256 "b7213e856695355d249484054d009ddf85baad8673f99489e77e7d230dcd2f8c"
    end

    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.19.4/xt-x86_64-apple-darwin.tar.gz"
      sha256 "653091a1f0327bc691db30af1b90503d8e74cea858312f564d060731aafbccbf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.19.4/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8136e31c3ac60c556dcd2c38ce6c775a84c868c0f2238fdd9fee5a38933c9724"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.19.4/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d9b3e1ecf8f67e040d61aea89734c20ad8b72e6caff5b75eb6051784d612b3e"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.19.4/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "e7560b5812949d9ceadfedb5de27f0d5394799ef7ed175aee52b4b3e62935b91"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
