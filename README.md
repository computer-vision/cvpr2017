# A Linear Extrinsic Calibration of Kaleidoscopic Imaging System
By [Kosuke Takahashi](http://qtarou.github.io/index_en.html), Akihiro Miyata, Shohei Nobuhara, Takashi Matsuyama (Kyoto University)

## Introduction
This page provides an implementation of our linear extrinsic calibration method of kaleidoscpic imaging system reported in our [CVPR 2017 paper](https://arxiv.org/abs/1703.02826).

Contact: [Kosuke Takahashi](takahasi.vision@kuee.kyoto-u.ac.jp)


## How to use the demo program (Matlab)
After downloading the code and changing the working directory to 'cvpr2017/matlab', please run following command.

    demo.m

Then you will see following outputs.

    Average reprojection error by proposed method : 7.529149 pixel.
    Average reprojection error by proposed method (with non-linear refinement) : 4.427483 pixel.
    
    === Parameters by proposed method ===
    ---     n1,       n2,       n3 ---
    
    ans =
    
        0.1978   -0.9305    0.7750
       -0.9772    0.3620    0.6296
       -0.0770   -0.0553   -0.0547
    
    ---     d1,       d2,       d3 ---
    
    ans =
    
        1.0000    0.7775    0.8656
    
    === Parameters by proposed method (with non-linear refinement) ===
    ---     n1,       n2,       n3 ---
    
    ans =
    
        0.1976   -0.9298    0.7759
       -0.9766    0.3602    0.6272
       -0.0855   -0.0750   -0.0683
    
    ---     d1,       d2,       d3 ---
    
    ans =
    
        1.0000    0.8602    0.9050

In this result, n_i and d_i (i = 1,2,3) denote the mirror normals and distances respectively. Figure 1 visualizes estimated mirror parameters and 3D positions of a single reference point and its reflections. The each colored line with a legend 'Mirror i' represents a perpendicular line to each mirror, as d_i n_i.

Note:We tested our codes with Matlab R2016a.
 
## How to use the code with your own configuration


## Citation
Please cite the paper in your publications if it helps your research:

     @inproceedings{takahashi2017linear,
        author = {Kosuke Takahashi, Akihiro Miyata, Shohei Nobuhara and Takashi Matsuyama},
        booktitle = {CVPR},
        title = {A Linear Extrinsic Calibration of Kaleidoscopic Imaging System from Single 3D Point},
        year = {2017}
     }
