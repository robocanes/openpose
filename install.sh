# This simple install script generates a build for OpenPose and establishes the models for further use.
rm -rf build
mkdir build
cd build

# Here (from default options when clicking CONFIGURE):
# ENABLE BUILD_PYTHON
# DISABLE ALL DOWNLOAD MODEL OPTIONS
# DISABLE USE_CUDNN
# Click GENERATE
cmake-gui ..
make -j`nproc`
sudo make install

cd ..

# This extracts the correct models (mirrors for OpenPose don't currently work).
cd models_zip
7z x models.7z.001

# Body
mv $OPENPOSE_PATH/models_zip/models/pose/body_25/pose_iter_584000.caffemodel $OPENPOSE_PATH/models/pose/body_25/pose_iter_584000.caffemodel

# Face
mv $OPENPOSE_PATH/models_zip/models/face/pose_iter_116000.caffemodel $OPENPOSE_PATH/models/face/pose_iter_116000.caffemodel

# Hand
mv $OPENPOSE_PATH/models_zip/models/hand/pose_iter_102000.caffemodel $OPENPOSE_PATH/models/hand/pose_iter_102000.caffemodel
