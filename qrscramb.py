import numpy as np
from qrcode import QRCode
from subprocess import check_output

def qrnp(data):
    qr = QRCode(box_size=1, border=0)
    qr.add_data(data)
    return np.array(qr.get_matrix(), dtype=np.int64)

def clip():
    return check_output(['xclip', '-o']).decode('utf-8').strip()

def qrdecomp(data, nperms=6):
    mat = qrnp(data)
    perm = np.random.permutation(mat.size)

    decoms = []
    for perm in [perm[i::nperms] for i in range(nperms)]:
        dec = np.zeros_like(mat)
        dec.flat[perm] = mat.flat[perm]
        decoms.append(dec)

    return decoms

def main():
    pass

if __name__ == '__main__':
    main()
