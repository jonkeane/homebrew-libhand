require 'formula'

class Libhand < Formula
  homepage 'http://www.libhand.org/'
  # url 'https://sourceforge.net/projects/ogre/files/ogre/1.7/ogre_src_v1-7-4.tar.bz2'
  version '0.9'
  # sha1 'e989b96eacc2c66f8cf8a19dae6cfd962a165207'
  keg_only "For testing."
  
  head "https://github.com/jonkeane/libhand.git", :revision => "87605e1a426ceaf1bdd06fa6db86be426aa43236"
  sha1 '5eba03bd47f58f62fd6a14eda343f86dffee99f4'
  
  depends_on 'boost'
  depends_on 'ogre' => :build

  def install
    ENV.m64

    cmake_args = [ ]
    
    cmake_args.concat(std_cmake_args)
    cmake_args << "hand_cpp"

    mkdir "build" do
      system "cmake", *cmake_args
      system "make"
      system "make install"
    end
  end
end