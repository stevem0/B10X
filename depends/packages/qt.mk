PACKAGE=qt
$(package)_version=5.9.7
$(package)_download_path=https://download.qt.io/archive/qt/5.9/$($(package)_version)/submodules
$(package)_suffix=opensource-src-$($(package)_version).tar.xz
$(package)_file_name=qtbase-$($(package)_suffix)
$(package)_sha256_hash=36dd9574f006eaa1e5af780e4b33d11fe39d09fd7c12f3b9d83294174bd28f00
$(package)_dependencies=openssl zlib
$(package)_linux_dependencies=freetype fontconfig libxcb
$(package)_build_subdir=qtbase
$(package)_qt_libs=corelib network widgets gui plugins testlib
$(package)_patches=fix_qt_pkgconfig.patch mac-qmake.conf fix_configure_mac.patch fix_no_printer.patch
$(package)_patches+= fix_rcc_determinism.patch xkb-default.patch no-xlib.patch dont_hardcode_pwd.patch
$(package)_patches+= drop_lrelease_dependency.patch
$(package)_patches+=fix_numeric_limits_compile_error.patch


$(package)_qttranslations_file_name=qttranslations-$($(package)_suffix)
$(package)_qttranslations_sha256_hash=b36da7d93c3ab6fca56b32053bb73bc619c8b192bb89b74e3bcde2705f1c2a14

$(package)_qttools_file_name=qttools-$($(package)_suffix)
$(package)_qttools_sha256_hash=d62e0f70d99645d6704dbb8976fb2222443061743689943d40970c52c49367a1

$(package)_extra_sources  = $($(package)_qttranslations_file_name)
$(package)_extra_sources += $($(package)_qttools_file_name)

define $(package)_set_vars
$(package)_config_opts_release = -release
$(package)_config_opts_debug = -debug
$(package)_config_opts += -bindir $(build_prefix)/bin
$(package)_config_opts += -c++std c++11
$(package)_config_opts += -confirm-license
$(package)_config_opts += -hostprefix $(build_prefix)
$(package)_config_opts += -no-compile-examples
$(package)_config_opts += -no-cups
$(package)_config_opts += -no-egl
$(package)_config_opts += -no-eglfs
$(package)_config_opts += -no-freetype
$(package)_config_opts += -no-gif
$(package)_config_opts += -no-glib
$(package)_config_opts += -no-icu
$(package)_config_opts += -no-iconv
$(package)_config_opts += -no-kms
$(package)_config_opts += -no-linuxfb
$(package)_config_opts += -no-libudev
$(package)_config_opts += -no-mtdev
$(package)_config_opts += -no-opengl
$(package)_config_opts += -no-openvg
$(package)_config_opts += -no-reduce-relocations
$(package)_config_opts += -no-qml-debug
$(package)_config_opts += -no-sql-db2
$(package)_config_opts += -no-sql-ibase
$(package)_config_opts += -no-sql-oci
$(package)_config_opts += -no-sql-tds
$(package)_config_opts += -no-sql-mysql
$(package)_config_opts += -no-sql-odbc
$(package)_config_opts += -no-sql-psql
$(package)_config_opts += -no-sql-sqlite
$(package)_config_opts += -no-sql-sqlite2
$(package)_config_opts += -no-use-gold-linker
$(package)_config_opts += -no-xinput2
$(package)_config_opts += -nomake examples
$(package)_config_opts += -nomake tests
$(package)_config_opts += -opensource
$(package)_config_opts += -openssl-linked
$(package)_config_opts += -optimized-qmake
$(package)_config_opts += -pch
$(package)_config_opts += -pkg-config
$(package)_config_opts += -prefix $(host_prefix)
$(package)_config_opts += -qt-libpng
$(package)_config_opts += -qt-libjpeg
$(package)_config_opts += -qt-pcre
$(package)_config_opts += -qt-harfbuzz
$(package)_config_opts += -system-zlib
$(package)_config_opts += -static
$(package)_config_opts += -silent
$(package)_config_opts += -v
$(package)_config_opts += -no-feature-dial
$(package)_config_opts += -no-feature-ftp
$(package)_config_opts += -no-feature-lcdnumber
$(package)_config_opts += -no-feature-pdf
$(package)_config_opts += -no-feature-printer
$(package)_config_opts += -no-feature-printdialog
$(package)_config_opts += -no-feature-concurrent
$(package)_config_opts += -no-feature-sql
$(package)_config_opts += -no-feature-statemachine
$(package)_config_opts += -no-feature-syntaxhighlighter
$(package)_config_opts += -no-feature-textbrowser
$(package)_config_opts += -no-feature-textodfwriter
$(package)_config_opts += -no-feature-udpsocket
$(package)_config_opts += -no-feature-wizard
$(package)_config_opts += -no-feature-xml

