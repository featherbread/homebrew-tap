# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.19.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.2/xt-aarch64-apple-darwin.tar.gz"
      sha256 "7b171e86265bbdde6dc31a4dda3943af1575826620874b2777cdc97ad0c01efa"
    end

    if Hardware::CPU.intel?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.2/xt-x86_64-apple-darwin.tar.gz"
      sha256 "da0aa342e635ca753017f06ac8b0a348cca540eb71b4e2f55135e8caa24ffcbb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.2/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "700b50fc570ee7aaae1d30f5389cd8e0ed4a52537af3a6fcadab645bc561c12c"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.2/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d0d3faa9b3ea958008a6e7aafda14398295a05fa38342eef21d8f7600ebdbd4d"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/ahamlinman/xt/releases/download/v0.19.2/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "874513bc6189c233a4ae81f9bc44cb1636d230a6fafc2d823c93fd13c757710a"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
