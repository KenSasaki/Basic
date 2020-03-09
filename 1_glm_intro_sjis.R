#ロジスティック回帰

## ワーキングディレクトリを設定しましょう
## Session -> Set Working Directory -> Choose Directory

## まずデータを読み込みます
hr_data<-read.csv("data/HR_comma_sep.csv")

#学習データとテストデータに分割しておきます（あとで予測のデモのため）
train_idx<-sample(c(1:dim(hr_data)[1]), size = dim(hr_data)[1]*0.7)
train<-hr_data[train_idx, ]
test<-hr_data[-train_idx, ]

head(hr_data)

## ロジスティック回帰をやってみましょう
hr_data.lr<-glm(left?satisfaction_level+
                  average_montly_hours+
                  sales, data=train, family="binomial")

## 線形回帰と同じようにsummaryで各種統計値が見れます。
summary(hr_data.lr)


## オッズ比の計算
exp(hr_data.lr$coefficients)


#McFaddenの疑似決定係数
# install.packages("pscl")
library(pscl)
pR2(hr_data.lr)


## (ご参考) F検定の代わりに尤度比検定
null_hr_data.lr<-glm(left?1, data=train, family="binomial")
anova(hr_data.lr, null_hr_data.lr, test = "LRT")


## 予測
#Log Oddsを予測する
ypred<-predict(hr_data.lr, newdata = test, type="link")
ypred

#確率を予測する
ypred<-predict(hr_data.lr, newdata = test, type="response")
hist(ypred)

#もし確率をフラグに変換したい場合は、閾値を決める必要がある
mean(ypred)
ypred_flag<-ifelse(ypred > 0.23, 1, 0)

# confusion matrixを作る
conf_mat<-table(test$left, ypred_flag)
conf_mat

# 正解率
accuracy<-(conf_mat[1] + conf_mat[4]) /(conf_mat[1] + conf_mat[2] + conf_mat[3] + conf_mat[4])
accuracy

# 適合率(precision)
precision<-conf_mat[1] / (conf_mat[1] + conf_mat[2])
precision

# 再現率(Recall)
recall<-conf_mat[1]/ (conf_mat[1] + conf_mat[3]) 
recall

# F値(F - Measure)
f_measure <- 2*precision*recall/(precision+recall)
f_measure
