##### Basic Day1 ####

#�܂��́A�ȉ��̃f�[�^��ǂݍ���ł�������
train <- read.csv('train.csv')
test <- read.csv('test.csv')
#working directory�̐ݒ�ɒ��ӂ��Ă��������I

#����́A'Name','Ticket','Cabin'�͕ϐ��Ƃ��čl���Ȃ��̂Ŕr�����܂�
train <- train[,-c(4,9,11)]
test <- test[,-c(3,8,10)]


#��1.(�O����)

# 1)train�f�[�^��'Age','Embarked��'������⊮���Ȃ���



# 2)test�f�[�^��'Age','Fare'�̌�����⊮���Ȃ���



# 3)'Pclass','Sex','Embarked'���_�~�[�ϐ��ɂ��Ȃ���



# 4)'Pclass', 'Sex', 'Embarked', 'Age', 'Fare', 'SibSp', 'Parch'��
#    �g���ĐV���ȕϐ���1���Ȃ����B



# 5) 4)�ō�����ϐ��ƁA'Pclass', 'Sex', 'Embarked', 'Age', 'Fare', 
#   'SibSp', 'Parch'������ϐ��ASurvived��ړI�ϐ��ɂ��ă��W�X�e�B�b�N��A���f��
#    �����Ȃ���



# 6)�쐬�������W�X�e�B�b�N��A�̉��߂��s���Ȃ���



# 7)�쐬�������W�X�e�B�b�N��A���f����p���āAtest�f�[�^��Survived��\�����Ȃ����B



# 8)�Ō�ɗ\���������ʂ�Kaggle�ɒ�o���A�Z�o���ꂽ�X�R�A���L�q���Ȃ����B

####################################################
##               Kaggle�̒�o���@                 ##
####################################################
# �\���������ʂ��ȉ���create_submission_df�֐��ɓ���Ă��������B����ƁA��o�p��csv�t�@�C�����f�X�N�g�b�v�ɏo�͂���܂��B
# https://www.kaggle.com/c/titanic/submit �ɃA�N�Z�X���āA'Upload Submission File'��csv�t�@�C�����A�b�v���[�h���Ă��������B
# �Ō��'Make Submission'���N���b�N����ƁA�X�R�A�����b��ɕ\������܂��B



#��o�pcsv�t�@�C�����쐬�E�o�͂���֐�
create_submission_df <- function(predict){
  submission_df <- data.frame(PassengerId=test$PassengerId, Survived=predict)
  write.csv(submission_df, '?/Desktop/titanic_predict_result.csv', row.names=FALSE)
}

#���ʂ̒��ɗ\�������ϐ������Ă�������
create_submission_df()  
#��) create_submission_df(predict_survived)