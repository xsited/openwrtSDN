
#Building python gevent and greenlets 

Refs:

[OpenWRT building a single package](http://wiki.openwrt.org/doc/howtobuild/single.package)

[OpenWRT Buildroot - Usage](http://wiki.openwrt.org/doc/howto/build)

Skip optional section 3 - feeds

Do everything until make menuconfig

*including* install feeds:

	./scripts/feeds update -a
	./scripts/feeds install -a

copy in the gevent and greenlet dirs to package/. renaming greenlet to python-greenlet

edit .config to include the lines:

	CONFIG_PACKAGE_gevent=y
	CONFIG_PACKAGE_cython=y
	CONFIG_PACKAGE_python-greenlet=y

then make defconfig (this may be at wrong point??)

	make tools/install
	make toolchain/install
	make package/gevent/compile

This will fail
	
	cd build_dir/target-mips_r2_uClibc-0.9.33.2/gevent-1.0rc2
	make
	cd ..
	make package/gevent/compile
	make package/gevent/install
	make package/python-greenlet/compile
	make package/python-greenlet/install

The package should be in bin/ar71xx/packages/

