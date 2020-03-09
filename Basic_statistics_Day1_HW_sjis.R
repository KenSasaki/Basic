##### Basic Day1 ####

#まずは、以下のデータを読み込んでください
train <- read.csv('train.csv')
test <- read.csv('test.csv')
#working directoryの設定に注意してください！

#今回は、'Name','Ticket','Cabin'は変数として考えないので排除します
train <- train[,-c(4,9,11)]
test <- test[,-c(3,8,10)]


#問1.(前処理)

# 1)trainデータの'Age','Embarkedの'欠損を補完しなさい



# 2)testデータの'Age','Fare'の欠損を補完しなさい



# 3)'Pclass','Sex','Embarked'をダミー変数にしなさい



# 4)'Pclass', 'Sex', 'Embarked', 'Age', 'Fare', 'SibSp', 'Parch'を
#    使って新たな変数を1つ作りなさい。



# 5) 4)で作った変数と、'Pclass', 'Sex', 'Embarked', 'Age', 'Fare', 
#   'SibSp', 'Parch'を説明変数、Survivedを目的変数にしてロジスティック回帰モデル
#    を作りなさい



# 6)作成したロジスティック回帰の解釈を行いなさい



# 7)作成したロジスティック回帰モデルを用いて、testデータのSurvivedを予測しなさい。



# 8)最後に予測した結果をKaggleに提出し、算出されたスコアを記述しなさい。

####################################################
##               Kaggleの提出方法                 ##
####################################################
# 予測した結果を以下のcreate_submission_df関数に入れてください。すると、提出用のcsvファイルがデスクトップに出力されます。
# https://www.kaggle.com/c/titanic/submit にアクセスして、'Upload Submission File'にcsvファイルをアップロードしてください。
# 最後に'Make Submission'をクリックすると、スコアが数秒後に表示されます。



#提出用csvファイルを作成・出力する関数
create_submission_df <- function(predict){
  submission_df <- data.frame(PassengerId=test$PassengerId, Survived=predict)
  write.csv(submission_df, '?/Desktop/titanic_predict_result.csv', row.names=FALSE)
}

#括弧の中に予測した変数を入れてください
create_submission_df()  
#例) create_submission_df(predict_survived)
