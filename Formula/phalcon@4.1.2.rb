require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class PhalconAT412 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.1.2.tar.gz"
  sha256 "5dddb6bc6bc7f48e53f5121662007357efdf22639d2fde69d3f4b0b28fdd3646"
  head "https://github.com/phalcon/cphalcon.git"

  depends_on "pcre"
  depends_on "psr"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"

    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
