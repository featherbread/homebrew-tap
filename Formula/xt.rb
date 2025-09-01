# frozen_string_literal: true

class Xt < Formula
  desc "Translate between JSON, MessagePack, TOML, and YAML"
  version "0.19.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/featherbread/xt/releases/download/v0.19.5/xt-aarch64-apple-darwin.tar.gz"
      sha256 "d8004673b6f71c4ebe098fa85472a6c6babe6b7398824d229531bee39443d1b6"
    end

    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.19.5/xt-x86_64-apple-darwin.tar.gz"
      sha256 "1bc6c6f43a3a95c8ce538f64f9ee87cd579577c053479e68a216856ed60e1ac9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/featherbread/xt/releases/download/v0.19.5/xt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f34feffc127baa1da9da4419244ba69308a8487ceefe4c0740b7121a9ba51a2f"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.19.5/xt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fac690ee1071b48ef10ee7b0daec936afe9ea975f3019add790c509fe017ffa7"
    end

    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/featherbread/xt/releases/download/v0.19.5/xt-armv7-unknown-linux-musleabihf.tar.gz"
      sha256 "49198a126872f5d9c4e0f9642da279adb0ca08c69902e75ad162084f7a829412"
    end
  end

  def install
    bin.install "xt"
    man1.install "xt.1"
    doc.install "LICENSES.html"
  end
end
