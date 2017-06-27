# A Linear Extrinsic Calibration of Kaleidoscopic Imaging System
By [Kosuke Takahashi](http://qtarou.github.io/index_en.html), Akihiro Miyata, Shohei Nobuhara, Takashi Matsuyama (Kyoto University)

## Introduction
This page provides an implementation of our linear extrinsic calibration method of kaleidoscpic imaging system reported in our [CVPR 2017 paper](https://arxiv.org/abs/1703.02826).

Our method linearly calibrates a kaleidoscopic imaging system, i.e. estimates mirror normals n_i (i=1,2,3) and distances d_i, from projections of a single 3D point and its reflections q_jk (j,k=1,2,3, j!=k) as in Figure 1. 

##### Figure 1
<img src="https://github.com/computer-vision/cvpr2017/wiki/images/teaser.jpg" width="480px" title="Figure 1">


Contact: [Kosuke Takahashi](http://qtarou.github.io/index_en.html) (takahasi@vision.kuee.kyoto-u.ac.jp)


## How to use the demo program (Matlab)
After downloading the code and changing the working directory to 'cvpr2017/matlab', please run following command.

    demo.m

Then you will see following outputs.

    Average reprojection error by proposed method : 7.283709 pixel.
    Average reprojection error by proposed method (with non-linear refinement) : 4.031378 pixel.
    
    === Parameters by proposed method ===
    ---     n1,       n2,       n3 ---
    
    ans =
    
        0.1979   -0.9305    0.7749
       -0.9772    0.3621    0.6297
       -0.0770   -0.0550   -0.0545

    ---     d1,       d2,       d3 ---

    ans =

        1.0000    0.7756    0.8645

    === Parameters by proposed method (with non-linear refinement) ===
    ---     n1,       n2,       n3 ---

    ans =

        0.1989   -0.9283    0.7768
       -0.9764    0.3609    0.6271
       -0.0837   -0.0893   -0.0575

    ---     d1,       d2,       d3 ---

    ans =

        1.0000    0.9569    0.8488

##### Figure 2
<img src="https://github.com/computer-vision/cvpr2017/wiki/images/result.jpg" width="480px">


In this result, n_i and d_i (i = 1,2,3) denote the mirror normals and distances respectively. Figure 2 visualizes estimated mirror parameters and 3D positions of a single reference point and its reflections. The each colored line with a legend 'Mirror i' represents a perpendicular line to each mirror, as d_i n_i.

Note:We tested our codes with Matlab R2016a.
 
## How to use the code with your own configuration
In order to calibrate your own system, please follow the process below. In short, after updating data/corners.txt and data/in_params.txt, run the demo program. Note that we assume that the kaleidoscopic imaging system is consists of **two** or **three** mirrors.

##### Figure 3
<img src="https://github.com/computer-vision/cvpr2017/wiki/images/chamber.jpg" width="480px">

1. Suppose you have a camera and a kaleidoscopic imaging system consists of two or three mirrors.
2. Capture a single 3D point and its reflections.
3. Suppose the 3D points and reflections are projected to *chambers* M_i (i=0,1,2,...) as illustrated in Figure 3. Detect them and obtain the 2D coordinates of them. Note that we assume that captured image is undistorted beforehand. 
4. Store the 2D coordinates into data/corners.txt as following format.

##### data/corener.txt

    (in case of using two mirrors)
    q_0(x) q_0(y) # a 2D coordinate of a projection in M_0      
    q_1(x) q_1(y) # a 2D coordinate of a projection in M_1      
    q_2(x) q_2(y) # a 2D coordinate of a projection in M_2      
    q_12(x) q_12(y) # a 2D coordinate of a projection in M_12      
    q_21(x) q_21(y) # a 2D coordinate of a projection in M_21  
    
    (in case of using three mirrors)
    q_0(x) q_0(y) # a 2D coordinate of a projection in M_0      
    q_1(x) q_1(y) # a 2D coordinate of a projection in M_1      
    q_2(x) q_2(y) # a 2D coordinate of a projection in M_2      
    q_3(x) q_3(y) # a 2D coordinate of a projection in M_3      
    q_12(x) q_12(y) # a 2D coordinate of a projection in M_12      
    q_13(x) q_13(y) # a 2D coordinate of a projection in M_13      
    q_21(x) q_21(y) # a 2D coordinate of a projection in M_21      
    q_23(x) q_23(y) # a 2D coordinate of a projection in M_23      
    q_31(x) q_31(y) # a 2D coordinate of a projection in M_31      
    q_32(x) q_32(y) # a 2D coordinate of a projection in M_32      
 

5. Store the intrinsic parmeters into data/in_params.txt as following format. (We estimated these parameters by zhang's method beforehand.)

##### data/in_params.txt

    focal_length_x              0 image_center_x
                 0 focal_length_y image_center_y
                 0              0              1


6. Set the number of mirrors to *num_of_mirror* in demo.m.
7. Exec the demo program again and you will get the result.

## Citation
Please cite the paper in your publications if it helps your research:

     @inproceedings{takahashi2017linear,
        author = {Kosuke Takahashi, Akihiro Miyata, Shohei Nobuhara and Takashi Matsuyama},
        booktitle = {CVPR},
        title = {A Linear Extrinsic Calibration of Kaleidoscopic Imaging System from Single 3D Point},
        year = {2017}
     }
