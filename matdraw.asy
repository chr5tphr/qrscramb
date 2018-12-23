path pbox = (.0,.0)--(1.,0.)--(1.,1.)--(0.,1.)--cycle;
path box = shift(-.5,-.5) * pbox;
path hcirc = scale(.5) * unitcircle;
path tria = shift(0., -.2) * scale(.65) * polygon(3);
path dia = ((0,-.5)--(.5,0.)--(0.,.5)--(-.5,0.)--cycle);
path penta = scale(.5) * polygon(5);
path hexa = scale(.5) * polygon(6);

path chooseobj(int ident){
    if (ident == 1)
        return box;
    else if (ident == 2)
        return hcirc;
    else if (ident == 3)
        return tria;
    else if (ident == 4)
        return dia;
    else if (ident == 5)
        return penta;
    else if (ident == 6)
        return hexa;
    else
        return box;
}

picture drawmat(int[][] mat){
    picture im;

    pair size = (mat.length, mat[0].length);
    pair isize = (1./size.x, 1./size.y);

    //pen bg = gray(0.9);
    //pen p = linewidth(isize.x / 10);
    //draw(im, scale(1.1)*pbox, p);

    transform scl = scale(.9/size.x, .9/size.y);

    for (int i=0;i<mat.length;++i){
        for (int j=0;j<mat[i].length;++j){
            if (mat[i][j] > 0){
                transform shf = shift(realmult((j+.5,mat.length-1.-i+.5), isize));
                fill(im, shf*scl*chooseobj(mat[i][j]));
            }
        }
    }

    return im;
}
