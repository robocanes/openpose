# This simple install script generates a build for OpenPose and establishes the models for further use.
# Dependency install
sudo apt install -y p7zip-full
sudo apt install -y caffe-cpu
./scripts/ubuntu/install_deps.sh

# Generate OpenPose Build
rm -rf build
mkdir build
cd build

# Use this if you need to change flag settings on run. For more permanent solution, edit CMakeLists.txt.
# cmake-gui ..
cmake ..
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

# Test binary
cd $OPENPOSE_PATH
./build/examples/openpose/openpose.bin --video examples/media/video.avi
