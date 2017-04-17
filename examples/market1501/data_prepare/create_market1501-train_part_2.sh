#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=examples/market1501
DATA=examples/market1501/image_list
TOOLS=build/tools

ANCHOR_TRAIN_DATA_ROOT=/home/dlutdip/caffe-master/examples/market1501/Market-1501-v15.09.15/bounding_box_train
POS_TRAIN_DATA_ROOT=/home/dlutdip/caffe-master/examples/market1501/Market-1501-v15.09.15/bounding_box_train
NEG_TRAIN_DATA_ROOT=/home/dlutdip/caffe-master/examples/market1501/Market-1501-v15.09.15/bounding_box_train
# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$ANCHOR_TRAIN_DATA_ROOT" ]; then
  echo "Error: ANCHOR_TRAIN_DATA_ROOT is not a path to a directory: $ANCHOR_TRAIN_DATA_ROOT"
  echo "Set the ANCHOR_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$POS_TRAIN_DATA_ROOT" ]; then
  echo "Error: POS_TRAIN_DATA_ROOT is not a path to a directory: $POS_TRAIN_DATA_ROOT"
  echo "Set the POS_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$NEG_TRAIN_DATA_ROOT" ]; then
  echo "Error: NEG_TRAIN_DATA_ROOT is not a path to a directory: $NEG_TRAIN_DATA_ROOT"
  echo "Set the NEG_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

echo "Creating anchor-train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --backend="lmdb" \
    $ANCHOR_TRAIN_DATA_ROOT \
    $DATA/part-2-anchor-train.txt \
    $EXAMPLE/market1501_anchor_train_lmdb_part_2

echo "Creating pos-train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --backend="lmdb" \
    $POS_TRAIN_DATA_ROOT \
    $DATA/part-2-pos-train.txt \
    $EXAMPLE/market1501_pos_train_lmdb_part_2

echo "Creating neg-train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --backend="lmdb" \
    $NEG_TRAIN_DATA_ROOT \
    $DATA/part-2-neg-train.txt \
    $EXAMPLE/market1501_neg_train_lmdb_part_2

echo "Done."
