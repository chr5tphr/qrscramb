import numpy as np
from qrcode import QRCode
from subprocess import check_output

def qrnp(data):
    qr = QRCode(box_size=1, border=0)
    qr.add_data(data)
    return np.array(qr.get_matrix(), dtype=np.int64)

def clip():
    return check_output(['xclip', '-o']).decode('utf-8').strip()

def randsyms(data, nsyms=6):
    return np.random.randint(1, nsyms+1, size=data.shape, dtype=data.dtype) * data

def qrdecomp(data, nperms=6, nsyms=6):
    mat = randsyms(qrnp(data), nsyms=nsyms)
    perm = np.random.permutation(mat.size)

    decoms = []
    for perm in [perm[i::nperms] for i in range(nperms)]:
        dec = np.zeros_like(mat)
        dec.flat[perm] = mat.flat[perm]
        decoms.append(dec)

    return decoms

def mattify(arr):
    return 'int[][] mat = {\n%s\n};'%',\n'.join(['{%s}'%','.join(['%d'%elem for elem in row]) for row in arr]);

def multify(arr):
    return 'int[][][] mulmat = {\n%s\n};'%',\n'.join(['{\n%s\n}'%',\n'.join(['{%s}'%','.join(['%d'%elem for elem in row]) for row in mat]) for mat in arr]);

def main():
    pass

if __name__ == '__main__':
    main()
