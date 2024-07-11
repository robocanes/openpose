# This simple install script generates a build for OpenPose and establishes the models for further use.
# Dependency install
sudo apt install -y p7zip-full
./scripts/ubuntu/install_deps.sh

# Generate OpenPose Build
rm -rf build
mkdir build
cd build

cmake-gui ..
make -j`nproc`
sudo make install

# This extracts the correct models (mirrors for OpenPose don't currently work).
cd $OPENPOSE_PATH/models_zip
7z x models.7z.001 -aoa

# Body
cp $OPENPOSE_PATH/models_zip/models/pose/body_25/pose_iter_584000.caffemodel $OPENPOSE_PATH/models/pose/body_25/pose_iter_584000.caffemodel

# Face
cp $OPENPOSE_PATH/models_zip/models/face/pose_iter_116000.caffemodel $OPENPOSE_PATH/models/face/pose_iter_116000.caffemodel

# Hand
cp $OPENPOSE_PATH/models_zip/models/hand/pose_iter_102000.caffemodel $OPENPOSE_PATH/models/hand/pose_iter_102000.caffemodel

rm -rf $OPENPOSE_PATH/models_zip/models

cd $OPENPOSE_PATH

# Test binary
./test_openpose.sh
