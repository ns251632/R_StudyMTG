##Section12: データ生成
#必要なデータ/パッケージの読み込み
library(tidyverse)
df <- read_csv("R_book_data.csv",  
               stringsAsFactors = F,                 #文字列から因子型(factor)へ変換しない
               na.strings = (c("NA", "NaN", "")),    #"NA"，"NaN"，""（空白：未記入）を欠測値とする
               locale = locale(encoding = 'UTF-8'))  #ファイルをUTF-8で読み込み
glimpse(df)  #データの確認


##Section13: Rで使うデータ型とデータ構造
install.packages("lubridate")
library(lubridate)

#日付データ：文字列（character）→日付（date）へ変更
df$Admday %>% as.Date() %>% ymd() -> df$Admday    #入院日（Admday）を，文字列型→日付型→年月日
df$Discday %>% as.Date() %>% ymd() -> df$Discday  #退院日（Discday）を，文字列型→日付型→年月日

class(df$Admday)   #クラスの確認
class(df$Discday)  #クラスの確認

glimpse(df)  #データの確認

#欠測値の確認
is.na(df)  #全ての値に対してT/Fの判定をして見づらい...

#変数（列）に欠測値があるか確認する
is_na_df <- sapply(df, function(y) any(is.na(y)))
is_na_df  #欠測値があるかT/Fで返す
na_count_df <- sapply(df, function(y) sum(is.na(y)))
na_count_df  #欠測値の個数を数える
