{ stdenv, lib, fetchgit, boost, cmake, ffmpeg, gettext, glew
, ilmbase, libXi, libX11, libXext, libXrender
, libjpeg, libpng, libsamplerate, libsndfile
, libtiff, libGLU_combined, openal, opencolorio, openexr, openimageio, openjpeg_1, pythonPackages, python37
, zlib, fftw, opensubdiv, freetype, jemalloc, ocl-icd
, jackaudioSupport ? false, libjack2
, cudaSupport ? true, cudatoolkit
, colladaSupport ? true, opencollada
, enableNumpy ? false, makeWrapper
}:

with lib;

let python = python37.withPackages(ps: with ps; [ numpy ]); in

stdenv.mkDerivation rec {
  name = "blender-2.8-beta";

  src = fetchgit {
    url = "https://git.blender.org/blender.git";
    deepClone = true;
    rev = "v2.80";
    sha256 = "1yrb38kbr7kifi0xizs2ccfbq43hdr061harkcyfncx8cx20bqcl";
  };

  buildInputs =
    [ boost cmake ffmpeg gettext glew ilmbase
      libXi libX11 libXext libXrender
      freetype libjpeg libpng libsamplerate libsndfile libtiff libGLU_combined openal
      opencolorio openexr openimageio openjpeg_1 python zlib fftw jemalloc
      (opensubdiv.override { inherit cudaSupport; })
      makeWrapper
    ]
    ++ optional jackaudioSupport libjack2
    ++ optional cudaSupport cudatoolkit
    ++ optional colladaSupport opencollada;

  postPatch =
    ''
      substituteInPlace extern/clew/src/clew.c --replace '"libOpenCL.so"' '"${ocl-icd}/lib/libOpenCL.so"'
    '';

  cmakeFlags =
    [ "-DWITH_MOD_OCEANSIM=ON"
      "-DWITH_CODEC_FFMPEG=ON"
      "-DWITH_CODEC_SNDFILE=ON"
      "-DWITH_INSTALL_PORTABLE=OFF"
      "-DWITH_FFTW3=ON"
      #"-DWITH_SDL=ON"
      "-DWITH_GAMEENGINE=ON"
      "-DWITH_OPENCOLORIO=ON"
      "-DWITH_SYSTEM_OPENJPEG=ON"
      "-DWITH_PLAYER=ON"
      "-DWITH_OPENSUBDIV=ON"
      "-DPYTHON_LIBRARY=${python.libPrefix}m"
      "-DPYTHON_LIBPATH=${python}/lib"
      "-DPYTHON_INCLUDE_DIR=${python}/include/${python.libPrefix}m"
      "-DPYTHON_VERSION=3.7"
      "-DWITH_PYTHON_INSTALL=ON"
      "-DWITH_PYTHON_INSTALL_NUMPY=ON"
    ]
    ++ optional jackaudioSupport "-DWITH_JACK=ON"
    ++ optionals cudaSupport
      [ "-DWITH_CYCLES_CUDA_BINARIES=ON"
        # Disable architectures before sm_30 to support new CUDA toolkits.
        "-DCYCLES_CUDA_BINARIES_ARCH=sm_30;sm_35;sm_37;sm_50;sm_52;sm_60;sm_61"
      ]
    ++ optional colladaSupport "-DWITH_OPENCOLLADA=ON";

  NIX_CFLAGS_COMPILE = "-I${ilmbase.dev}/include/OpenEXR -I${python}/include/${python.libPrefix}";

  # Since some dependencies are built with gcc 6, we need gcc 6's
  # libstdc++ in our RPATH. Sigh.
  #NIX_LDFLAGS = optionalString cudaSupport "-rpath ${stdenv.cc.cc.lib}/lib";

  enableParallelBuilding = true;

  postInstall = optionalString enableNumpy
    ''
      wrapProgram $out/bin/blender \
        --prefix PYTHONPATH : ${python37Packages.numpy}/${python.sitePackages}
    '';

  meta = with stdenv.lib; {
    description = "3D Creation/Animation/Publishing System";
    homepage = https://www.blender.org;
    # They comment two licenses: GPLv2 and Blender License, but they
    # say: "We've decided to cancel the BL offering for an indefinite period."
    license = licenses.gpl2Plus;
    platforms = [ "x86_64-linux" ];
    maintainers = [ maintainers.goibhniu ];
  };
}
