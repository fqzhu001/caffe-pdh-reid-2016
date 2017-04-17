TOOLS=./build/tools

$TOOLS/caffe train \
    --solver=examples/market1501/prototxt/solver_PDH_part_2_512bit.prototxt \
    --weights=models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel  
