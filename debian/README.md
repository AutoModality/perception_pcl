# Debian packaging for PCL 


# Requirements

This version of library has cuda functionlity enabled. Therefore, make sure you have cuda installed on your machine, and the related environment variables are set. The followings are the environment variables for cuda >= 10.0 (copy and paste the followings into your .bashrc)

export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin

## Generate Binary


Prerequisites:

```
  apt-get -y \
      debhelper 
```

From the root of the project:
```https://cloudsmith.io/~automodality/repos/release/packages
fakeroot debian/rules binary
```

The binary will be produced in the directory above the project root.  

```
../pcl_1.9.1-1_amd64.deb
```

This file should be manually uploaded to the appropriate [cloudsmith repository](https://cloudsmith.io/~automodality/repos/release/packages).

Versions are maintained in the `debian/changelog` file.  Incremental versioning should be used with a hyphen separation keeping the prefix version the same as the PCL tag version. 

```
pcl (1.9.1-1) unstable; urgency=medium
pcl (1.9.1-2) unstable; urgency=medium
pcl (1.9.1-3) unstable; urgency=medium
...

pcl (1.11.0-1) unstable; urgency=medium
pcl (1.11.0-2) unstable; urgency=medium
...
```

Targeting different CUDA versions?  TBD, but likely an additional variant would be added to the version suffix (`1.9.1-cuda-6.2-1`).

### Clean

Rebuild debian artifact:

```
debian/rules clean
```

Recompile:

```
rm -rf build
```

# How It Works

The debian packaging mostly scripts the recommended directions for compiling PCL, which stages all build files in the `build` directory.  
Instead of using the "Install" on each machine separately, we
package the build artifacts into a standard debian package.  Specifically, these directories are included:

* bin
* lib
* include
* share

To capture all of the files installed by PCL, we run the install on the build machine and then copy those directories into a staging directory: `debian/pcl`.
The debian artifact is created with the system architecture details in the meta description (AMD/ARM, etc). 

There is no continuous integration because it is not necessary for the few changes we make to these files.

