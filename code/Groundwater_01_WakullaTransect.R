source(file.path("code", "paths+packages.R"))


#Load in CSV Files along transect

data_path_Jackson<- file.path("data", "UFA", "GW_LakeJackson.CSV")
df_Jackson<- readr::read_csv(data_path_Jackson, col_types = cols())

data_path_Bradford<- file.path("data", "UFA", "GW_BradfordBrook.CSV")
df_Bradford<- readr::read_csv(data_path_Bradford, col_types = cols())

data_path_Sullivan<- file.path("data", "UFA", "GW_SullivanSinkANF_2014-2020.CSV")
df_Sullivan<- readr::read_csv(data_path_Sullivan, col_types = cols())

data_path_Wakulla<- file.path("data", "UFA", "GW_WakullaSprings.CSV")
df_Wakulla<- readr::read_csv(data_path_Wakulla, col_types = cols())

#Clean up Data frame
df_Jackson<-df_Jackson[-1,]
names(df_Jackson)[1]<-"Date"
names(df_Jackson)[2]<-"Stage_ft"
df_Jackson<-subset(df_Jackson, select = c(Date, Stage_ft))
df_Jackson[1]<-as.POSIXct(df_Jackson$Date, format = '%Y-%m-%d %H:%M:%S')
df_Jackson[2]<-as.numeric(df_Jackson$Stage_ft)

#Clean up Data frame
df_Bradford<-df_Bradford[-1,]
names(df_Bradford)[1]<-"Date"
names(df_Bradford)[2]<-"Stage_ft"
df_Bradford<-subset(df_Bradford, select = c(Date, Stage_ft))
df_Bradford[1]<-as.POSIXct(df_Bradford$Date, format = '%Y-%m-%d %H:%M:%S')
df_Bradford[2]<-as.numeric(df_Bradford$Stage_ft)

#Clean up Data frame
df_Sullivan<-df_Sullivan[-1,]
names(df_Sullivan)[1]<-"Date"
names(df_Sullivan)[2]<-"Stage_ft"
df_Sullivan<-subset(df_Sullivan, select = c(Date, Stage_ft))
df_Sullivan[1]<-as.POSIXct(df_Sullivan$Date, format = '%Y-%m-%d %H:%M:%S')
df_Sullivan[2]<-as.numeric(df_Sullivan$Stage_ft)

#Clean up Data frame
df_Wakulla<-df_Wakulla[-1,]
names(df_Wakulla)[1]<-"Date"
names(df_Wakulla)[2]<-"Stage_ft"
df_Wakulla<-subset(df_Wakulla, select = c(Date, Stage_ft))
df_Wakulla[1]<-as.POSIXct(df_Wakulla$Date, format = '%Y-%m-%d %H:%M:%S')
df_Wakulla[2]<-as.numeric(df_Wakulla$Stage_ft)


TransectTimeseries<-ggplot()+
  geom_point(data = df_Jackson, aes(x=Date, y=Stage_ft, colour="Jackson"), color= col.cat.blu)+
  geom_point(data = df_Bradford, aes(x=Date, y= Stage_ft, colour= "Bradford"), color=col.cat.red)+
  geom_point(data = df_Sullivan, aes(x=Date, y=Stage_ft, colour = "Sullivan"), color = col.cat.grn)+
  geom_point(data = df_Wakulla, aes(x=Date, y= Stage_ft, colour = "Wakulla"), color = col.cat.org)

TransectTimeseries
