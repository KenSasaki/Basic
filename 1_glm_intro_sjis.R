#���W�X�e�B�b�N��A

## ���[�L���O�f�B���N�g����ݒ肵�܂��傤
## Session -> Set Working Directory -> Choose Directory

## �܂��f�[�^��ǂݍ��݂܂�
hr_data<-read.csv("data/HR_comma_sep.csv")

#�w�K�f�[�^�ƃe�X�g�f�[�^�ɕ������Ă����܂��i���Ƃŗ\���̃f���̂��߁j
train_idx<-sample(c(1:dim(hr_data)[1]), size = dim(hr_data)[1]*0.7)
train<-hr_data[train_idx, ]
test<-hr_data[-train_idx, ]

head(hr_data)

## ���W�X�e�B�b�N��A������Ă݂܂��傤
hr_data.lr<-glm(left?satisfaction_level+
                  average_montly_hours+
                  sales, data=train, family="binomial")

## ���`��A�Ɠ����悤��summary�Ŋe�퓝�v�l������܂��B
summary(hr_data.lr)


## �I�b�Y��̌v�Z
exp(hr_data.lr$coefficients)


#McFadden�̋^������W��
# install.packages("pscl")
library(pscl)
pR2(hr_data.lr)


## (���Q�l) F����̑���ɖޓx�䌟��
null_hr_data.lr<-glm(left?1, data=train, family="binomial")
anova(hr_data.lr, null_hr_data.lr, test = "LRT")


## �\��
#Log Odds��\������
ypred<-predict(hr_data.lr, newdata = test, type="link")
ypred

#�m����\������
ypred<-predict(hr_data.lr, newdata = test, type="response")
hist(ypred)

#�����m�����t���O�ɕϊ��������ꍇ�́A臒l�����߂�K�v������
mean(ypred)
ypred_flag<-ifelse(ypred > 0.23, 1, 0)

# confusion matrix�����
conf_mat<-table(test$left, ypred_flag)
conf_mat

# ����
accuracy<-(conf_mat[1] + conf_mat[4]) /(conf_mat[1] + conf_mat[2] + conf_mat[3] + conf_mat[4])
accuracy

# �K����(precision)
precision<-conf_mat[1] / (conf_mat[1] + conf_mat[2])
precision

# �Č���(Recall)
recall<-conf_mat[1]/ (conf_mat[1] + conf_mat[3]) 
recall

# F�l(F - Measure)
f_measure <- 2*precision*recall/(precision+recall)
f_measure