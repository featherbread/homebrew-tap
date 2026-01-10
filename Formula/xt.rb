# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/featherbread/xt/releases/download/v0.20.0/xt-aarch64-apple-darwin.tar.gz"
      sha256 "fa5de0eeeb09809e10d68d6273e2696d2047efb717975b7edce5c14a8166bac2"
    end

    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.20.0/xt-x86_64-apple-darwin.tar.gz"
      sha256 "7346f929b10196bb50ce992d9dda7b103ea0f526c3b22e9e00da335de417d386"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.20.0/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0bb8b61869acbbc9d816062b6901f088c99fccfc12d3fc2a37ad405a825dc845"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.20.0/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c662e3de6352f9042c6e434aea78cd3b16cbd18283504a46ffda0ab019ec0960"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.20.0/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "a66115efd09eac21d4740602bcff31bb2b5a33d3c100f5d905d0986922628f14"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
