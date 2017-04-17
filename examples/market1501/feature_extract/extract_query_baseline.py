import numpy as np
import sys
import os
from os import path
caffe_root = '/home/dlutdip/caffe-master/'
sys.path.insert(0, caffe_root + 'python')
import caffe
caffe.set_mode_gpu()
net = caffe.Classifier(caffe_root + 'examples/market1501/prototxt/deploy.prototxt',caffe_root + 'examples/market1501/snapshot/baseline_512bit_iter_20000.caffemodel', caffe.TEST)
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
transformer.set_transpose('data', (2,0,1))
transformer.set_mean('data', np.load(caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy').mean(1).mean(1)) 
transformer.set_raw_scale('data', 255) 
transformer.set_channel_swap('data', (2,1,0)) 
def get_feature(img_file):
        net.blobs['data'].data[...] = transformer.preprocess('data', caffe.io.load_image(img_file))
        net.forward()
        scores = net.blobs['hash'].data[0]
        return scores
def extract_dir():
	f_images=open('/home/dlutdip/caffe-master/examples/market1501/image_list/query_list.txt','rb')
	images_root=f_images.readlines()
	i = 0
        for images_ in images_root:
                print i
		i = i + 1
                img_nameStr = images_[0:len(images_)-1]                	
                feature = get_feature(img_nameStr)			
                f = open('/home/dlutdip/caffe-master/examples/market1501/feature_extract/query_baseline_512dim','ab')
 	        f.write(feature)
        	f.close()
	f_images.close()
extract_dir()

