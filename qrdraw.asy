unitsize(1cm);
pair imsize = (210mm,297mm);
//pair imsize = (210mm,210mm);
size(imsize.x,imsize.y);

import matdraw;
access data;

//int[][] testmat = {
//    {6,0,1,0,4},
//    {0,6,3,0,0},
//    {2,4,2,4,2},
//    {0,0,3,6,0},
//    {4,0,1,0,5}
//};

real msize = min(imsize.x/2., imsize.y/3.);

for (int i=0;i<data.mulmat.length;++i){
    int[][] mat = data.mulmat[i];
    picture im = drawmat(mat);
    pen p = linewidth(0.001);
    draw(im, shift(.5,.5)*scale(1.1)*box, p);
    frame f = im.fit();
    transform trans = shift(msize*(i%2),msize*floor(i/2))*scale(msize*.9);
    add(trans*f);
}
