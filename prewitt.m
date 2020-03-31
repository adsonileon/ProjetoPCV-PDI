function p = prewitt(block)
block = double(block);
Gx = [-1  0  1;
      -1  0  1;
      -1  0  1];
Gy = [-1 -1 -1;
       0  0  0;
       1  1  1];
Gv = imfilter(block, Gx, 'replicate');
Gh = imfilter(block, Gy, 'replicate');
mGv = mean2(abs(Gv));
mGh = mean2(abs(Gh));
qGv = quantis(abs(Gv));
qGh = quantis(abs(Gh));
[magVH, dirVH] = imgradient(Gv, Gh);
mMagVH = mean2(magVH);
mDirVH = mean2(dirVH);
qMagVH = quantis(magVH);
qDirVH = quantis(dirVH);
Gx = [ 0  1  1;
      -1  0  1;
      -1 -1  0];
Gy = [-1 -1  0;
      -1  0  1;
       0  1  1];
Gur = imfilter(block, Gx, 'replicate');
Gul = imfilter(block, Gy, 'replicate');
mGur = mean2(abs(Gur));
mGul = mean2(abs(Gul));
qGur = quantis(abs(Gur));
qGul = quantis(abs(Gul));
[magD, dirD] = imgradient(Gur, Gul);
mMagD = mean2(magD);
mDirD = mean2(dirD);
qMagD = quantis(magD);
qDirD = quantis(dirD);
mGv_mGh = div(mGv,mGh);
mGv__mGh = dif(mGv,mGh);
mGv___mGh = dif(mGv_mGh(:,1),mGv_mGh(:,2));
qGv_qGh = div(qGv,qGh);
qGv__qGh = dif(qGv,qGh);
qGv___qGh = dif2(qGv_qGh);
mGur_mGul = div(mGur,mGul);
mGur__mGul = dif(mGur,mGul);
mGur___mGul = dif(mGur_mGul(:,1),mGur_mGul(:,2));
qGur_qGul = div(qGur,qGul);
qGur__qGul = dif(qGur,qGul);
qGur___qGul = dif2(qGur_qGul);
p = [mGv qGv mGh qGh mMagVH qMagVH mDirVH qDirVH mGur qGur mGul qGul mMagD qMagD mDirD qDirD mGv_mGh mGv__mGh mGv___mGh qGv_qGh qGv__qGh qGv___qGh mGur_mGul mGur__mGul mGur___mGul qGur_qGul qGur__qGul qGur___qGul];
end