require 'formula'

class libhand < Formula
  homepage 'http://www.libhand.org/'
  # url 'https://sourceforge.net/projects/ogre/files/ogre/1.7/ogre_src_v1-7-4.tar.bz2'
  version '0.9'
  # sha1 'e989b96eacc2c66f8cf8a19dae6cfd962a165207'
  keg_only "For testing."
  
  head "https://github.com/jonkeane/libhand", :revision => "87605e1a426ceaf1bdd06fa6db86be426aa43236"

  depends_on 'boost'
  depends_on 'ogre' => :build

  def install
    ENV.m64

    cmake_args = [ ]
    
    cmake_args.concat(std_cmake_args)
    cmake_args << ".."

    mkdir "build" do
      system "cmake", *cmake_args
      system "make"
      system "make install"
    end
  end
end