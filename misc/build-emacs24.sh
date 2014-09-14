set -x
sudo aptitude -y install git-core libxaw7-dev libxpm-dev libpng12-dev libtiff5-dev libgif-dev libjpeg8-dev libgtk2.0-dev libncurses5-dev autoconf automake texinfo
sudo apt-get build-dep emacs
git clone git://git.savannah.gnu.org/emacs.git
cd emacs/
git checkout emacs-24.3
git checkout -b custom_branch
./autogen.sh
./configure --prefix=/opt/emacs24
make --jobs=2
sudo make install
cd ..
rm -rf emacs