$(package)_config_opts_darwin = -no-dbus

ifneq ($(build_os),darwin)
$(package)_config_opts_darwin += -xplatform macx-clang-linux
$(package)_config_opts_darwin += -device-option MAC_SDK_PATH=$(OSX_SDK)
$(package)_config_opts_darwin += -device-option MAC_SDK_VERSION=$(OSX_SDK_VERSION)
$(package)_config_opts_darwin += -device-option CROSS_COMPILE="$(host)-"
$(package)_config_opts_darwin += -device-option MAC_MIN_VERSION=$(OSX_MIN_VERSION)
$(package)_config_opts_darwin += -device-option MAC_TARGET=$(host)
endif

$(package)_config_opts_linux  = -qt-xkbcommon-x11
$(package)_config_opts_linux += -qt-xcb
$(package)_config_opts_linux += -no-xcb-xlib
$(package)_config_opts_linux += -no-feature-xlib
$(package)_config_opts_linux += -system-freetype
$(package)_config_opts_linux += -no-feature-sessionmanager
$(package)_config_opts_linux += -fontconfig
$(package)_config_opts_linux += -dbus-runtime
$(package)_config_opts_arm_linux += -platform linux-g++ -xplatform bitcoin-linux-g++
$(package)_config_opts_i686_linux  = -xplatform linux-g++-32
$(package)_config_opts_x86_64_linux = -xplatform linux-g++-64
$(package)_config_opts_aarch64_linux = -xplatform linux-aarch64-gnu-g++
$(package)_config_opts_mingw32 = -no-dbus
$(package)_config_opts_mingw32 += -xplatform win32-g++
$(package)_config_opts_mingw32 += -device-option CROSS_COMPILE="$(host)-"
$(package)_build_env  = QT_RCC_TEST=1
$(package)_build_env += QT_RCC_SOURCE_DATE_OVERRIDE=1
endef

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttranslations_file_name),$($(package)_qttranslations_file_name),$($(package)_qttranslations_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttools_file_name),$($(package)_qttools_file_name),$($(package)_qttools_sha256_hash))
endef

define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttranslations_sha256_hash)  $($(package)_source_dir)/$($(package)_qttranslations_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttools_sha256_hash)  $($(package)_source_dir)/$($(package)_qttools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir qtbase && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source) -C qtbase && \
  mkdir qttranslations && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttranslations_file_name) -C qttranslations && \
  mkdir qttools && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttools_file_name) -C qttools
endef

