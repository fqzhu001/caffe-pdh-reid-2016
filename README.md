# caffe-pdh-reid-2016

A [caffe](https://github.com/BVLC/caffe)-based implementation for the baseline and proposed PDH method, providing whole training, testing and evaluation codes on Market-1501 dataset.
The compile of Caffe can be reffered at the [caffe](https://github.com/BVLC/caffe).
Note: If you have complie problem, please remove the folder 'examples/market1501/evaluate/KISSME'
## Data Preparation
- download Market-1501 dataset(http://www.liangzheng.com.cn) and `ln -s $Market-1501 examples/market1501/`
- download imagenet pre-train caffemodel (http://dl.caffe.berkeleyvision.org/bvlc_reference_caffenet.caffemodel) and `ln -s $caffemodel models/bvlc_reference_caffenet/`

## Directions

The prototxt can be found in `examples/market1501/prototxt`.

Extract features for query and bounding_box_test can be found in `examples/market1501/feature_extract`.

The trained models can be saved in `examples/market1501/snapshot`, the folder "snapshot" will be built by yourself.

Evaluation can be found in `examples/market1501/evaluation`.



### baseline
- run `examples/market1501/data_prepare/create_market1501-train_baseline.sh` to generate training lmdb data for training CNN model
- run `examples/market1501/train_baseline_512bit.sh` for training CNN model at the length of 512 bits hash codes
- run `examples/market1501/feature_extract/extract_query_baseline.py` and `examples/market1501/feature_extract/extract_test_baseline.py` for extracting features of query and test data
- run `examples/market1501/hashcode_query_512bit_baseline.m` and `examples/market1501/hashcode_test_512bit_baseline.m` for generating binary hash codes of query and test data
- run `examples/market1501/evaluation/main_single_query.m` to evaluate the performance of baseline on Market-1501
- final results are : mAP = 0.1237, r1 precision = 0.2536 [Hamming distance] Note: this work was done in late 2015 when the baseline performance is relatively low. However, our following PDH method achieved a significantly improvement compared with baseline.

### proposed PDH method (Note: we just take dividing the entire image into overlap 4 parts for example.)
- run `examples/market1501/data_prepare/generate_parts.m` to generate 4 parts for each image and save in folders named `part_1`, `part_2`, `part_3` and `part_4`, under the path `examples/market1501/Market-1501-v15.09.15/bounding_box_train`, `examples/market1501/Market-1501-v15.09.15/query` and `examples/market1501/Market-1501-v15.09.15/bounding_box_test`respectively
- run `create_market1501-train_part_1.sh`, `create_market1501-train_part_2.sh`, `create_market1501-train_part_3.sh` and `create_market1501-train_part_4.sh` to generate training lmdb data for training part-based CNN model 
- run `examples/market1501/train_PDH_part_1.sh`, `examples/market1501/train_PDH_part_2.sh`, `examples/market1501/train_PDH_part_3.sh` and `examples/market1501/train_PDH_part_4.sh` sequentially for training part-based CNN model
- run `examples/market1501/feature_extract/PDH_extract_query.py` and `examples/market1501/feature_extract/PDH_extract_test.py` for extracting features of query and test data
- run `examples/market1501/PDH_extract_hashcode_query.m` and `examples/market1501/PDH_extract_hashcode_test.m` for generating binary hash codes of query and test data (including hash codes concatenation)
- run `examples/market1501/evaluation/main_single_query.m` to evaluate the performance of the proposed PDH method on Market-1501
- final results are : mAP = 0.2606, r1 precision = 0.4789 [Hamming distance]

# Citation
Please cite this paper in your publications if it helps your research:
```
@article{zhu2017part-based,
  title={Part-based Deep Hashing for Large-scale Person Re-identification},
  author={Zhu, Fuqing and Kong, Xiangwei and Zheng, Liang and Fu, Haiyan and Tian, Qi},
  journal={IEEE transactions on image processing},
  year={2017}
}
```

If you have any problem, please contact me at fqzhu001@gmail.com.


# Caffe

[![Build Status](https://travis-ci.org/BVLC/caffe.svg?branch=master)](https://travis-ci.org/BVLC/caffe)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](LICENSE)

Caffe is a deep learning framework made with expression, speed, and modularity in mind.
It is developed by the Berkeley Vision and Learning Center ([BVLC](http://bvlc.eecs.berkeley.edu)) and community contributors.

Check out the [project site](http://caffe.berkeleyvision.org) for all the details like

- [DIY Deep Learning for Vision with Caffe](https://docs.google.com/presentation/d/1UeKXVgRvvxg9OUdh_UiC5G71UMscNPlvArsWER41PsU/edit#slide=id.p)
- [Tutorial Documentation](http://caffe.berkeleyvision.org/tutorial/)
- [BVLC reference models](http://caffe.berkeleyvision.org/model_zoo.html) and the [community model zoo](https://github.com/BVLC/caffe/wiki/Model-Zoo)
- [Installation instructions](http://caffe.berkeleyvision.org/installation.html)

and step-by-step examples.

[![Join the chat at https://gitter.im/BVLC/caffe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BVLC/caffe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Please join the [caffe-users group](https://groups.google.com/forum/#!forum/caffe-users) or [gitter chat](https://gitter.im/BVLC/caffe) to ask questions and talk about methods and models.
Framework development discussions and thorough bug reports are collected on [Issues](https://github.com/BVLC/caffe/issues).

Happy brewing!

## License and Citation

Caffe is released under the [BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE).
The BVLC reference models are released for unrestricted use.

Please cite Caffe in your publications if it helps your research:

    @article{jia2014caffe,
      Author = {Jia, Yangqing and Shelhamer, Evan and Donahue, Jeff and Karayev, Sergey and Long, Jonathan and Girshick, Ross and Guadarrama, Sergio and Darrell, Trevor},
      Journal = {arXiv preprint arXiv:1408.5093},
      Title = {Caffe: Convolutional Architecture for Fast Feature Embedding},
      Year = {2014}
    }
