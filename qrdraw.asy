unitsize(1cm);
pair imsize = (50,50);
size(imsize.x,imsize.y);

import matdraw;

int[][] mat = {
    {6,0,1,0,4},
    {0,6,3,0,0},
    {2,4,2,4,2},
    {0,0,3,6,0},
    {4,0,1,0,5}
};


pen p = linewidth(0.5);
picture im = drawmat(mat);
frame f = im.fit();
add(scale(imsize.x,imsize.y)*f);
