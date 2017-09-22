require 'formula'

class Klustaviewa < Formula
  homepage 'http://klusta-team.github.io/klustaviewa/'
  url 'https://github.com/klusta-team/klustaviewa/archive/v0.1.0.zip'
  sha256 '9bc1a9f10084f77adfd354fb00d07f5870fc5fdc06b7c6e70fbc6c5bee7ae32c'
  head 'https://github.com/klusta-team/klustaviewa.git'

  depends_on 'qt'
  depends_on 'pyqt'
  depends_on :python
  depends_on 'numpy' => :python
  depends_on 'pandas' => :python
  depends_on 'matplotlib' => :python
  depends_on LanguageModuleDependency.new :python, 'pyopengl', 'OpenGL'

  def install
    system "mkdir -p #{prefix}/lib/python2.7/site-packages"
    system python, "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
  end

def caveats; <<-EOS.undent
        This formula is OUTDATED.

        If you want a newer version, please uninstall this homebrew 
        package and run (--upgrade might be needed in certain cases):
          pip install klustaviewa [--upgrade]
    EOS
  end

  test do
    system "klustaviewa"
  end
end
