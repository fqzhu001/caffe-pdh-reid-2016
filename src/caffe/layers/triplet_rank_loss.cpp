#include <algorithm>
#include <vector>

#include "caffe/layer.hpp"
#include "caffe/loss_layers.hpp"
#include "caffe/util/io.hpp"
#include "caffe/util/math_functions.hpp"
//#include<iostream>

namespace caffe {

	template <typename Dtype>
	void TripletRankLossLayer<Dtype>::LayerSetUp(
		const vector<Blob<Dtype>*>& bottom, const vector<Blob<Dtype>*>& top) {                    
		LossLayer<Dtype>::LayerSetUp(bottom, top);               //caffe2中已经没有SetUp，而是用LayerSetUp替代
	}
	template <typename Dtype>
  	void TripletRankLossLayer<Dtype>::Reshape(const vector<Blob<Dtype>*>& bottom,
      		const vector<Blob<Dtype>*>& top) {
		LossLayer<Dtype>::Reshape(bottom, top);
		top[0]->Reshape(1, 1, 1, 1);
	}
	template <typename Dtype>
	void TripletRankLossLayer<Dtype>::Forward_cpu(
		const vector<Blob<Dtype>*>& bottom,
		const vector<Blob<Dtype>*>& top) {

		const Dtype* bottom_data = bottom[0]->cpu_data();
		const Dtype* bottom_data_s = bottom[1]->cpu_data();
		const Dtype* bottom_data_d = bottom[2]->cpu_data();
		int num = bottom[0]->num();
		int dim = bottom[0]->count() / bottom[0]->num();
		Dtype margin = this->layer_param_.triplet_rank_loss_param().margin();
		Dtype loss = 0;
		for (int i = 0; i < num; ++i) {
			Dtype norm1 = 0, norm2 = 0;
			for (int j = 0; j < dim; ++j){
				norm1 += pow((bottom_data[i*dim + j] - bottom_data_s[i*dim + j]), 2);
				norm2 += pow((bottom_data[i*dim + j] - bottom_data_d[i*dim + j]), 2);
                                //if (i==0)
                                //     std::cout<<j<<"  "<<"anchor:"<<bottom_data[i*dim + j]<<"    pos:"<<bottom_data_s[i*dim + j]<<"    pow:"<<pow((bottom_data[i*dim + j] - bottom_data_s[i*dim + j]), 2)<<std::endl;
			}
			if (margin + norm1 - norm2 > 0){
				loss += margin + norm1 - norm2;
			}
		}

		top[0]->mutable_cpu_data()[0] = loss / num;
		//return loss / num;
	}

	template <typename Dtype>
	void TripletRankLossLayer<Dtype>::Backward_cpu(const vector<Blob<Dtype>*>& top,
		const vector<bool>& propagate_down, const vector<Blob<Dtype>*>& bottom) {
		const Dtype* bottom_data = bottom[0]->cpu_data();
		const Dtype* bottom_data_s = bottom[1]->cpu_data();
		const Dtype* bottom_data_p = bottom[2]->cpu_data();
		Dtype* diff = bottom[0]->mutable_cpu_diff();
		Dtype* diff_s = bottom[1]->mutable_cpu_diff();
		Dtype* diff_p = bottom[2]->mutable_cpu_diff();

		memset(diff, 0, bottom[0]->count()*sizeof(Dtype));
		memset(diff_s, 0, bottom[1]->count()*sizeof(Dtype));
		memset(diff_p, 0, bottom[2]->count()*sizeof(Dtype));

		int num = bottom[0]->num();
		int dim = bottom[0]->count() / bottom[0]->num();
		Dtype margin = this->layer_param_.triplet_rank_loss_param().margin();

		//Dtype loss = 0;
		for (int i = 0; i < num; ++i) {
			Dtype norm1 = 0, norm2 = 0;
			for (int j = 0; j < dim; ++j){
				norm1 += pow((bottom_data[i*dim + j] - bottom_data_s[i*dim + j]), 2);
				norm2 += pow((bottom_data[i*dim + j] - bottom_data_p[i*dim + j]), 2);
			}
			if (margin + norm1 - norm2 > 0){
				for (int j = 0; j < dim; ++j){
					diff[i*dim + j] += 2 * (bottom_data_p[i*dim + j] - bottom_data_s[i*dim + j]);
					diff_s[i*dim + j] += 2 * (bottom_data_s[i*dim + j] - bottom_data[i*dim + j]);
					diff_p[i*dim + j] += 2 * (bottom_data[i*dim + j] - bottom_data_p[i*dim + j]);
				}
			}

		}
		//LOG(INFO) <<"1. " << bottom_data[0] << "  " << bottom_data[1] << "  " << bottom_data[2];
		//LOG(INFO) <<"2. " << bottom_data_s[0] << "  " << bottom_data_s[1] << "  " << bottom_data_s[2];
		//LOG(INFO) <<"3. " << bottom_data_p[0] << "  " << bottom_data_p[1] << "  " << bottom_data_p[2];

		// Scale down gradient
		caffe_scal(bottom[0]->count(), Dtype(1) / num / margin, diff);
		caffe_scal(bottom[1]->count(), Dtype(1) / num / margin, diff_p);
		caffe_scal(bottom[2]->count(), Dtype(1) / num / margin, diff_s);


	}

#ifdef CPU_ONLY
	STUB_GPU(TripletRankLossLayer);
#endif

INSTANTIATE_CLASS(TripletRankLossLayer);
REGISTER_LAYER_CLASS(TripletRankLoss);
}  // namespace caffe