define $(package)_preprocess_cmds
  sed -i.old "s|updateqm.commands = \$$$$\$$$$LRELEASE|updateqm.commands = $($(package)_extract_dir)/qttools/bin/lrelease|" qttranslations/translations/translations.pro && \
  patch -p1 -i $($(package)_patch_dir)/fix_numeric_limits_compile_error.patch && \
  patch -p1 -i $($(package)_patch_dir)/drop_lrelease_dependency.patch && \
  patch -p1 -i $($(package)_patch_dir)/dont_hardcode_pwd.patch &&\
  mkdir -p qtbase/mkspecs/macx-clang-linux &&\
  cp -f qtbase/mkspecs/macx-clang/Info.plist.lib qtbase/mkspecs/macx-clang-linux/ &&\
  cp -f qtbase/mkspecs/macx-clang/Info.plist.app qtbase/mkspecs/macx-clang-linux/ &&\
  cp -f qtbase/mkspecs/macx-clang/qplatformdefs.h qtbase/mkspecs/macx-clang-linux/ &&\
  cp -f $($(package)_patch_dir)/mac-qmake.conf qtbase/mkspecs/macx-clang-linux/qmake.conf && \
  cp -r qtbase/mkspecs/linux-arm-gnueabi-g++ qtbase/mkspecs/bitcoin-linux-g++ && \
  sed -i.old "s/arm-linux-gnueabi-/$(host)-/g" qtbase/mkspecs/bitcoin-linux-g++/qmake.conf && \
  patch -p1 -i $($(package)_patch_dir)/fix_qt_pkgconfig.patch &&\
  patch -p1 -i $($(package)_patch_dir)/fix_configure_mac.patch &&\
  patch -p1 -i $($(package)_patch_dir)/fix_no_printer.patch &&\
  patch -p1 -i $($(package)_patch_dir)/fix_rcc_determinism.patch &&\
  patch -p1 -i $($(package)_patch_dir)/xkb-default.patch &&\
  echo "!host_build: QMAKE_CFLAGS     += $($(package)_cflags) $($(package)_cppflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  echo "!host_build: QMAKE_CXXFLAGS   += $($(package)_cxxflags) $($(package)_cppflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  echo "!host_build: QMAKE_LFLAGS     += $($(package)_ldflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  patch -p1 -i $($(package)_patch_dir)/no-xlib.patch &&\
  echo "QMAKE_LINK_OBJECT_MAX = 10" >> qtbase/mkspecs/win32-g++/qmake.conf &&\
  echo "QMAKE_LINK_OBJECT_SCRIPT = object_script" >> qtbase/mkspecs/win32-g++/qmake.conf &&\
  sed -i.old "s|QMAKE_CFLAGS            = |!host_build: QMAKE_CFLAGS            = $($(package)_cflags) $($(package)_cppflags) |" qtbase/mkspecs/win32-g++/qmake.conf && \
  sed -i.old "s|QMAKE_LFLAGS            = |!host_build: QMAKE_LFLAGS            = $($(package)_ldflags) |" qtbase/mkspecs/win32-g++/qmake.conf && \
  sed -i.old "s|QMAKE_CXXFLAGS          = |!host_build: QMAKE_CXXFLAGS            = $($(package)_cxxflags) $($(package)_cppflags) |" qtbase/mkspecs/win32-g++/qmake.conf
endef

define $(package)_config_cmds
  export PKG_CONFIG_SYSROOT_DIR=/ && \
  export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
  export PKG_CONFIG_PATH=$(host_prefix)/share/pkgconfig  && \
  ./configure $($(package)_config_opts) && \
  echo "host_build: QT_CONFIG ~= s/system-zlib/zlib" >> mkspecs/qconfig.pri && \
  echo "CONFIG += force_bootstrap" >> mkspecs/qconfig.pri && \
  $(MAKE) sub-src-clean && \
  cd ../qttranslations && ../qtbase/bin/qmake qttranslations.pro -o Makefile && \
  cd translations && ../../qtbase/bin/qmake translations.pro -o Makefile && cd ../.. && \
  cd qttools/src/linguist && ../../../qtbase/bin/qmake linguist.pro -o Makefile && \
  cd lconvert && ../../../../qtbase/bin/qmake lconvert.pro -o Makefile && cd .. && \
  cd lrelease && ../../../../qtbase/bin/qmake lrelease.pro -o Makefile && cd .. && \
  cd lupdate && ../../../../qtbase/bin/qmake lupdate.pro -o Makefile && cd ../../../..
endef

define $(package)_build_cmds
  $(MAKE) -j$(JOBS) && \
  $(MAKE) -j$(JOBS) -C ../qttools/src/linguist/lconvert && \
  $(MAKE) -j$(JOBS) -C ../qttools/src/linguist/lrelease && \
  $(MAKE) -j$(JOBS) -C ../qttools/src/linguist/lupdate && \
  $(MAKE) -j$(JOBS) -C ../qttranslations
endef

define $(package)_stage_cmds
  $(MAKE) INSTALL_ROOT=$($(package)_staging_dir) install && cd .. && \
  $(MAKE) -C qttools/src/linguist/lconvert INSTALL_ROOT=$($(package)_staging_dir) install && \
  $(MAKE) -C qttools/src/linguist/lrelease INSTALL_ROOT=$($(package)_staging_dir) install && \
  $(MAKE) -C qttools/src/linguist/lupdate INSTALL_ROOT=$($(package)_staging_dir) install && \
  $(MAKE) -C qttools/src/linguist INSTALL_ROOT=$($(package)_staging_dir) install_cmake_linguist_tools_files && \
  $(MAKE) -C qttranslations INSTALL_ROOT=$($(package)_staging_dir) install_subtargets && \
  if `test -f qtbase/src/plugins/platforms/xcb/xcb-static/libxcb-static.a`; then \
    cp qtbase/src/plugins/platforms/xcb/xcb-static/libxcb-static.a $($(package)_staging_prefix_dir)/lib; \
  fi
endef

define $(package)_postprocess_cmds
  rm -rf native/lib/ lib/lib*.la
endef
